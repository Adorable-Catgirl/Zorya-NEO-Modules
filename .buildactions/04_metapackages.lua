function actions.metapackages()
	pkgs["zyneo-base"] = {
		dependencies = {
			["zyneo-utils"] = "/",
			["zyneo-mod-menu-classic"] = "/",
			["zyneo-mod-loader-openos"] = "/",
			["zyneo-mod-util-searchpaths"] = "/",
			["zyneo-mod-util-luaconsole"] = "/",
		},
		name = "Zorya NEO Metapackage - Base",
		description = "This is the base install package for Zorya NEO.",
		hidden = true,
		authors = "Adorable-Catgirl",
		xpm = {
			version = pkgs["zyneo-utils"].xpm.version
		}
	}
	pkgs["zyneo-platform-managed"] = {
		dependencies = {
			["zyneo-base"] = "/",
			["zyneo-biosinstaller-managed"] = "/",
		},
		name = "Zorya NEO Metapackage - Managed platform",
		description = "This package will give you everything you need to install Zorya NEO.",
		authors = "Adorable-Catgirl",
		xpm = {
			version = pkgs["zyneo-utils"].xpm.version
		},
		postinstall = {
			"zyneo-managed-bios-setup",
			"zyneo-geninitramfs"
		}
	}
	pkgs["zyneo-platform-initramfs"] = {
		dependencies = {
			["zyneo-base"] = "/",
			["zyneo-biosinstaller-initramfs"] = "/",
		},
		name = "Zorya NEO Metapackage - Initramfs platform",
		description = "This package will give you everything you need to install Zorya NEO.",
		note = "This can have extremely high memory usage.",
		authors = "Adorable-Catgirl",
		xpm = {
			version = pkgs["zyneo-utils"].xpm.version
		},
		postinstall = {
			"zyneo-managed-bios-setup true",
			"zyneo-geninitramfs"
		}
	}
end