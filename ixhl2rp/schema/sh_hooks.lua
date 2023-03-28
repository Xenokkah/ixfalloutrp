
function Schema:CanPlayerUseBusiness(client, uniqueID)
	if (client:Team() == FACTION_CITIZEN) then
		local itemTable = ix.item.list[uniqueID]

		if (itemTable) then
			if (itemTable.permit) then
				local character = client:GetCharacter()
				local inventory = character:GetInventory()

				if (!inventory:HasItem("permit_"..itemTable.permit)) then
					return false
				end
			elseif (itemTable.base ~= "base_permit") then
				return false
			end
		end
	end
end

function Schema:CanDrive()
	return false
end


do
	hook.Add("InitializedConfig", "ixMoneyCommands", function()
		local MONEY_NAME = string.gsub(ix.util.ExpandCamelCase(ix.currency.plural), "%s", "")

		ix.command.Add("Give" .. MONEY_NAME, {
			alias = {"GiveMoney"},
			description = "@cmdGiveMoney",
			arguments = ix.type.number,
			OnRun = function(self, client, amount)
				amount = math.floor(amount)

				if (amount <= 0) then
					return L("invalidArg", client, 1)
				end

				local data = {}
					data.start = client:GetShootPos()
					data.endpos = data.start + client:GetAimVector() * 96
					data.filter = client
				local target = util.TraceLine(data).Entity

				if (IsValid(target) and target:IsPlayer() and target:GetCharacter()) then
					if (!client:GetCharacter():HasMoney(amount)) then
						return
					end

					target:GetCharacter():GiveMoney(amount)
					client:GetCharacter():TakeMoney(amount)
					hook.Run("GaveMoney",client,target,amount)
					target:NotifyLocalized("moneyTaken", ix.currency.Get(amount))
					client:NotifyLocalized("moneyGiven", ix.currency.Get(amount))
				end
			end
		})

		ix.command.Add("CharSet" .. MONEY_NAME, {
			alias = {"CharSetMoney"},
			description = "@cmdCharSetMoney",
			superAdminOnly = true,
			arguments = {
				ix.type.character,
				ix.type.number
			},
			OnRun = function(self, client, target, amount)
				amount = math.Round(amount)

				if (amount <= 0) then
					return "@invalidArg", 2
				end
				hook.Run("CharSetMoney",client,target,amount)
				target:SetMoney(amount)
				client:NotifyLocalized("setMoney", target:GetName(), ix.currency.Get(amount))
			end
		})

		ix.command.Add("Drop" .. MONEY_NAME, {
			arguments = {
				ix.type.number
			},
			alias = {"DropMoney"},
			OnRun = function(self, client, amount)
				local amount = tonumber(amount)

				if (!amount or !isnumber(amount) or amount < 1) then
					return "@invalidArg", 1
				end

				if (!client:GetCharacter():HasMoney(amount)) then
					return "@insufficientMoney"
				end

				amount = math.Clamp(math.Round(amount),1,500000000)
				hook.Run("DroppedMoney",client, amount)
				client:GetCharacter():TakeMoney(amount)
				ix.item.Spawn("capsstash", client:GetItemDropPos(), nil, AngleRand(), {["quantity"] = amount})
			end
		})
	end)
end