local Seconds_Last = (math.random(1, 2) == 1) and 300 or 500

spawn(function()
	wait(Seconds_Last)
	local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
	local servers = {}
	local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)})
	local body = game.HttpService:JSONDecode(req.Body)

	if body and body.data then
		for i, v in next, body.data do
			if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
				table.insert(servers, 1, v.id)
			end
		end
	end

	while task.wait() do
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
		task.wait(7)
	end
end)

return Seconds_Last
