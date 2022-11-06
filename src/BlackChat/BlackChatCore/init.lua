local Players = game:GetService("Players")
-- main module
local module = {}

local Roact: Roact = require(script.Parent:WaitForChild("Packages"):WaitForChild("Roact"))
local Rodux: Rodux = require(script.Parent:WaitForChild("Packages"):WaitForChild("Rodux"))

local PlayersStore: Rodux.Store = require(script:WaitForChild("Stores"):WaitForChild("PlayersStore"))

function module:Initialize()
	-- setup core
	module:setUpFunctions()
	module:addExistingPlayers()

	-- setup ui
	local blackChatApp = Roact.createElement(require(script:WaitForChild("Components"):WaitForChild("BlackChatApp")))
	Roact.mount(blackChatApp, game.Players.LocalPlayer.PlayerGui, "BlackChat")
end

function module:setUpFunctions()
	Players.PlayerAdded:Connect(function(player)
		PlayersStore:dispatch({
			type = "PlayerJoin",
			userId = player.UserId,
		})
	end)
end

function module:addExistingPlayers()
	for _, player in Players:GetPlayers() do
		PlayersStore:dispatch({
			type = "PlayerJoin",
			userId = player.UserId,
		})
	end
end

return module
