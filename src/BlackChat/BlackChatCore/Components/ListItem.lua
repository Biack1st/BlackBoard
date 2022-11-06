local Roact: Roact = require(script.Parent.Parent.Parent:WaitForChild("Packages"):WaitForChild("Roact"))
local config = require(script.Parent.Parent:WaitForChild("config"))

local ListItem = Roact.Component:extend("ListItem")

function ListItem:render(props)
	return (
		Roact.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 45),
			BackgroundTransparency = config.ItemTransparency,
			BackgroundColor3 = config.PrimaryColor,
		})
	)
end

return ListItem
