RegisterServerEvent('scrapyardgiveitem')
AddEventHandler('scrapyardgiveitem', function(item_id)
	local source = source
	TriggerEvent("inventory:add_server", source, item_id, 1)
end)