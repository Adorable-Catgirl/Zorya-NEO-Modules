function actions.write_out()
	local f = io.open("programs.cfg", "w")
	f:write("{\n")
	for i=1, #mods do
		local mod = mods[i]
		f:write(string.format("    [\"%s\"] = {\n", mod.name))
		f:write(string.format("        files = {[\"%s\"] = \"//etc/zorya-neo/%s\"},\n", mod.path, mod.path))
		f:write(string.format("        name = \"%s\",\n", mod.name))
		f:write(string.format("        description = \"%s\",\n", mod.name))
		f:write("        authors=\"Adorable-Catgirl\",\n")
		f:write("        tree=\"tree/master\",\n")
		f:write("    },\n")
	end
	f:write("}\n")
	f:close()
end