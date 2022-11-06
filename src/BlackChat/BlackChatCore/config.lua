return {
	PrimaryColor = Color3.fromRGB(0, 0, 0), -- primary color for the board
	ItemTransparency = 0.25, -- item transparency for the board
	FontColor = Color3.fromRGB(255, 255, 255), -- font color
	Font = Enum.Font.GothamMedium, -- font
	TextSize = 20, -- text size for the text
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
