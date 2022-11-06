local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Roact: Roact = require(script.Parent.Parent.Parent:WaitForChild("Packages"):WaitForChild("Roact"))
local config = require(script.Parent.Parent:WaitForChild("config"))

local ListItem = Roact.Component:extend("ListItem")

local presets = {
	"color",
}

function ListItem:render()
	local playerData = self.props.PlayerData
	return (
		Roact.createElement("Frame", {
			Size = config.ItemSize,
			BackgroundTransparency = config.ItemTransparency,
			BackgroundColor3 = config.PrimaryColor,
		}, {
			MainItemHolder = Roact.createElement("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				[Roact.Event.InputBegan] = function(frame, inputData: InputObject)
					if inputData.UserInputType == Enum.UserInputType.MouseMovement then
						local hoverData = config.ItemHoverData
						if not hoverData then
							return
						end

						if hoverData == "Color" then
							TweenService:Create(frame, config.ItemHoverEffectInfo, {})
						end
					end
				end,
			}, {
				PlayerName = Roact.createElement("TextLabel", {
					Size = UDim2.fromScale(0.8, 1),
					TextColor3 = config.FontColor,
					Font = config.Font,
					BackgroundTransparency = 1,
					TextSize = config.TextSize,
					Text = playerData.username,
				}),
				["$layout"] = Roact.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
				}),
				["$padding"] = Roact.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 5),
				}),
				PlayerImageHolder = Roact.createElement("Frame", {
					Size = UDim2.fromOffset(40, 40),
					LayoutOrder = -2,
					BackgroundTransparency = 1,
				}, {
					["$corners"] = Roact.createElement("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
					Image = Roact.createElement("ImageLabel", {
						Size = UDim2.fromScale(1, 1),
						Image = Players:GetUserThumbnailAsync(
							playerData.userId,
							Enum.ThumbnailType.HeadShot,
							Enum.ThumbnailSize.Size420x420
						),
						BackgroundTransparency = 1,
					}, {
						["$corners"] = Roact.createElement("UICorner", {
							CornerRadius = UDim.new(0, 8),
						}),
					}),
				}),
			}),
			["$corners"] = Roact.createElement("UICorner", {
				CornerRadius = UDim.new(0, config.CornerLength),
			}),
		})
	)
end

return ListItem
