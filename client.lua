
function SetDisplay(bool)
    SendNUIMessage({
        type = "show",
        status = bool,
    })
    SetNuiFocus(bool, bool)
end



Citizen.CreateThread(function()
	while true do 
        Wait(10)
        local coords = GetEntityCoords(PlayerPedId())
        local playerPed = PlayerPedId()
		local Distance = GetDistanceBetweenCoords(coords, Config.coords, true)
		
        if Distance < 15 then
            DrawMarker(36, Config.coords.x, Config.coords.y, Config.coords.z + 2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.scale.x, Config.scale.y, Config.scale.z, 255, 0, 0, 50, false, true, 2, nil, nil, false)
			if Distance <= 3.0 then
                ESX.ShowHelpNotification("Press E To ~b~RENT")
                if IsControlJustPressed(1, 38) then
                    TriggerServerEvent("ng_rent:getmoney")
                    SetDisplay(true)
			    end
            end
		else
			Wait(1000) 
		end
	end
end)

RegisterNetEvent('ng_rent:setmoneydata', function(money)
    SendNUIMessage({action = 'update', type = 'money', data = {value = money}})
end)

RegisterNetEvent('ng_rent:givecar', function(veh)
    ESX.ShowNotification("You have ".. Config.MinutesToDelete/1000 .." minute to delete vehicle")
    
    local model = GetHashKey(veh)
    if not IsModelInCdimage(model) then return end
        RequestModel(model) -- Request the model
        while not HasModelLoaded(model) do -- Waits for the model to load
          Wait(0)
        end
        local Vehicle = CreateVehicle(model, Config.SpawnCar.x, Config.SpawnCar.y, Config.SpawnCar.z, 252.28, true, false) -- Spawns a networked vehicle on your current coords
        SetPedIntoVehicle(PlayerPedId(), Vehicle, -1)
    Citizen.Wait(Config.MinutesToDelete)
    DeleteVehicle(Vehicle)
end)




RegisterNUICallback("close", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("car", function(data)
    local vehicletype = 'car'
    TriggerServerEvent('ng_rent:getmoneyand', vehicletype)
    SetDisplay(false)
end)

RegisterNUICallback("moto", function(data)
    local vehicletype = 'moto'
    TriggerServerEvent('ng_rent:getmoneyand', vehicletype)
    SetDisplay(false)
end)

RegisterNUICallback("bike", function(data)
    local vehicletype = 'bike'
    TriggerServerEvent('ng_rent:getmoneyand', vehicletype)
    SetDisplay(false)
end)


