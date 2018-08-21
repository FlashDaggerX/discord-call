-- GLua Script

if (SERVER) then
    -- Pool "CallDiscord" before the serverside reciever is loaded.
    util.AddNetworkString("CallDiscord")
    include("../sv_call.lua")    
else
    AddCSLuaFile("../cl_call.lua")
    AddCSLuaFile("../lib_window.lua")
    include("../cl_call.lua")
end
print("discord-calls Initialized!")
