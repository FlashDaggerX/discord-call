-- GLua Script

if (SERVER) then
    include("../../config.lua")

    -- Pool "CallDiscord" before the serverside reciever is loaded.
    util.AddNetworkString("CallDiscord")
    include("../../sv_call.lua")    
else
    AddCSLuaFile("../../cl_call.lua")
end
