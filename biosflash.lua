local eeprom = require("component").eeprom

@[[
local f = io.open(svar.get("BIOS_INPUT"), "rb")
local rep = {
	["\0"] = "\\0",
	["\\"] = "\\\\",
	["\""] = "\\\"",
	["\n"] = "\\n",
	["\r"] = "\\r",
	["\t"] = "\\t",
	[" "] = "\x20"
}
local function mkstr(d)
	local dat = "\""
	for i=1, #d do
		if (rep[d:sub(i, i)]) then
			dat = dat .. rep[d:sub(i, i)]
		else
			dat = dat .. (d:sub(i,i))
		end
	end
	dat = dat .. ("\"")
	return dat
end
local v = mkstr(f:read("*a"))
f:close()
]]

eeprom.set(@[{v}])
eeprom.setData(...)
