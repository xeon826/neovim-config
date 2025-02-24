return {
	{
		"mac-sync",
		name = "mac-sync",
    enabled=true,
		dir = vim.fn.stdpath("config"), -- Point to nvim config directory for virtual plugin
    init = function()
      -- Create autocommand group
      local group = vim.api.nvim_create_augroup("MacSync", { clear = true })
      local autocmd_enabled = false
      local autocmd_id = nil

      -- Function to create the autocommand
      local function create_autocmd()
        return vim.api.nvim_create_autocmd("BufWritePost", {
        group = group,
        pattern = "*",
        callback = function()
          local current_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          local file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")  -- Get relative path of current file
          
          -- Only sync if file is within current working directory
          if vim.fn.match(file_path, "^%.%.") == -1 then
            -- Create remote directory structure
            local remote_dir = vim.fn.fnamemodify(file_path, ":h")
            if remote_dir ~= "." then
              vim.fn.system(string.format('ssh mac "mkdir -p /Users/administrator/sync/%s/%s"', current_dir, remote_dir))
            end
            
            -- Sync single file
            local cmd = string.format(
              'rsync -az "%s" "mac:/Users/administrator/sync/%s/%s"',
              file_path,
              current_dir,
              file_path
            )
            
            local output = vim.fn.system(cmd)
            local exit_code = vim.v.shell_error
            
            if exit_code ~= 0 then
              vim.notify("Auto-sync failed:\n" .. output, vim.log.levels.ERROR)
            else
              vim.notify("Auto-sync completed: " .. file_path, vim.log.levels.INFO)
            end
          end
        end,
      })
      end

      -- Function to enable auto-sync
      local function enable_auto_sync()
        if not autocmd_enabled then
          autocmd_id = create_autocmd()
          autocmd_enabled = true
          vim.notify("Auto-sync enabled", vim.log.levels.INFO)
        else
          vim.notify("Auto-sync is already enabled", vim.log.levels.WARN)
        end
      end

      -- Function to disable auto-sync
      local function disable_auto_sync()
        if autocmd_enabled and autocmd_id then
          vim.api.nvim_del_autocmd(autocmd_id)
          autocmd_enabled = false
          autocmd_id = nil
          vim.notify("Auto-sync disabled", vim.log.levels.INFO)
        else
          vim.notify("Auto-sync is already disabled", vim.log.levels.WARN)
        end
      end

      -- Create user commands
      vim.api.nvim_create_user_command("AutoSyncEnable", enable_auto_sync, {})
      vim.api.nvim_create_user_command("AutoSyncDisable", disable_auto_sync, {})
      vim.api.nvim_create_user_command("AutoSyncToggle", function()
        if autocmd_enabled then
          disable_auto_sync()
        else
          enable_auto_sync()
        end
      end, {})
    end,

		keys = {
			{
				"<leader>sp", -- sync push
				mode = { "n" },
				function()
					local current_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					
					-- Create remote directory if it doesn't exist
					vim.fn.system('ssh mac "mkdir -p /Users/administrator/sync"')
					
					-- Push to remote
					local cmd = string.format(
						'rsync -avz --delete -R "%s/" "mac:/Users/administrator/sync/%s/"',
						'.',
						current_dir
					)
					
					vim.notify("Pushing to remote...", vim.log.levels.INFO)
					local output = vim.fn.system(cmd)
					local exit_code = vim.v.shell_error
					
					if exit_code ~= 0 then
						vim.notify("Push failed:\n" .. output, vim.log.levels.ERROR)
					else
						vim.notify("Push completed successfully", vim.log.levels.INFO)
					end
				end,
				desc = "Sync push to remote",
			},
			{
				"<leader>sl", -- sync pull
				mode = { "n" },
				function()
					local current_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					
					-- Pull from remote
					local cmd = string.format(
						'rsync -avz --delete "mac:/Users/administrator/sync/%s/" .',
						current_dir
					)
					
					vim.notify("Pulling from remote...", vim.log.levels.INFO)
					local output = vim.fn.system(cmd)
					local exit_code = vim.v.shell_error
					
					if exit_code ~= 0 then
						vim.notify("Pull failed:\n" .. output, vim.log.levels.ERROR)
					else
						vim.notify("Pull completed successfully", vim.log.levels.INFO)
					end
				end,
				desc = "Sync pull from remote",
			},
		},
	},
}
