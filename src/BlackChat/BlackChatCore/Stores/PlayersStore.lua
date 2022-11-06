local Players = game:GetService("Players")

local Rodux: Rodux = require(script.Parent.Parent.Parent:WaitForChild("Packages"):WaitForChild("Rodux"))
local config = require(script.Parent.Parent:WaitForChild("config"))

local function createPlayerData(userId: number)
	local playerName = Players:GetNameFromUserIdAsync(userId)
	local playerInstance = Players:GetPlayerByUserId(userId)
	local icons = {}

	for groupId, imageId in config.GroupIcons do
		if playerInstance:IsInGroup(groupId) then
			table.insert(icons, imageId)
		end
	end

	return {
		username = playerName,
		playerInstance = playerInstance,
		userId = userId,
		icons = icons,
	}
end

local PlayersStore = Rodux.Store.new(function(state, action)
	if action.type == "PlayerJoin" then
		local currentPlayers = state or {}

		local playerData = createPlayerData(action.userId)

		print(playerData)
	end
end)

return PlayersStore
