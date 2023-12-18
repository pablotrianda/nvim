local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
	print("nvim-dap not installed!")
	return
end

require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog


require('dap-go').setup {
	dap_configurations = {
		{
			-- Must be "go" or it will be ignored by the plugin
			type = "go",
			name = "Attach remote",
			mode = "remote",
			request = "attach",
		},
	},
	-- delve configurations
	delve = {
		path = "dlv",
		initialize_timeout_sec = 20,
		port = "${port}",
		args = {},
		build_flags = "",
	},
}

dap.adapters["pwa-node"] = {
	type = "server",
	host = "127.0.0.1",
	port = 8123,
	executable = {
		command = "js-debug-adapter"
	}
}

for _, language in ipairs { "typescript", "javascript" } do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "node"
		}
	}
end
