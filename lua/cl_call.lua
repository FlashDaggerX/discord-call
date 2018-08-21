-- GLua Script

include("lib_window.lua")

--[[concommand.Add("ping_staff",function(ply,cmd,args,argStr)		
	local reason = string.TrimLeft(argStr)

	net.Start("CallDiscord")
	net.WriteString(reason)
	net.SendToServer()
end)]]--

hook.Add("OnPlayerChat", "!calldiscord", function(ply, text, teamChat, isDead)

	if text == "!calldiscord" then
		win:CreateDFrame		(nil, "Help!", {}, {x=400, y=175})
		win:CreateDLabel		(win:GetActiveWindow(), "Reason", {x=20, y=50}, {})
		win:CreateDTextEntry	(win:GetActiveWindow(), "Entry", "", {x=80, y=50}, {x=300, y=20}, nil)
		win:CreateDButton		(win:GetActiveWindow(), "Send!", {x=100, y=100}, {x=200, y=50}, 
		
		function(self)
			local reason = win:GetElements("Entry"):GetText()
			if (reason == "") then
				LocalPlayer():ChatPrint("You need to enter a reason!")
			else
				net.Start("CallDiscord")
				net.WriteString(reason)
				net.SendToServer()

				win:KillWindow()
			end
		end)
		
	end
end)
