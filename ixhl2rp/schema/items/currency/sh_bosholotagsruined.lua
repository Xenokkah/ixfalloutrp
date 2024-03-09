ITEM.name = "Brotherhood of Steel Holotags"
ITEM.model = "models/maxib123/tags.mdl"
ITEM.description = "A set of matching dogtags containing relevant medical and biographical information on a mini holographic screen, issued by the Brotherhood of Steel to all its members. This one is damaged, rendering its display unreadable."
ITEM.category = "currency"
ITEM.flag = "1"
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1



function ITEM:GetDescription()
	return self.description
end
