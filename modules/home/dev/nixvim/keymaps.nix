{
  keymaps =
    let
      normalModeKeys = [
        {
          key = "-";
          action = "<cmd>Oil<cr>";
        }
        {
          key = "<Up>";
          action = "<cmd>Neogit<cr>";
        }
        {
          key = "<Left>";
          action = "<Nop>";
        }
        {
          key = "<Right>";
          action = "<cmd>Neogit push<cr>";
        }
        {
          key = "<C-L>";
          action = "<cmd>nohlsearch<cr><C-L>";
          options.silent = true;
        }
        {
          key = "<Tab>";
          action = "<cmd>bn<cr>";
        }
        {
          key = "<S-Tab>";
          action = "<cmd>bp<cr>";
        }
        {
          key = "<C-q>";
          action = "<cmd>bd<cr>";
        }
        {
          key = "<Down>";
          action = "<cmd>TagbarToggle<cr>";
        }
        {
          key = "n";
          action = "nzzzv";
        }
        {
          key = "N";
          action = "Nzzzv";
        }
        {
          key = "J";
          action = "mzJ`z";
        }
        {
          key = "j";
          action = "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'";
          options.expr = true;
        }
        {
          key = "k";
          action = "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'";
          options.expr = true;
        }
        {
          key = "H";
          action = "^";
          mode = "n";
        }
        {
          key = "L";
          action = "$";
          mode = "n";
        }
        {
          key = "<leader>ff";
          action.__raw = ''
            function()
              require("conform").format({ lsp_fallback = true })
            end
          '';
        }
        {
          key = "[d";
          action = "<cmd>lua vim.diagnostic.goto_prev()<cr>";
        }
        {
          key = "]d";
          action = "<cmd>lua vim.diagnostic.goto_next()<cr>";
        }
        {
          key = "gD";
          action = "<cmd>lua vim.lsp.buf.declaration()<cr>";
        }
        {
          key = "gd";
          action = "<cmd>lua vim.lsp.buf.definition()<cr>";
        }
        {
          key = "<leader>rn";
          action = "<cmd>lua vim.lsp.buf.rename()<cr>";
        }
      ];

      insertModeKeys = [
        {
          key = "<C-l>";
          action = "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'";
          options.expr = true;
        }
        {
          key = ",";
          action = ",<c-g>u";
        }
        {
          key = ".";
          action = ".<c-g>u";
        }
        {
          key = "?";
          action = "?<c-g>u";
        }
      ];

      selectModeKeys = [
        {
          key = "<C-l>";
          action = "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'";
          options.expr = true;
        }
      ];

      visualModeKeys = [
        {
          key = "J";
          action = ":m '>+1<cr>gv=gv";
        }
        {
          key = "K";
          action = ":m '<-2<cr>gv=gv";
        }
      ];
    in
    (map (k: k // { mode = "n"; }) normalModeKeys)
    ++ (map (k: k // { mode = "i"; }) insertModeKeys)
    ++ (map (k: k // { mode = "s"; }) selectModeKeys)
    ++ (map (k: k // { mode = "v"; }) visualModeKeys);
}
