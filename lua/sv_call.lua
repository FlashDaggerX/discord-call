-- GLua Script

include("autorun/config.lua")
include("webhook.lua")

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

	webhook:CreateUsername(ply:GetName().." : "..pid)
	webhook:CreateContent("Reason: ".."\""..net.ReadString().."\"")
	webhook:CreateEmbeds(
		{ 
			title = "ALERT!", 
			url ="steam://connect/"..game.GetIPAddress(), 
			description = "A message from Garry's Mod." 
		})

	webhook:CreateWebhookJSON(true)

	local t_struct = {
		failed = function(err) 
			MsgC( Color(255,0,0), "HTTP error: " .. err ) 
		end,
		
		success = function(code, body, headers)
			print("EXPECTED_SUCCESS\n"..webhook:GetHeldJSON().."\n")
			print("START_SUCCESS\n"..code.."\n"..body.."\n"..util.TableToKeyValues(headers))
		end,

        method = "post",
        url = discordcall.webhook,
        body = webhook:GetHeldJSON(),
		type = "application/json; charset=utf-8" --JSON Request type, because I'm a good boy.
	}
	
	HTTP( t_struct )

	webhook:Clear()

	--[[if discordcall.enabled then
		if (os.time() - ply:GetPData("LastDiscordCall", 0)) > (60 * discordcall.timeout) then
		end
	end]]
end)
