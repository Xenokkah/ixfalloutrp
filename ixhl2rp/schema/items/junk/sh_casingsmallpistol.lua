ITEM.name = "Box of Small Pistol Casings"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.description = "A box full of empty shell casings for small pistol rounds like .38, 9mm, and .45."
ITEM.category = "junk"
ITEM.flag = "1"
ITEM.price = 5
ITEM.width = 1
ITEM.height = 1
if (CLIENT) then
	function ITEM:PaintOver(item, w, h)

		draw.SimpleText("S. Pistol", "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end