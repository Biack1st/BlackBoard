local Roact: Roact = require(script.Parent.Parent.Parent:WaitForChild("Packages"):WaitForChild("Roact"))
local ListItem = require(script.Parent:WaitForChild("ListItem"))

function BlackChatApp()
	return (
		Roact.createElement("ScreenGui", {
			IgnoreGuiInset = true,
		}, {
			TestItem = Roact.createElement(ListItem),
		})
	)
end

return BlackChatApp
