local Roact: Roact = require(script.Parent.Parent.Parent:WaitForChild("Packages"):WaitForChild("Roact"))
local RoactRodux: RoactRodux = require(script.Parent.Parent.Parent:WaitForChild("Packages"):WaitForChild("RoactRodux"))
local config = require(script.Parent.Parent:WaitForChild("config"))

local PlayerList = Roact.Component:extend("PlayerList")
local ListItem = require(script.Parent:WaitForChild("ListItem"))

function PlayerList:render()
	local playerDatas = self.props.PlayerDatas
	local playerItems = {}

	if playerDatas then
		for _, playerData in playerDatas do
			playerItems[playerData] = Roact.createElement(ListItem, {
				PlayerData = playerData,
			})
		end
	end

	return (
		Roact.createElement("ScrollingFrame", {
			Size = config.BoardSize,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 6,
			ScrollBarImageColor3 = config.ScrollBarColor,
			CanvasSize = UDim2.fromScale(0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
		}, {
			Items = Roact.createFragment(playerItems),
			["$layout"] = Roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, 5),
			}),
		})
	)
end

return PlayerList
