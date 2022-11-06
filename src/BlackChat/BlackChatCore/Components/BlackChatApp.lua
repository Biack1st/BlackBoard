local Players = game:GetService("Players")
local Roact: Roact = require(script.Parent.Parent.Parent:WaitForChild("Packages"):WaitForChild("Roact"))
local RoactRodux: RoactRodux = require(script.Parent.Parent.Parent:WaitForChild("Packages"):WaitForChild("RoactRodux"))
local PlayerList = require(script.Parent:WaitForChild("PlayerList"))

local PlayersStore = require(script.Parent.Parent:WaitForChild("Stores"):WaitForChild("PlayersStore"))

PlayerList = RoactRodux.connect(function(state, props)
	local newData = {
		PlayerDatas = state,
	}
	return newData
end, function(dispatch)
	for _, player in Players:GetPlayers() do
		Players.PlayerAdded:Connect(function(player)
			PlayersStore:dispatch({
				type = "PlayerJoin",
				userId = player.UserId,
			})
		end)
		dispatch({
			type = "PlayerJoin",
			userId = player.UserId,
		})
	end
end)(PlayerList)

function BlackChatApp()
	return (
		Roact.createElement(RoactRodux.StoreProvider, {
			store = PlayersStore,
		}, {
			Main = Roact.createElement("ScreenGui", nil, {
				BlackChatUi = Roact.createElement(PlayerList),
			}),
		})
	)
end

return BlackChatApp
