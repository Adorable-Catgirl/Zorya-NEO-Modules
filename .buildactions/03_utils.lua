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
			["master/zyneo-utils/zyneo-gencfg.lua"] = "/bin",
			["master/zyneo-utils/zyneo-geninitramfs.lua"] = "/bin",
			["master/zyneo-utils/zyneo-update.lua"] = "/bin",
			@[[function add_etc(path)
				local f = io.popen("ls zyneo-utils/"..path, "r")
				for line in f:lines() do]]
			["master/zyneo-utils/@[{path}]/@[{line}]"] = "//etc/zorya-neo/@[{path}]/",
			@[[end end]]
			@[[add_etc("config.d")]]
			@[[add_etc("initramfs.d")]]
			["master/extras/zyneo-flashprom.lua"] = "/bin",
			["master/extras/zyneo-osdiwrite.lua"] = "/bin",
			["master/extras/zyneo-managed-bios-setup.lua"] = "/bin"
		},
		name = "Zorya NEO Utilities",
		authors = "Adorable-Catgirl",
		description = "Utilities for managing your Zorya NEO installation.",
		note = "Zorya is still unstable.",
		xpm = {
			version = commit
		},
		postinstall = {
			"mkdir /.zy2",
			"zyneo-gencfg",
			"zyneo-geninitramfs"
		}
	}
end