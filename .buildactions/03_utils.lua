function actions.utils()

	os.execute("cp -rvf tmp/util/OpenOS/* zyneo-utils")
	local vh = io.popen("cd tmp; git rev-parse --short HEAD", "r")
	local commit = vh:read("*a"):gsub("%s+$", "")
	vh:close()
	pkgs["zyneo-utils"] = {
		dependencies = {
			["json.lua"] = ""
		},
		files = {
			["zyneo-utils/zyneo-gencfg.lua"] = "/bin/zyneo-gencfg.lua",
			["zyneo-utils/zyneo-geninitramfs.lua"] = "/bin/zyneo-geninitramfs.lua",
			["zyneo-utils/zyneo-update.lua"] = "/bin/zyneo-update.lua",
			@[[function add_etc(path)
				local f = io.popen("ls zyneo-utils/"..path, "r")
				for line in f:lines() do]]
			["zyneo-utils/@[{path}]/@[{line}]"] = "//etc/zorya-neo/@[{path}]/@[{line}]",
			@[[end end]]
			@[[add_etc("config.d")]]
			@[[add_etc("initramfs.d")]]
		},
		name = "Zorya NEO Utilities",
		authors = "Adorable-Catgirl",
		description = "Utilities for managing your Zorya NEO installation.",
		note = "Zorya is still unstable.",
		xpm = {
			version = commit
		}
	}
end