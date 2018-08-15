-- GLua Script

include("autorun/config.lua")

-- (os.time()-ply:GetPData("LastDiscordCall",0)) > (60 * discordcall.timeout)
--[[ args["durl"] = discordcall.webhook
	 args["svname"] = GetHostName()
	 args["joinurl"] = "steam://connect/"..game.GetIPAddress()
	 args["sid64"] = "76561198188070674"--ply:SteamID64()
	 args["reason"] = net.ReadString()
	]]

net.Receive("CallDiscord",function(l,ply)
	http.Post(
		discordcall.webhook,
		
		{ 
			content = "Done!" 
		},
		
		function(resp, length, headers, status)
			print(resp)
		end,

		function(err)
			print(err)
		end
	)
	
end)
