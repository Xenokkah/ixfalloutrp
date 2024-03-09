ITEM.name = "Brotherhood of Steel Holotags"
ITEM.model = "models/maxib123/tags.mdl"
ITEM.description = "A set of matching dogtags containing relevant medical and biographical information on a mini holographic screen, issued by the Brotherhood of Steel to all its members."
ITEM.category = "currency"
ITEM.flag = "1"
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1
ITEM.owner = ""

ITEM.functions.use = {
	name = "Claim",
	icon = "icon64/tool.png",
	OnRun = function(item)

        local serialnum = math.random(0000000000, 9999999999)
		
        item:SetData("owner", item.player:GetName())
        item:SetData("serial", serialnum)

        return false 
		
    end,
	OnCanRun = function(item)
        if !item:GetData("owner") then
		    return (!IsValid(item.entity))
        else
            return false
        end 
	end
}

function ITEM:GetDescription()
	if (!self.entity or !IsValid(self.entity)) then
		
        if self:GetData("owner") then
            return self.description .. "\n\n The name and serial on the tags are as follows: " .. "\n" .. self:GetData("owner") .. "\n" .. self:GetData("serial")

        else 
            return self.description .. "\n\n The tags are blank."
        end 

	else
		return self.description
	end
end
