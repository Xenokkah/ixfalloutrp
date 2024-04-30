ITEM.name = "Coyote Tobacco Seeds"
ITEM.description = "Seeds for growing Coyote Tobacco."
ITEM.longdesc = "Some seeds for home-growing some Coyote Tobacco."
ITEM.model = "models/mosi/fnv/props/junk/seedbag.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Seeds"
ITEM.price = "10"
ITEM.quantity = 1
ITEM.sound = "player/footsteps/gravel1.wav"
ITEM.weight = 0.05
ITEM.duration = 160

ITEM.functions.use = {
	name = "Plant",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local plant = ents.Create( "ix_plant_farm_coyotetobacco" )
		plant:SetPos(item.player:GetPos())
		plant:Spawn()
		
		return true
	end,

	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}


function ITEM:GetDescription()
	if (!self.entity or !IsValid(self.entity)) then
		return self.description
	else
		return self.description
	end
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)

		draw.SimpleText("Tobacco", "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end