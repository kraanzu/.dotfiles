package main

import (
	"errors"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"sort"
	"strings"

	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"
)

const (
	ruleExtension = ".mdc"
	globalRule     = "global.mdc"
	destRelPath    = ".cursor/rules"
	envSourceDir   = "CURSORRULES_DIR"
)

// --- Nord palette ---

var (
	nord3  = lipgloss.Color("#4C566A")
	nord4  = lipgloss.Color("#D8DEE9")
	nord8  = lipgloss.Color("#88C0D0")
	nord11 = lipgloss.Color("#BF616A")
	nord14 = lipgloss.Color("#A3BE8C")
)

// --- Styles ---

var (
	titleStyle   = lipgloss.NewStyle().Foreground(nord8).Bold(true).MarginBottom(1)
	normalStyle  = lipgloss.NewStyle().Foreground(nord4)
	focusedStyle = lipgloss.NewStyle().Foreground(nord8).Bold(true)
	checkedStyle = lipgloss.NewStyle().Foreground(nord14)
	helpStyle    = lipgloss.NewStyle().Foreground(nord3).MarginTop(1)
	successStyle = lipgloss.NewStyle().Foreground(nord14).Bold(true)
	errorStyle   = lipgloss.NewStyle().Foreground(nord11).Bold(true)
)

// --- Domain types ---

// Rule represents a single .mdc rule file available for selection.
type rule struct {
	name     string // display name (filename without .mdc)
	filename string // full filename (e.g. "django.mdc")
	selected bool
}

// --- File operations ---

// resolveSourceDir returns the directory containing .mdc rule files.
// Checks CURSORRULES_DIR env var first, falls back to ~/.config/cursorrules/.
func resolveSourceDir() (string, error) {
	if dir := os.Getenv(envSourceDir); dir != "" {
		return dir, nil
	}
	home, err := os.UserHomeDir()
	if err != nil {
		return "", fmt.Errorf("resolve home directory: %w", err)
	}
	return filepath.Join(home, ".config", "cursorrules"), nil
}

// discoverRules lists all .mdc files in sourceDir, excluding global.mdc.
func discoverRules(sourceDir string) ([]rule, error) {
	entries, err := os.ReadDir(sourceDir)
	if err != nil {
		return nil, fmt.Errorf("read rules directory %s: %w", sourceDir, err)
	}

	var rules []rule
	for _, entry := range entries {
		if entry.IsDir() || !strings.HasSuffix(entry.Name(), ruleExtension) {
			continue
		}
		if entry.Name() == globalRule {
			continue
		}
		rules = append(rules, rule{
			name:     strings.TrimSuffix(entry.Name(), ruleExtension),
			filename: entry.Name(),
		})
	}
	sort.Slice(rules, func(i, j int) bool { return rules[i].name < rules[j].name })
	return rules, nil
}

// installedRuleFiles returns the set of .mdc filenames already in destDir.
func installedRuleFiles(destDir string) map[string]bool {
	installed := make(map[string]bool)
	entries, err := os.ReadDir(destDir)
	if err != nil {
		return installed
	}
	for _, entry := range entries {
		if !entry.IsDir() && strings.HasSuffix(entry.Name(), ruleExtension) {
			installed[entry.Name()] = true
		}
	}
	return installed
}

// copyFile copies a single file from src to dst.
func copyFile(src, dst string) error {
	in, err := os.Open(src)
	if err != nil {
		return fmt.Errorf("open %s: %w", src, err)
	}
	defer in.Close()

	out, err := os.Create(dst)
	if err != nil {
		return fmt.Errorf("create %s: %w", dst, err)
	}
	defer out.Close()

	if _, err := io.Copy(out, in); err != nil {
		return fmt.Errorf("copy %s -> %s: %w", src, dst, err)
	}
	return nil
}

// syncRules writes selected rules (plus global) to destDir
// and removes any previously installed rules that were unchecked.
func syncRules(sourceDir, destDir string, rules []rule) error {
	if err := os.MkdirAll(destDir, 0o755); err != nil {
		return fmt.Errorf("create directory %s: %w", destDir, err)
	}

	globalSrc := filepath.Join(sourceDir, globalRule)
	if _, err := os.Stat(globalSrc); err == nil {
		if err := copyFile(globalSrc, filepath.Join(destDir, globalRule)); err != nil {
			return err
		}
	}

	for _, r := range rules {
		dst := filepath.Join(destDir, r.filename)
		if r.selected {
			src := filepath.Join(sourceDir, r.filename)
			if err := copyFile(src, dst); err != nil {
				return err
			}
		} else {
			if err := os.Remove(dst); err != nil && !errors.Is(err, os.ErrNotExist) {
				return fmt.Errorf("remove %s: %w", dst, err)
			}
		}
	}

	return nil
}

// --- TUI model ---

type model struct {
	rules     []rule
	cursor    int
	sourceDir string
	destDir   string
	quitting  bool
	confirmed bool
}

func newModel() (model, error) {
	sourceDir, err := resolveSourceDir()
	if err != nil {
		return model{}, err
	}

	rules, err := discoverRules(sourceDir)
	if err != nil {
		return model{}, err
	}
	if len(rules) == 0 {
		return model{}, fmt.Errorf("no %s rules found in %s (besides %s)", ruleExtension, sourceDir, globalRule)
	}

	destDir := destRelPath
	installed := installedRuleFiles(destDir)
	for i := range rules {
		rules[i].selected = installed[rules[i].filename]
	}

	return model{
		rules:     rules,
		sourceDir: sourceDir,
		destDir:   destDir,
	}, nil
}

func (m model) Init() tea.Cmd { return nil }

func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	keyMsg, ok := msg.(tea.KeyMsg)
	if !ok {
		return m, nil
	}

	switch keyMsg.String() {
	case "q", "esc", "ctrl+c":
		m.quitting = true
		return m, tea.Quit
	case "up", "k":
		if m.cursor > 0 {
			m.cursor--
		}
	case "down", "j":
		if m.cursor < len(m.rules)-1 {
			m.cursor++
		}
	case " ":
		m.rules[m.cursor].selected = !m.rules[m.cursor].selected
	case "enter":
		m.confirmed = true
		return m, tea.Quit
	}

	return m, nil
}

func (m model) View() string {
	if m.quitting || m.confirmed {
		return ""
	}

	var b strings.Builder
	b.WriteString(titleStyle.Render("Cursor Rules"))
	b.WriteString("\n")

	for i, r := range m.rules {
		b.WriteString(renderRow(r, i == m.cursor))
		b.WriteString("\n")
	}

	b.WriteString(helpStyle.Render("space: toggle | enter: confirm | q: quit"))
	return b.String()
}

// renderRow produces a single styled line like "> [x] django" or "  [ ] python".
func renderRow(r rule, focused bool) string {
	pointer := "  "
	style := normalStyle

	if focused {
		pointer = focusedStyle.Render("> ")
		style = focusedStyle
	}
	if r.selected {
		style = checkedStyle
	}

	checkbox := style.Render("[ ] ")
	if r.selected {
		checkbox = checkedStyle.Render("[x] ")
	}

	return pointer + checkbox + style.Render(r.name)
}

// --- Entrypoint ---

func die(msg string) {
	fmt.Fprintln(os.Stderr, errorStyle.Render("Error: "+msg))
	os.Exit(1)
}

func selectedNames(rules []rule) []string {
	names := []string{"global"}
	for _, r := range rules {
		if r.selected {
			names = append(names, r.name)
		}
	}
	return names
}

func main() {
	m, err := newModel()
	if err != nil {
		die(err.Error())
	}

	result, err := tea.NewProgram(m).Run()
	if err != nil {
		die(err.Error())
	}

	final := result.(model)
	if final.quitting || !final.confirmed {
		return
	}

	if err := syncRules(final.sourceDir, final.destDir, final.rules); err != nil {
		die(err.Error())
	}

	names := selectedNames(final.rules)
	summary := fmt.Sprintf("Copied %d rules (%s) to %s", len(names), strings.Join(names, ", "), destRelPath)
	fmt.Println(successStyle.Render("✓ " + summary))
}
