local rad = Material("daui/rad_icon_v6.png") 

function PLUGIN:HUDPaint()
	local lp = LocalPlayer()
	local wep = LocalPlayer():GetActiveWeapon()
	local char = lp:GetCharacter()
	if (!lp:GetCharacter() or !lp:Alive() or ix.gui.characterMenu:IsVisible()) then return end
	local rad = Material("icon16/error.png", "noclamp smooth")  -- Green
	local rad2 = Material("icon16/error.png", "noclamp smooth") -- Yellow
	local rad3 = Material("icon16/error.png", "noclamp smooth") -- Orange
	local rad4 = Material("icon16/error.png", "noclamp smooth") -- Red

	surface.SetMaterial(rad)

		-- Anything below 200 rads will not show up on HUD or any effects.
	if char:GetRads() < 199  then
		surface.SetMaterial(rad)
		surface.SetDrawColor(Color(0, 0, 0, 0))

		-- 200-399 Rads: Minor Rad Poisoning
	elseif char:GetRads() > 199 and char:GetRads() < 400 then
		surface.SetMaterial(rad)
		surface.SetDrawColor(Color(0, 250, 0, 200))

		-- 400-599 Rads: Advanced Rad Poisoning
	elseif char:GetRads() > 399 and char:GetRads() < 600 then
		surface.SetMaterial(rad2)
		surface.SetDrawColor(Color(255, 255, 0, 200))

		-- 600-799 Rads: Critical Rad Poisoning
	elseif char:GetRads() > 599 and char:GetRads() < 800 then
		surface.SetMaterial(rad3)
		surface.SetDrawColor(Color(255, 165, 0, 200))

		-- 800+ Rads: Deadly Rad Poisoning
	elseif char:GetRads() >= 800 then
		surface.SetMaterial(rad4)
		surface.SetDrawColor(Color(255, 0, 0, 200))
	end

	surface.DrawTexturedRect(ScrW()-80, ScrH()-300, 33, 35, Color(0, 255, 0, 255))
end