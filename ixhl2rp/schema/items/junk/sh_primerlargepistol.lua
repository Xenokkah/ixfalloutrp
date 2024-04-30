ITEM.name = "Can of Large Pistol Primers"
ITEM.model = "models/mosi/fallout4/props/junk/tincan03.mdl"
ITEM.description = "A can of round primers fit for handloading larger pistol ammo, such as 10mm, .44, and 12.7mm."
ITEM.category = "junk"
ITEM.flag = "1"
ITEM.price = 5
ITEM.width = 1
ITEM.height = 1
if (CLIENT) then
	function ITEM:PaintOver(item, w, h)

		draw.SimpleText("L. Pistol", "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end