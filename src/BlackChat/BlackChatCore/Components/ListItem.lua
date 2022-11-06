local Roact: Roact = require(script.Parent.Parent.Parent:WaitForChild("Packages"):WaitForChild("Roact"))
local config = require(script.Parent.Parent:WaitForChild("config"))

local ListItem = Roact.Component:extend("ListItem")

function ListItem:render(props)
	return (
		Roact.createElement("Frame", {
			Size = UDim2.new(0, 200, 0, 45),
			BackgroundTransparency = config.ItemTransparency,
			BackgroundColor3 = config.PrimaryColor,
		}, {
			PlayerName = Roact.createElement("TextLabel", {
				Size = UDim2.fromScale(0.6, 1),
				TextColor3 = config.FontColor,
				Font = config.Font,
				BackgroundTransparency = 1,
				TextSize = config.TextSize,
			}),
			["$layout"] = Roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
			}),
		})
	)
end

return ListItem
