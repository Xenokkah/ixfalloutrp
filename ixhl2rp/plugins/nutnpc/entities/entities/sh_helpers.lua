-- "gamemodes\\halorp\\plugins\\combat\\entities\\entities\\sh_helpers.lua"

-- Retrieved by https://github.com/c4fe/glua-steal

local PLUGIN = PLUGIN



function ENT:Name()

	return self:GetNetVar("name", self.name or self.PrintName)

end



function ENT:Desc()

	return self:GetNetVar("desc", self.desc)

end



--[[function ENT:getHP()

	return self:GetNetVar("hp", self:getMaxHP())

end]]



--[[function ENT:getMaxHP()

	return self:GetNetVar("hpMax", self.hp or 0)

end]]



--[[function ENT:getMP()

	return self:GetNetVar("mp", self:getMaxMP())

end]]



--[[function ENT:getMaxMP()

	return self:GetNetVar("mpMax", self.mp or 0)

end]]



--[[function ENT:getAP()

	return self:GetNetVar("ap", self:getAPMax())

end



function ENT:getAPMax()

	return self:GetNetVar("apMax", self.apMax or 2)

end]]



function ENT:addHP(amount)

	local new = math.Round(math.Clamp(self:getHP() + amount, -1000, self:getMaxHP()), 2)

	

	self:SetNetVar("hp", new)

	

	return new

end



function ENT:setHP(amount)

	local new = math.Round(math.Clamp(amount, -1000, self:getMaxHP()), 2)

	

	self:SetNetVar("hp", new)

	

	return new

end



--[[function ENT:setMaxHP(amount)

	self:SetNetVar("hpMax", amount)

	

	return amount

end]]



--[[function ENT:addMP(amount)

	local new = math.Round(math.Clamp(self:getMP() + amount, -1000, self:getMaxMP()), 2)

	

	self:SetNetVar("mp", new)

	

	return new

end]]



--[[function ENT:setMP(amount)

	local new = math.Round(math.Clamp(amount, -1000, self:getMaxMP()), 2)

	

	self:SetNetVar("mp", new)

	

	return new

end]]



--[[function ENT:setMaxMP(amount)

	self:SetNetVar("mpMax", amount)

	

	return amount

end]]



-- Exists for ocnvenience

function ENT:GetChar()

	return self

end



--[[function ENT:getTags()

	return self.tags or {}

end]]


--[[
function ENT:getTagsBonus()

	return self.tagsBonus or {}

end
]]


--[[makes it compatible with player functions

function ENT:getAttrib(attrib, default)

	return self.attribs[attrib] or default

end]]



--[[makes it compatible with player functions

function ENT:GetInv()

	return self

end



--makes it compatible with player functions

function ENT:GetItems()

	return {}

end]]

