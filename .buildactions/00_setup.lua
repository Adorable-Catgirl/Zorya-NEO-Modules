local pkgs = {}

local function get_versum(path)
	local sh = io.popen("sha256sum "..path, "r")
	local sum = sh:read(8)
	sh:close()
	return sum
end

function actions.gen_repo()
	actions.build_zyneo()
	actions.gen_mods()
	actions.gen_libs()
	--actions.gen_programs()
	actions.gen_biosinstall()
	actions.utils()
	actions.write_out()
end

actions[#actions+1] = "gen_repo"

function actions.build_zyneo()
	--os.execute("rm -rf .tmp")
	if (os.execute("[[ -d tmp ]]")) then
		os.execute("cd tmp; git pull")
	else
		os.execute("git clone https://github.com/Adorable-Catgirl/Zorya-NEO.git tmp")
	end
	os.execute("cd tmp; ./build.sh")
end