ITEM.name = "Can of Pistol Powder"
ITEM.model = "models/mosi/fallout4/props/junk/turpentine.mdl"
ITEM.description = "A can of gunpowder, used for explosive purpose or for filling pistol and shotgun casings."
ITEM.category = "junk"
ITEM.flag = "1"
ITEM.price = 5
ITEM.width = 1
ITEM.height = 1
if (CLIENT) then
	function ITEM:PaintOver(item, w, h)

		draw.SimpleText("Pistol", "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end