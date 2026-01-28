{ ... }:
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
    render-markdown = autoloaded;

    conform-nvim = {
      enable = true;
    };

    telescope = {
      enable = true;
    };

    lualine = {
      enable = true;
    };

    cmp = {
      enable = true;
    };

    treesitter = {
      enable = true;
    };
  };
}
