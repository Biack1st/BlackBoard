return {
	PrimaryColor = Color3.fromRGB(9, 9, 9), -- primary color for the board
	ItemTransparency = 0.45, -- item transparency for the board
	ItemSize = UDim2.fromOffset(200, 50), -- the size of an item
	ItemHoverEffectInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), -- the hover affect tween info
	ItemHoverData = "Color", -- the data of the item hover. Color is one preset. Keep nil if you dont want an effect.
	BoardSize = UDim2.new(0, 200, 0.5, 0), -- the size of the board
	FontColor = Color3.fromRGB(255, 255, 255), -- font color
	Font = Enum.Font.GothamMedium, -- font
	TextSize = 20, -- text size for the text
	ScrollBarColor = Color3.fromRGB(255, 255, 255), -- scrollbar color
	CornerLength = 5, -- the length of corners
	ColorPattern = {}, -- for color patterns so like red, white, black and will format it inside of the coloring. Overrides primary color
	GroupIcons = {
		-- icons for certain groups ie admins and star creators.
		-- FORMAT: [GROUPID] = ICON_IMAGE_ID
	},
	RoleIcons = {
		-- icons for certain roles inside of a group
		-- FORMAT: [1] = {RoleId = 0, GroupId = 0}
	},
}
