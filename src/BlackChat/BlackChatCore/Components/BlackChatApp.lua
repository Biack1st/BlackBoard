local Roact: Roact = require(script.Parent.Parent.Parent:WaitForChild("Packages"):WaitForChild("Roact"))
local PlayerList = require(script.Parent:WaitForChild("PlayerList"))

function BlackChatApp()
	return (
		Roact.createElement("ScreenGui", nil, {
			BlackChatUi = Roact.createElement(PlayerList, {
				PlayerDatas = {},
			}),
		})
	)
end

return BlackChatApp
