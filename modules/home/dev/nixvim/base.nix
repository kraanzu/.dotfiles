{ pkgs, ... }:
{
  colorschemes.nord = {
    enable = true;
    package = pkgs.vimPlugins.gbprod-nord;
  };

  clipboard.register = "unnamedplus";

  globals = {
    mapleader = " ";
    maplocalleader = " ";
    gitgutter_terminal_reports_focus = 0;
    vsnip_snippet_dir = "~/.config/vsnip";
  };

  filetype.pattern = {
    ".*%.mdc" = "markdown";
  };

  opts = {
    number = true;
    cursorline = true;
    backspace = "indent,eol,start";
    showmode = true;
    relativenumber = true;
    mouse = "a";
    scrolloff = 8;
    tabstop = 4;
    shiftwidth = 2;
    expandtab = true;
    hidden = true;
    smartcase = true;
    encoding = "utf-8";
    shell = "bash";
    completeopt = "menu,menuone,noselect";
    showcmd = false;
    updatetime = 100;
    signcolumn = "yes";
    termguicolors = true;
    termsync = false;
    undofile = true;
  };
}
