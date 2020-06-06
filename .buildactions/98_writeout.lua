function serialize_table(tbl, indent)
	indent = indent or "    "
	local ser = ""
	for k, v in pairs(tbl) do
		ser = ser .. indent .. "["
		if (type(k) == "string") then
			ser = ser .. "\""..k.."\""
		else
			ser = ser .. tostring(k)
		end
		ser = ser .. "] = "
		if (type(v) == "table") then
			ser = ser .. "{\n" .. serialize_table(v, indent .. "    ")..indent.."},\n"
		elseif (type(v) == "string") then
			ser = ser .. "\""..v.."\",\n"
		else
			ser = ser .. tostring(v) .. ",\n"
		end
	end
	return ser
end

function actions.write_out()
	local f = io.open("programs.cfg", "w")
	f:write("{\n")
	f:write(serialize_table(pkgs))
	f:write("}\n")
	f:close()
end