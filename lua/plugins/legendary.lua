return {
	{
		"mrjones2014/legendary.nvim",
		keys = {
			{
				"<leader>la",
				"<cmd>Legendary<cr>",
				mode = { "n", "x", "o" },
				desc = "Open Legendary UI",
			},
			{
				"<leader>lk",
				"<cmd>Legendary keymaps<cr>",
				mode = { "n", "x", "o" },
				desc = "Show keymaps",
			},
		},
		-- since legendary.nvim handles all your keymaps/commands,
		-- its recommended to load legendary.nvim before other plugins
		priority = 10000,
		lazy = false,
		config = function(_, opts)
			-- Configure vim.ui.select to use fzf-lua
			vim.ui.select = function(items, opts, on_choice)
				local fzf_lua = require("fzf-lua")

				-- Convert items to format fzf-lua expects
				local entries = {}
				for i, item in ipairs(items) do
					if type(item) == "table" then
						-- Handle legendary.nvim keymap items
						if item.keys then
							-- This is a keymap item
							local key = item.keys or ""
							local desc = item.description or item.desc or ""
							entries[i] = key .. " - " .. desc
						elseif item.cmd then
							-- This is a command item
							local cmd = item.cmd or ""
							local desc = item.description or item.desc or ""
							entries[i] = cmd .. " - " .. desc
						elseif item.fn then
							-- This is a function item
							local desc = item.description or item.desc or ""
							entries[i] = "<function> - " .. desc
						else
							-- Generic table item
							local text = item.text or item[1] or tostring(item)
							local desc = item.desc or item[2]
							entries[i] = desc and (text .. " - " .. desc) or text
						end
					else
						-- Handle string items
						entries[i] = tostring(item)
					end
				end

				-- Use fzf-lua to show the selection
				fzf_lua.fzf_exec(entries, {
					prompt = opts.prompt or "Select item:",
					actions = {
						["default"] = function(selected, _)
							if #selected > 0 then
								-- Find the original item that matches the selected text
								for _, item in ipairs(items) do
									local display_text = entries[_]
									if display_text == selected[1] then
										on_choice(item)
										return
									end
								end
								-- Fallback: pass the selected text
								on_choice(selected[1])
							end
						end,
					},
				})
			end

			require("legendary").setup({ extensions = { lazy_nvim = true } })
		end,
		dependencies = { "ibhagwan/fzf-lua" },
	},
}
