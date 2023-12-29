local PLUGIN = PLUGIN
-- Create a new font
surface.CreateFont(
	"CustomFontLarge",
	{
		font = "Courier New", -- Change this to the desired font (must be installed on clients)
		size = 20,
		weight = 800,
		antialias = true,
	}
)

surface.CreateFont(
	"CustomFontDefault",
	{
		font = "Courier New", -- Change this to the desired font (must be installed on clients)
		size = 17,
		weight = 700,
		antialias = true,
	}
)

net.Receive(
	"ViewSheet",
	function()
		local client = net.ReadEntity()
		local character = client:GetCharacter()
		if not IsValid(client) then return end
		local frame = vgui.Create("DFrame")
		frame:SetSize(800, 600)
		frame:SetTitle("")
		frame:SetPos(ScrW() - 810, ScrH() / 2 - 300)
		frame:MakePopup()
		frame:Center()
		frame.Paint = function(_, w, h)
			draw.RoundedBox(8, 0, 0, w, h, Color(50, 50, 50, 200))
		end

		local moneyLabel = vgui.Create("DLabel", frame)
		moneyLabel:SetPos(20, 50)
		moneyLabel:SetText("Money: " .. character:GetData("money", 0))
		moneyLabel:SetFont("CustomFontLarge")
		moneyLabel:SizeToContents()
		local clientNameLabel = vgui.Create("DLabel", frame)
		clientNameLabel:SetPos(20, 20)
		clientNameLabel:SetText("Player: " .. character:GetName())
		clientNameLabel:SetFont("CustomFontLarge")
		clientNameLabel:SizeToContents()
		local lineageLabel = vgui.Create("DLabel", frame)
		lineageLabel:SetPos(20, 80)
		lineageLabel:SetText("Lineage: " .. character:GetData("Lineage", "None"))
		lineageLabel:SetFont("CustomFontLarge")
		lineageLabel:SizeToContents()
		local attributesLabel = vgui.Create("DLabel", frame)
		attributesLabel:SetPos(10, 120)
		attributesLabel:SetText("Attributes")
		attributesLabel:SetFont("CustomFontLarge")
		attributesLabel:SizeToContents()
		local attributesPanel = vgui.Create("DPanel", frame)
		attributesPanel:SetPos(10, attributesLabel:GetTall() + attributesLabel:GetY() + 5)
		attributesPanel:SetSize(200, 400)
		local yOffset = 10
		for uniqueID, attribute in pairs(ix.attributes.list) do
			local label = vgui.Create("DLabel", attributesPanel)
			label:SetText(attribute.name .. ": " .. character:GetAttribute(uniqueID, 0))
			label:SetFont("CustomFontDefault")
			label:SizeToContents()
			label:SetPos(5, yOffset)
			yOffset = yOffset + label:GetTall() + 10
		end

		local skillsLabel = vgui.Create("DLabel", frame)
		skillsLabel:SetPos(frame:GetWide() - 220, 120)
		skillsLabel:SetText("Skills")
		skillsLabel:SetFont("CustomFontLarge")
		skillsLabel:SizeToContents()
		local skillsPanel = vgui.Create("DPanel", frame)
		skillsPanel:SetPos(frame:GetWide() - 220, skillsLabel:GetTall() + skillsLabel:GetY() + 5)
		skillsPanel:SetSize(200, 400)
		local yOffsetSkills = 10
		for id, skill in pairs(ix.skills.list) do
			local label = vgui.Create("DLabel", skillsPanel)
			label:SetText(skill.name .. ": " .. character:GetSkill(id, 0))
			label:SetFont("CustomFontDefault")
			label:SizeToContents()
			label:SetPos(5, yOffsetSkills)
			yOffsetSkills = yOffsetSkills + label:GetTall() + 10
		end

		local featsLabelCenter = vgui.Create("DLabel", frame)
		featsLabelCenter:SetPos((frame:GetWide() - 200) / 2, 120)
		featsLabelCenter:SetText("Traits")
		featsLabelCenter:SetFont("CustomFontLarge")
		featsLabelCenter:SizeToContents()
		local featsPanelCenter = vgui.Create("DPanel", frame)
		featsPanelCenter:SetPos((frame:GetWide() - 200) / 2, featsLabelCenter:GetTall() + featsLabelCenter:GetY() + 5)
		featsPanelCenter:SetSize(200, 400)
		local yOffsetCenter = 10
		for _, feat in pairs(character:GetData("Feats", {})) do
			local label = vgui.Create("DLabel", featsPanelCenter)
			label:SetText(feat)
			label:SetFont("CustomFontDefault")
			label:SizeToContents()
			label:SetPos(5, yOffsetCenter)
			yOffsetCenter = yOffsetCenter + label:GetTall() + 10
		end

		local woundsLabel = vgui.Create("DLabel", frame)
		woundsLabel:SetPos(435, 30)
		woundsLabel:SetText("Wounds")
		woundsLabel:SetFont("CustomFontLarge")
		woundsLabel:SizeToContents()
		local woundsPanel = vgui.Create("DPanel", frame)
		woundsPanel:SetPos(400, 50)
		woundsPanel:SetSize(140, 20)
		local boxWidth = 5
		local boxSpacing = 2
		local totalBoxWidth = boxWidth + boxSpacing
		local numWounds = client:GetWoundSlots()
		for i = 1, client:GetMaxWounds() do
			local box = vgui.Create("DPanel", woundsPanel)
			box:SetPos((i - 1) * totalBoxWidth, 2)
			box:SetSize(boxWidth, 16)
			box.Paint = function(_, w, h)
				draw.RoundedBox(0, 0, 0, w, h, i <= numWounds and Color(255, 0, 0) or Color(200, 200, 200))
			end
		end

		local shieldLabel = vgui.Create("DLabel", frame)
		shieldLabel:SetPos(620, 30)
		shieldLabel:SetText("Shield Points")
		shieldLabel:SetFont("CustomFontLarge")
		shieldLabel:SizeToContents()
		local shieldPanel = vgui.Create("DPanel", frame)
		shieldPanel:SetPos(600, 50)
		shieldPanel:SetSize(140, 20)
		local boxWidth = 12
		local boxSpacing = 2
		local totalBoxWidth = boxWidth + boxSpacing
		local numShieldPoints = client:GetShieldPoints()
		for i = 1, PLUGIN.MaxShields do
			local box = vgui.Create("DPanel", shieldPanel)
			box:SetPos((i - 1) * totalBoxWidth, 2)
			box:SetSize(boxWidth, 16)
			box.Paint = function(_, w, h)
				draw.RoundedBox(0, 0, 0, w, h, i <= numShieldPoints and Color(0, 0, 255) or Color(200, 200, 200))
			end
		end
	end
)