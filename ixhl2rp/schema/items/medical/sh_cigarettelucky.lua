ITEM.name = "Lucky Cigarette"
ITEM.description = "Cancer stick."
ITEM.longdesc = "A rolled paper tube of tobacco. Prior to the war, quite a lot of people smoked; a habit that's no less common today. Cigarettes are rather common in the wasteland, either hand-rolled or pre-war stock. Known for their 'coolness' factor and ability to calm one's nerves, albeit for a short time. Warning: Known to cause cancer, but will that stop you? This one feels especially lucky.\n+1 CHR\n+1 END\n+1 LCK"
ITEM.model = "models/mosi/fallout4/props/junk/cigarette.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 1
ITEM.sound = "fosounds/fix/npc_human_using_jet.mp3"
ITEM.weight = 0.05
ITEM.duration = 200

ITEM.functions.use = {
	name = "Smoke",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "smokes a "..item.name..".", false)

		curplayer = item.player:GetCharacter()
		itemname = item.name
		duration = item.duration
		curplayer:BuffStat("cigarette", "endurance", 1)
		curplayer:BuffStat("cigarette", "charisma", 1)
		curplayer:BuffStat("cigarette", "luck", 1)

		timer.Simple(duration, function() 
			curplayer:RemoveBuff("cigarette", "charisma")
			curplayer:RemoveBuff("cigarette", "endurance")
			curplayer:RemoveBuff("cigarette", "luck")
			curplayer:GetPlayer():NewVegasNotify(itemname .. " has worn off.", "messageNeutral", 8)
			curplayer:GetPlayer():EmitSound("cwfallout3/ui/medical/wear_off.wav" or "items/battery_pickup.wav")
		end)


			quantity = quantity - 1
			if (quantity >= 1) then
				item:SetData("quantity", quantity)
				return false
			end

			return true
		end,

	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}


function ITEM:GetDescription()
	if (!self.entity or !IsValid(self.entity)) then
		return  self.longdesc
	else
		return self.desc
	end
end
