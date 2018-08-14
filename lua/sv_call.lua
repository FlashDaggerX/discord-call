-- GLua Script

local http = require "socket.http"

include("sv_config.lua")

-- (os.time()-ply:GetPData("LastDiscordCall",0)) > (60 * discordcall.timeout)
net.Receive("CallDiscord",function(l,ply)
	local args = {}

	args["durl"] = discordcall.webhook
	args["svname"] = GetHostName()
	args["joinurl"] = "steam://connect/"..game.GetIPAddress()
	args["sid64"] = "76561198188070674"--ply:SteamID64()
	args["reason"] = net.ReadString()
	
	PrintTable(args)
	
	http.Post(discordcall.webhook, args, function(res,ln,head,code)
		print("Success!")
		print("["..code.."]")
		print(res)
		
		ply:ChatPrint("Sent message successfully! Please wait patiently for a response.")
	end)
	
end)
