if (SERVER) then
	include("config.lua")
	include("sv_call.lua")
end
if (CLIENT) then
	include("cl_call.lua")
end
print("Initialized Discord Calls!")