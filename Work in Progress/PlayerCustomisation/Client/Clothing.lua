ClothingMenu = NativeUI.CreateMenu("", "OPTIONS", 0, 0)

function SetupClothingMenu(ParentMenu)
	local ClothingComponentItem = NativeUI.CreateProgressItem("Clothing", PlayerCustomisation.Reference.Clothing.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender], 1, "", false)
	local ClothingDrawableItem = NativeUI.CreateProgressItem("Clothing Drawables", {}, 1, "", true)
	local ClothingTextureItem = NativeUI.CreateProgressItem("Clothing Textures", {}, 1, "", true)
	local PropsComponentItem = NativeUI.CreateProgressItem("Props", PlayerCustomisation.Reference.Props.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender], 1, "", false)
	local PropsDrawableItem = NativeUI.CreateProgressItem("Prop Drawables", {}, 1, "", true)
	local PropsTextureItem = NativeUI.CreateProgressItem("Prop Textures", {}, 1, "", true)

	ClothingComponentItem.OnProgressChanged = function(ParentMenu, SelectedItem, NewIndex)
		ClothingDrawableItem.Data.Items = PlayerCustomisation.Reference.Clothing.Drawables[PlayerCustomisation.Reference.Clothing.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][NewIndex].Name]
		ClothingDrawableItem:Index(ClothingDrawableItem:ItemToIndex(PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type][PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender].Clothing.Drawable[PlayerCustomisation.Reference.Clothing.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][NewIndex].Value + 1]))

		ClothingTextureItem.Data.Items = PlayerCustomisation.Reference.Clothing.Textures[PlayerCustomisation.Reference.Clothing.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][NewIndex].Name][ClothingDrawableItem:Index()]
		ClothingTextureItem:Index(ClothingTextureItem:ItemToIndex(PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type][PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender].Clothing.Texture[PlayerCustomisation.Reference.Clothing.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][NewIndex].Value + 1]))
	end
	ClothingDrawableItem.OnProgressChanged = function(ParentMenu, SelectedItem, NewIndex)
		local Item = SelectedItem:IndexToItem(NewIndex)
		local ClothingComponentIndex = ClothingComponentItem:Index()

		PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type][PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender].Clothing.Drawable[PlayerCustomisation.Reference.Clothing.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][ClothingComponentIndex].Value + 1] = Item

		ClothingTextureItem.Data.Items = PlayerCustomisation.Reference.Clothing.Textures[PlayerCustomisation.Reference.Clothing.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][ClothingComponentIndex].Name][NewIndex]
		ClothingTextureItem:Index(1)

		PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type][PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender].Clothing.Texture[PlayerCustomisation.Reference.Clothing.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][ClothingComponentIndex].Value + 1] = ClothingTextureItem.Data.Items[1]

		UpdatePlayer()
	end
	ClothingTextureItem.OnProgressChanged = function(ParentMenu, SelectedItem, NewIndex)
		local Item = SelectedItem:IndexToItem(NewIndex)
		local ClothingComponentIndex = ClothingComponentItem:Index()

		PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type][PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender].Clothing.Texture[PlayerCustomisation.Reference.Clothing.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][ClothingComponentIndex].Value + 1] = Item
		
		UpdatePlayer()
	end
	PropsComponentItem.OnProgressChanged = function(ParentMenu, SelectedItem, NewIndex)
		PropsDrawableItem.Data.Items = PlayerCustomisation.Reference.Props.Drawables[PlayerCustomisation.Reference.Props.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][NewIndex].Name]
		PropsDrawableItem:Index(PropsDrawableItem:ItemToIndex(PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type][PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender].Props.Drawable[PlayerCustomisation.Reference.Props.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][NewIndex].Value + 1]))

		PropsTextureItem.Data.Items = PlayerCustomisation.Reference.Props.Textures[PlayerCustomisation.Reference.Props.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][NewIndex].Name][PropsDrawableItem:Index()]
		PropsTextureItem:Index(PropsTextureItem:ItemToIndex(PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type][PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender].Props.Texture[PlayerCustomisation.Reference.Props.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][NewIndex].Value + 1]))
	end
	PropsDrawableItem.OnProgressChanged = function(ParentMenu, SelectedItem, NewIndex)
		local Item = SelectedItem:IndexToItem(NewIndex)
		local PropsComponentIndex = PropsComponentItem:Index()

		if Item == -1 then
			ClearPedProp(PlayerPedId(), PlayerCustomisation.Reference.Props.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][PropsComponentIndex].Value)
		end

		PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type][PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender].Props.Drawable[PlayerCustomisation.Reference.Props.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][PropsComponentIndex].Value + 1] = Item

		PropsTextureItem.Data.Items = PlayerCustomisation.Reference.Props.Textures[PlayerCustomisation.Reference.Props.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][PropsComponentIndex].Name][NewIndex]
		PropsTextureItem:Index(1)

		PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type][PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender].Props.Texture[PlayerCustomisation.Reference.Props.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][PropsComponentIndex].Value + 1] = PropsTextureItem.Data.Items[1]

		UpdatePlayer()
	end
	PropsTextureItem.OnProgressChanged = function(ParentMenu, SelectedItem, NewIndex)
		local Item = SelectedItem:IndexToItem(NewIndex)
		local PropsComponentIndex = PropsComponentItem:Index()

		PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type][PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender].Props.Texture[PlayerCustomisation.Reference.Props.Options[PlayerCustomisation.PlayerData[PlayerCustomisation.PlayerData.Type].Gender][PropsComponentIndex].Value + 1] = Item
		
		UpdatePlayer()
	end

	ParentMenu:AddItem(ClothingComponentItem)
	ParentMenu:AddItem(ClothingDrawableItem)
	ParentMenu:AddItem(ClothingTextureItem)
	ParentMenu:AddItem(PropsComponentItem)
	ParentMenu:AddItem(PropsDrawableItem)
	ParentMenu:AddItem(PropsTextureItem)
end

SetupClothingMenu(ClothingMenu)