return {
  "linrongbin16/lsp-progress.nvim",
  config = function()
    require("lsp-progress").setup({
      client_format = function(client_name, spinner, series_messages)
        if #series_messages == 0 then
          return nil
        end
        return {
          name = client_name,
          body = spinner .. " " .. table.concat(series_messages, ", "),
        }
      end,
      format = function(client_messages)
        --- @param name string
        --- @param msg string?
        --- @return string
        local function stringify(name, msg)
          return msg and string.format("%s %s", name, msg) or name
        end

        local sign = "" -- nf-fa-gear \uf013
        local lsp_clients = vim.lsp.get_active_clients()
        local linters = require('lint').get_running()
        local combined_clients = {}

        -- Add LSP clients to the combined list
        for _, client in ipairs(lsp_clients) do
          table.insert(combined_clients, { name = client.name })
        end

        -- Add active linters to the combined list
        for _, linter in ipairs(linters) do
          table.insert(combined_clients, { name = linter })
        end

        local messages_map = {}
        for _, climsg in ipairs(client_messages) do
          messages_map[climsg.name] = climsg.body
        end

        if #combined_clients > 0 then
          table.sort(combined_clients, function(a, b)
            return a.name < b.name
          end)
          local builder = {}
          for _, cli in ipairs(combined_clients) do
            if type(cli) == "table" and type(cli.name) == "string" and string.len(cli.name) > 0 then
              if messages_map[cli.name] then
                table.insert(builder, stringify(cli.name, messages_map[cli.name]))
              else
                table.insert(builder, stringify(cli.name))
              end
            end
          end
          if #builder > 0 then
            return sign .. " " .. table.concat(builder, ", ")
          end
        end
        return ""
      end,
    })
  end,
  lazy = false,
  event = "VimEnter", -- Ensures it starts after Neovim finishes loading
}

