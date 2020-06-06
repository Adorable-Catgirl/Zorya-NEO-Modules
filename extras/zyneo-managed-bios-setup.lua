local platform = "managed"
local initramfs = ...

if initramfs == "true" then
	platform = "initramfs"
end

local f = loadfile("/etc/zorya-neo/bios/"..platform..".lua", require("computer").getBootAddress())