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
	local pid = ply:SteamID64()
	if pid == nil then pid = "0000000000000000" end

	local post = 
	{
		-- https://scriptinghelpers.org/questions/45061/how-do-i-fix-this-discord-webhook-script-so-that-embeds-work
		username = "username",
		embeds = {{
			fields = {
				{value = "1",name = "2"},
				{value = "3",name = "4"}},
			title = "5",
			description = "6"
			}
		},
		content = "0"
	}
	
	http.Post(
		discordcall.webhook, post, 

		function(resp, length, headers, status)
			print(resp)

			ply:SetPData("LastDiscordCall", os.time())
			ply:ChatPrint("Sent message successfully! Please wait patiently for a response.")
		end,

		function(err)
			print(err)
		end
	)

	--[[if discordcall.enabled then
		if (os.time() - ply:GetPData("LastDiscordCall", 0)) > (60 * discordcall.timeout) then
		end
	end]]
end)
