{ }:
{
  autoCmd = [
    {
      event = "FileType";
      pattern = "NeogitStatus";
      callback.__raw = ''
        function(ev)
          if vim.env.IS_INSIDE_ZED then
            vim.api.nvim_create_autocmd("BufWinLeave", {
              buffer = ev.buf,
              callback = function()
                vim.schedule(function()
                  if #vim.api.nvim_list_wins() == 1 or #vim.fn.getbufinfo({ buflisted = 1 }) == 0 then
                    vim.cmd("qa")
                  end
                end)
              end,
            })
          end
        end
      '';
    }
  ];
}
