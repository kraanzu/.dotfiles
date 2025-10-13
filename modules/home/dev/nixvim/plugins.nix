{ pkgs, ... }:
let
  autoloaded = {
    enable = true;
    autoLoad = true;
  };
in
{
  plugins = {
    oil = autoloaded;
    neogit = autoloaded;
    web-devicons = autoloaded;
    indent-blankline = autoloaded;
    nvim-autopairs = autoloaded;
    colorizer = autoloaded;
    gitsigns = autoloaded;
    tagbar = autoloaded;
    commentary = autoloaded;
    lspkind = autoloaded;
    yanky = autoloaded;

    conform-nvim = {
      enable = true;
      settings.formatters_by_ft = {
        lua = [ "stylua" ];
        python = [ "ruff_format" ];
        go = [ "gofmt" ];
        sh = [ "shfmt" ];
        json = [ "jq" ];
        yaml = [ "prettier" ];
        markdown = [ "prettier" ];
      };
    };

    telescope = {
      enable = true;
      keymaps = {
        "<C-p>" = "git_files";
        "g/" = "live_grep";
      };
    };

    lualine = {
      enable = true;
      settings = {
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
    };

    cmp = {
      enable = true;
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
      enable = true;
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
