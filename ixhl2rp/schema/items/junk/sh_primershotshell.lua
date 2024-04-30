ITEM.name = "Can of Shotshell Primers"
ITEM.model = "models/mosi/fallout4/props/junk/tincan03.mdl"
ITEM.description = "A can of round primers fit for handloading shotgun shells."
ITEM.category = "junk"
ITEM.flag = "1"
ITEM.price = 5
ITEM.width = 1
ITEM.height = 1
if (CLIENT) then
	function ITEM:PaintOver(item, w, h)

		draw.SimpleText("Shotgun", "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end