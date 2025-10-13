{
  plugins.lsp = {
    enable = true;
    servers = {
      basedpyright.enable = true;
      nil_ls.enable = true;
    };
  };
  diagnostic.settings = {
    virtual_text = true;
    update_in_insert = true;
    signs = {
      text = {
        __raw = ''
          {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          }
        '';
      };
    };
  };
}
