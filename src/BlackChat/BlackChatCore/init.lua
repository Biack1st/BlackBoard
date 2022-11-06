-- main module
local module = {}
local Roact: Roact = require(script.Parent:WaitForChild("Packages"):WaitForChild("Roact"))

local config = require(script:WaitForChild("config"))

function module:Initialize()
	local blackChatApp = Roact.createElement(require(script:WaitForChild("Components"):WaitForChild("BlackChatApp")))
	Roact.mount(blackChatApp, game.Players.LocalPlayer.PlayerGui, "BlackChat")
end

return module
