local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('fxo-towrequest:server:depot', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.PoliceJob then
        TriggerClientEvent('QBCore:Command:DeleteVehicle', src)
    else
        TriggerClientEvent('QBCore:Notify', src,  (Lang:t("error.onlypolice")), 'error')
    end
end)

RegisterServerEvent('fxo-towrequest:server:impound', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.PoliceJob then
        TriggerClientEvent("police:client:ImpoundVehicle", src, true)
    else
        TriggerClientEvent('QBCore:Notify', src,  (Lang:t("error.onlypolice")), 'error')
    end
end)

RegisterServerEvent('fxo-towrequest:server:forceremove', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.PoliceJob then
        TriggerClientEvent('QBCore:Command:DeleteVehicle', src)
        TriggerClientEvent('QBCore:Notify', src,  (Lang:t("notify.forceremoved")), 'error')

    else
        TriggerClientEvent('QBCore:Notify', src, (Lang:t("error.onlypolice")), 'error')
    end
end)




RegisterServerEvent('fxo-towrequest:sendTowRequest')
AddEventHandler('fxo-towrequest:sendTowRequest', function(plate, coords, data)
    local src = source
    local players = QBCore.Functions.GetPlayers()

    for _, playerId in ipairs(players) do
        local player = QBCore.Functions.GetPlayer(playerId)
        if player ~= nil and player.PlayerData.job.name == Config.TowJob then
            TriggerClientEvent('fxo-towrequest:receiveTowRequest', playerId, src, plate, coords, data)
        end
    end
end)

RegisterServerEvent('fxo-towrequest:sendTowResponse')
AddEventHandler('fxo-towrequest:sendTowResponse', function(target, accepted)
    local towDriver = QBCore.Functions.GetPlayer(source)
    local towDriverName = towDriver.PlayerData.charinfo.firstname

    TriggerClientEvent('fxo-towrequest:requestResponse', target, towDriverName, accepted)
end)











