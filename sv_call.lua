-- GLua Script

util.AddNetworkString("CallDiscord")

net.Receive("CallDiscord",function(l,ply)
	if (discordcall.enabled) then
		if ((os.time()-ply:GetPData("LastDiscordCall",0)) > (60 * discordcall.timeout)) then
			local args = {}
			args["durl"] = discordcall.webhook
			args["svname"] = GetHostName()
			args["joinurl"] = "steam://connect/"..game.GetIPAddress()
			args["sid64"] = "76561198188070674"--ply:SteamID64()
			args["reason"] = net.ReadString()
			print(ply:SteamID64())
			--[[local args = {
				["svname"] = svname,
				["reason"] = reason,
				["joinurl"] = joinurl,
				["sid64"] = sid,
				["durl"] = discordcall.webhook
			}]]
			PrintTable(args)
			http.Post("https://crossboy.000webhostapp.com/web.php",args,function(res,ln,head,code)
				print("Success!")
				print("["..code.."]")
				print(res)
				
				ply:SetPData("LastDiscordCall",os.time())
				ply:ChatPrint("Sent message successfully! Please wait patiently for a response.")
			end)
		else
			ply:ChatPrint("Uh oh! It looks like you called too recently. Please wait before sending another call.")
		end
	end
end)
