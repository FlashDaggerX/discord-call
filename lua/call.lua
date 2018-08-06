if (discordcall.enabled) {
	concommand.Add("ping_staff",function(ply,cmd,args,argStr)
		local svname = GetHostName()
		local joinurl = "steam://connect/"..game.GetIPAddress()
		local reason = string.TrimLeft(argStr)
		local name = ply:Nick()
		local sid = ply:SteamID()
		//local sid64 = ply:SteamID64()
		local args = {
			["svname"] = svname,
			["pname"] = name,
			["reason"] = reason,
			["joinurl"] = joinurl,
			["SID"] = sid,
			["durl"] = discordcall.webhook
			//["s64"] = sid64
		}
		http.Post(ifttt,args,function(res,ln,head,code)
			print("Success!")
			print("["..code.."]")
			print(res)
		end)
	end)

	if (CLIENT) then

		concommand.Add("ping_menu",function()

			local frame = vgui.Create("DFrame")
			frame:SetSize(150,300)
			frame:Center()
			frame:SetTitle("Call Staff")
			frame:SetVisible(true)
			frame:SetDraggable(true)
			frame:ShowCloseButton(true)
			frame:MakePopup()

			local lplayer = vgui.Create("DLabel",frame)
			lplayer:SetPos(20,30)
			lplayer:SetText("Add a player?")

			local lreason = vgui.Create("DLabel",frame)
			lreason:SetPos(20,30)
			lreason:SetText("Reason:")

			local reason = vgui.Create("DTextEntry",frame)
			reason:SetSize(25,200)
			reason:SetPos(25,35)
			reason:
		end)
	end
}