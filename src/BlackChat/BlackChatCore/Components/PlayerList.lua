local Roact: Roact = require(script.Parent.Parent.Parent:WaitForChild("Packages"):WaitForChild("Roact"))
local config = require(script.Parent.Parent:WaitForChild("config"))

local PlayerList = Roact.Component:extend("PlayerList")

function PlayerList:render()
	local props = self.props

	local PlayerDatas = props.PlayerDatas
	return (
		Roact.createElement("ScrollingFrame", {
			Size = UDim2.new(0, 200, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 6,
			ScrollBarImageColor3 = config.ScrollBarColor,
			CanvasSize = UDim2.fromScale(0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
		})
	)
end

return PlayerList
