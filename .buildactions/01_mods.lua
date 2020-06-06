function actions.gen_mods()
	os.execute("cp -rvf tmp/pkg/mods .")
	local h = io.popen("ls mods", "r")
	for line in h:lines() do
		--mods[#mods+1] = {path = "mods/"..line, realname = line, name = "zyneo-mod-"..line:gsub("_", "-"):gsub("%.velx", "")}
		local name = "zyneo-mod-"..line:gsub("_", "-"):gsub("%.velx", "")
		local path = "mods/"..line

		local sh = io.popen("sha256sum "..path, "r")
		local sum = sh:read(8)
		sh:close()

		pkgs[name] = {
			dependencies = {
				["zyneo-utils"] = ""
			},
			files = {
				["master/"..path] = "//etc/zorya-neo/mods"
			},
			name = "Zorya NEO Module: "..name,
			authors = "Adorable-Catgirl",
			description = "This is an automatically generated repo.",
			note = "This is only useful if you have zyneo-utils.",
			xpm = {
				version = sum
			}
		}
	end
end

function actions.gen_libs()
	os.execute("cp -rvf tmp/pkg/lib .")
	local h = io.popen("ls lib", "r")
	for line in h:lines() do
		--mods[#mods+1] = {path = "lib/"..line, realname = line, name = "zyneo-lib-"..line:gsub("_", "-"):gsub("%.velx", "")}
		local name = "zyneo-lib-"..line:gsub("_", "-"):gsub("%.velx", "")
		local path = "lib/"..line

		local sum = get_versum(path)

		pkgs[name] = {
			dependencies = {
				["zyneo-utils"] = ""
			},
			files = {
				["master/"..path] = "//etc/zorya-neo/libs"
			},
			name = "Zorya NEO Library: "..name,
			authors = "Adorable-Catgirl",
			description = "This is an automatically generated repo.",
			note = "This is only useful if you have zyneo-utils.",
			xpm = {
				version = sum
			}
		}
	end
end