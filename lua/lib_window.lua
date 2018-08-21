-- GLua Script
-- Created by Kyle Guarco <kyleguarco55@gmail.com>

win = {}

local active_win = nil
local elements = {}

function win:CreateDFrame (parent, name, pos, size)
	setmetatable(pos, {__index={x=(ScrW()/4), y=(ScrH()/4)}})
	setmetatable(size, {__index={x=250, y=300}})

	local p_x, p_y, s_x, s_y =
		pos[0] or pos.x,
		pos[1] or pos.y,
		size[0] or size.x,
		size[1] or size.y

	win:KillWindow()
	
	local win = vgui.Create("DFrame", parent)
	win:SetPos(p_x, p_y)
	win:SetSize(s_x, s_y)
	win:SetTitle(name)
	win:SetDraggable(true)
	win:ShowCloseButton(true)
	win:MakePopup()
	
	active_win = win
	for k in pairs(elements) do
		elements[k] = nil
	end
end

function win:CreateDButton (parent, name, pos, size, callback)
	if parent != nil then
		setmetatable(pos, {__index={x=100, y=50}})
		setmetatable(size, {__index={x=50, y=50}})
		
		local p_x, p_y, s_x, s_y =
			pos[0] or pos.x,
			pos[1] or pos.y,
			size[0] or size.x,
			size[1] or size.y
		
		local button = vgui.Create("DButton", parent)
		button:SetPos(p_x, p_y)
		button:SetSize(s_x, s_y)
		button:SetText(name)
		
		if callback != nil then
			button.DoClick = callback
		end

		elements[name] = button
	else
		print("Error creating DButton on parent: Window is nil")
	end
end

function win:CreateDLabel (parent, name, pos, size)
	if parent != nil then
		setmetatable(pos, {__index={x=100, y=50}})
		setmetatable(size, {__index={x=50, y=50}})
		
		local p_x, p_y, s_x, s_y =
			pos[0] or pos.x,
			pos[1] or pos.y,
			size[0] or size.x,
			size[1] or size.y
		
		local button = vgui.Create("DLabel", parent)
		button:SetPos(p_x, p_y)
		button:SetSize(s_x, s_y)
		button:SetText(name)

		elements[name] = button
	else
		print("Error creating DLabel on parent: Window is nil")
	end
end

function win:CreateDTextEntry (parent, name, placeholder, pos, size, callback)
	if parent != nil then
		setmetatable(pos, {__index={x=100, y=50}})
		setmetatable(size, {__index={x=50, y=50}})
		
		local p_x, p_y, s_x, s_y =
			pos[0] or pos.x,
			pos[1] or pos.y,
			size[0] or size.x,
			size[1] or size.y
		
		local text = vgui.Create("DTextEntry", parent)
		text:SetPos(p_x, p_y)
		text:SetSize(s_x, s_y)
		text:SetText(placeholder)
		
		if callback != nil then
			text.OnEnter = callback
		end

		elements[name] = text
	else
		print("Error creating DTextEntry on parent: Window is nil")
	end
end

function win:KillWindow()
	if active_win != nil then
		win:GetActiveWindow():Close()

		active_win = nil
		for k in pairs(elements) do
			elements[k] = nil
		end
	end
end


function win:GetActiveWindow()
	return active_win
end

function win:GetElements(element)
	return elements[element]
end
