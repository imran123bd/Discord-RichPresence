Citizen.CreateThread(function()
	while true do
		local Buttons = (Config.buttons)
		local Maxplayers = (Config.Maxplayers)
		local playerName = GetPlayerName(PlayerId())
		local onlinePlayers = 0
		for i = 0, 255 do
			if NetworkIsPlayerActive(i) then
				onlinePlayers = onlinePlayers + 1
			end
		end
		SetDiscordAppId(Config.DiscordAppId)
		SetDiscordRichPresenceAsset(Config.LogoAsset)
        	SetDiscordRichPresenceAssetText(playerName)
		SetRichPresence("Online: "..onlinePlayers.."/"..Maxplayers.." | Name: "..playerName)
		for _, v in pairs(Buttons) do
		SetDiscordRichPresenceAction(v.index, v.name, v.url)
		end
		Citizen.Wait(Config.WaitTime)
	end
end)

