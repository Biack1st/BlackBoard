local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
-- main module
local module = {}

local Roact: Roact = require(script.Parent:WaitForChild("Packages"):WaitForChild("Roact"))
local Rodux: Rodux = require(script.Parent:WaitForChild("Packages"):WaitForChild("Rodux"))

local PlayersStore: Rodux.Store = require(script:WaitForChild("Stores"):WaitForChild("PlayersStore"))

function module:Initialize()
	-- setup ui
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
	local blackChatApp = Roact.createElement(require(script:WaitForChild("Components"):WaitForChild("BlackChatApp")))
	Roact.mount(blackChatApp, game.Players.LocalPlayer.PlayerGui, "BlackChat")
end

return module
