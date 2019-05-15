RegisterServerEvent('Garbage.Success')
AddEventHandler('Garbage.Success', function()
	TriggerEvent("core:getuser", source, function(user)
		user.addWallet(150)
	end)
end)

RegisterServerEvent('Garbage.Rent')
AddEventHandler('Garbage.Rent', function()
	local source = source
	TriggerEvent('core:getuser', source, function(user)
		if user.get("wallet") >= 250 then
			user.removeWallet(250)
			TriggerClientEvent('Garbage.Rent', source)
		else
			user.removeBank(250)
			TriggerClientEvent('Garbage.Rent', source)
		end
	end)
end)
