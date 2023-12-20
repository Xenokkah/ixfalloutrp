ix.command.Add(
	"ViewCharacterSheet",
	{
		arguments = {ix.type.player},
		OnRun = function(self, client, target)
			net.Start("ViewSheet")
			net.WriteEntity(target)
			net.Send(client)
		end
	}
)


if SERVER then
	util.AddNetworkString("ViewSheet")
end

