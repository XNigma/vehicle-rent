RegisterServerEvent('ng_rent:getmoney', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney()
    
    TriggerClientEvent('ng_rent:setmoneydata',source, money)
end)

RegisterServerEvent('ng_rent:getmoneyand', function(vehicletype)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        if vehicletype == 'car' then
            if xPlayer.getMoney() >= 1000 then
                local veh = Config.Type.car
                TriggerClientEvent('ng_rent:givecar',source, veh)
                xPlayer.removeMoney(1000)
            else
                xPlayer.showNotification('You dont have money')
            end
        elseif vehicletype == 'moto' then
            if xPlayer.getMoney() >= 1000 then
                local veh = Config.Type.moto
                TriggerClientEvent('ng_rent:givecar',source, veh)
                xPlayer.removeMoney(1000)
            else
                xPlayer.showNotification('You dont have money')
            end
        elseif vehicletype == 'bike' then
            if xPlayer.getMoney() >= 1000 then
                local veh = Config.Type.bike
                TriggerClientEvent('ng_rent:givecar',source, veh)
                xPlayer.removeMoney(1000)
            else
                xPlayer.showNotification('You dont have money')
            end
        end
    end
end)