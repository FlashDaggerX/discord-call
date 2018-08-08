--[[concommand.Add("ping_staff",function(ply,cmd,args,argStr)		
	local reason = string.TrimLeft(argStr)

	net.Start("CallDiscord")
	net.WriteString(reason)
	net.SendToServer()
end)]]--

concommand.Add("ping_menu",function()

	local frame = vgui.Create("DFrame")
	frame:SetSize(400,175)
	frame:Center()
	frame:SetTitle("Help!")
	frame:SetVisible(true)
	frame:SetDraggable(true)
	frame:ShowCloseButton(true)
	frame:MakePopup()

	local lreason = vgui.Create("DLabel",frame)
	lreason:SetPos(20,50)
	lreason:SetText("Reason:")

	local creason = vgui.Create("DTextEntry",frame)
	creason:SetSize(300,20)
	creason:SetPos(80,50)
	
	local send = vgui.Create("DButton",frame)
	send:SetSize(200,50)
	send:SetPos(100,100)
	send:SetText("Send")
	send.DoClick = function()
		local reason = creason:GetText()
		if (reason == "") then
			LocalPlayer():ChatPrint("You need to enter a reason!")
		else
			net.Start("CallDiscord")
			net.WriteString(reason)
			net.SendToServer()
			frame:Close()
		end
	end

end)