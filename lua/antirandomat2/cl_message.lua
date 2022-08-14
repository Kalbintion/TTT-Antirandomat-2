surface.CreateFont("AntiRandomatHeader", {
	font = "Roboto",
	size = 48
})

surface.CreateFont("AntiRandomatSmallMsg", {
	font = "Roboto",
	size = 32
})

net.Receive("antirandomat_message", function()
	local Big = net.ReadBool()
	local msg = net.ReadString()
	local length = net.ReadUInt(8)
	if length == 0 then length = 5 end

	local NotifyPanel = vgui.Create("DNotify")

	if Big then
		surface.SetFont("AntiRandomatHeader")
	else
		surface.SetFont("AntiRandomatSmallMsg")
	end
	NotifyPanel:SetSize(surface.GetTextSize(msg))
	NotifyPanel:Center()

	local bg = vgui.Create("DPanel", NotifyPanel)
	bg:SetBackgroundColor(Color(0, 0, 0, 200))
	bg:Dock(FILL)

	local lbl = vgui.Create("DLabel", bg)
	lbl:SetText(msg)
	if Big then
		lbl:SetFont("AntiRandomatHeader")
	else
		lbl:SetFont("AntiRandomatSmallMsg")
	end
	lbl:SetTextColor(Color(255, 200, 0))
	lbl:SetWrap(true)
	lbl:Dock(FILL)

	local w, h = lbl:GetSize()
	local tw, th = lbl:GetTextSize()

	lbl:SetText(msg)

	NotifyPanel:AddItem(bg, 5)
	surface.PlaySound("weapons/c4_initiate.wav")
end)

net.Receive("antirandomat_message_silent", function()
	local Big = net.ReadBool()
	local msg = net.ReadString()
	local length = net.ReadUInt(8)
	if length == 0 then length = 5 end

	local NotifyPanel = vgui.Create("DNotify")

	if Big then
		surface.SetFont("AntiRandomatHeader")
	else
		surface.SetFont("AntiRandomatSmallMsg")
	end
	NotifyPanel:SetSize(surface.GetTextSize(msg))
	NotifyPanel:Center()

	local bg = vgui.Create("DPanel", NotifyPanel)
	bg:SetBackgroundColor(Color(0, 0, 0, 200))
	bg:Dock(FILL)

	local lbl = vgui.Create("DLabel", bg)
	lbl:SetText(msg)
	if Big then
		lbl:SetFont("AntiRandomatHeader")
	else
		lbl:SetFont("AntiRandomatSmallMsg")
	end
	lbl:SetTextColor(Color(255, 200, 0))
	lbl:SetWrap(true)
	lbl:Dock(FILL)

	local w, h = lbl:GetSize()
	local tw, th = lbl:GetTextSize()

	lbl:SetText(msg)

	NotifyPanel:AddItem(bg, 5)
end)