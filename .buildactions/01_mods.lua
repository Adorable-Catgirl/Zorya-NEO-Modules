function actions.gen_mods()
	os.execute("cp -rvf tmp/pkg/mods .")
	local h = io.popen("ls mods", "r")
	for line in h:lines() do
		mods[#mods+1] = {path = "mods/"..line, realname = line, name = "zyneo-mod-"..line:gsub("_", "-"):gsub("%.velx", "")}
	end
end

function actions.gen_libs()
	os.execute("cp -rvf tmp/pkg/lib .")
	local h = io.popen("ls lib", "r")
	for line in h:lines() do
		mods[#mods+1] = {path = "lib/"..line, realname = line, name = "zyneo-lib-"..line:gsub("_", "-"):gsub("%.velx", "")}
	end
end