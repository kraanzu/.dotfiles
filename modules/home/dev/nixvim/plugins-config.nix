{ pkgs, ... }:
{
  plugins = {
    conform-nvim.settings.formatters_by_ft = {
      lua = [ "stylua" ];
      python = [ "ruff_format" ];
      go = [ "gofmt" ];
      sh = [ "shfmt" ];
      json = [ "jq" ];
      yaml = [ "prettier" ];
      markdown = [ "prettier" ];
    };

    telescope.keymaps = {
      "<C-p>" = "git_files";
      "g/" = "live_grep";
    };

    lualine.settings = {
      options = {
        section_separators = {
          left = "";
          right = "";
        };
        component_separators = {
          left = "";
          right = "";
        };
      };
      tabline = {
        lualine_a = [ "buffers" ];
      };
    };

    cmp = {
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        formatting = {
          fields = [
            "abbr"
            "kind"
          ];
        };
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
        };
      };
    };

    treesitter = {
      settings.highlight = {
        enable = true;
        additional_vim_regex_highlighting = true;
      };
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        markdown
        nix
        toml
        vim
        vimdoc
        xml
        yaml
        python
        go
        rust
      ];
    };
  };
}
