local platform = "managed"
local initramfs = ...

if initramfs == "true" then
	platform = "initramfs"
end

assert(loadfile("/etc/zorya-neo/bios/zyneo-biosinstaller-"..platform..".lua"))(require("computer").getBootAddress())