local platforms = {
	"managed",
	"initramfs",
	"osdi",
	"prom"
}

function actions.gen_biosinstall()
	for i=1, #platforms do
		os.execute("BIOS_INPUT=tmp/pkg/bios/"..platforms[i]..".bios luacomp biosflash.lua -O installers/zyneo-biosinstaller-"..platforms[i]..".lua")
		pkgs["zyneo-biosinstaller-"..platforms[i]] = {
			dependencies = {
				["zyneo-utils"] = ""
			},
			files = {
				["master/installers/zyneo-biosinstaller-"..platforms[i]..".lua"] = "//etc/zorya-neo/bios/"
			},
			name = "Zorya NEO BIOS installer: "..platforms[i],
			authors = "Adorable-Catgirl",
			description = "This is an automatically generated repo.",
			note = "This is only useful if you have zyneo-utils.",
			xpm = {
				version = get_versum("installers/zyneo-biosinstaller-"..platforms[i]..".lua")
			}
		}
	end
end