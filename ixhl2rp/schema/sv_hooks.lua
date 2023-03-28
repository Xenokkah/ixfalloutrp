function Schema:PlayerSpray(client)
	return false
end

function Schema:PlayerSpawnEffect(client, weapon, info)
	return client:IsAdmin() or client:GetCharacter():HasFlags("N")
end

function Schema:Initialize()
	game.ConsoleCommand("net_maxfilesize 64\n");
	game.ConsoleCommand("sv_kickerrornum 0\n");

	game.ConsoleCommand("sv_allowupload 0\n");
	game.ConsoleCommand("sv_allowdownload 0\n");
	game.ConsoleCommand("sv_allowcslua 0\n");
end

netstream.Hook("qurReq", function(client, time, bResponse)
	if (client.nutQueReqs and client.nutQueReqs[time]) then
		client.nutQueReqs[time](bResponse)
		client.nutQueReqs[time] = nil
	end
end)