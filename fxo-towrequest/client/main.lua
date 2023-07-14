local QBCore = exports['qb-core']:GetCoreObject()
local ImpoundLocation = {}


RegisterNetEvent('fxo-towrequest:client:tow', function(data)
    local reason = data.reason
    exports["rpemotes"]:EmoteCommandStart("phonecall", 6)
    QBCore.Functions.Progressbar("tow", (Lang:t("tow.progressbar")), 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        exports["rpemotes"]:EmoteCancel(true)
        TriggerEvent('fxo-towrequest:requestTow', data)
        QBCore.Functions.Notify((Lang:t("notify.successrequest")), 'success')
    end, function() -- Cancel
        exports["rpemotes"]:EmoteCancel(true)
        QBCore.Functions.Notify(Lang:t("error.canceled"), 'error')
     end)
end)

RegisterNetEvent('fxo-towrequest:client:depot', function(data)
    local reason = data.reason
    exports["rpemotes"]:EmoteCommandStart("phonecall", 6)
    QBCore.Functions.Progressbar("depot", (Lang:t("depot.progressbar")), 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        exports["rpemotes"]:EmoteCancel(true)
        --TriggerServerEvent("fxo-towrequest:server:depot")
        TriggerEvent('fxo-towrequest:requestTow', data)
        QBCore.Functions.Notify((Lang:t("notify.successrequest")), 'success')

    end, function() -- Cancel
        exports["rpemotes"]:EmoteCancel(true)
        QBCore.Functions.Notify(Lang:t("error.canceled"), 'error')
     end)
end)

RegisterNetEvent('fxo-towrequest:client:impound', function(data)
    local reason = data.reason
    exports["rpemotes"]:EmoteCommandStart("phonecall", 6)
    QBCore.Functions.Progressbar("impound", (Lang:t("impound.progressbar")), 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        exports["rpemotes"]:EmoteCancel(true)
        --TriggerServerEvent("fxo-towrequest:server:impound")
        TriggerEvent('fxo-towrequest:requestTow', data)
        QBCore.Functions.Notify((Lang:t("notify.successrequest")), 'success')
     end, function() -- Cancel
        exports["rpemotes"]:EmoteCancel(true)
        QBCore.Functions.Notify(Lang:t("error.canceled"), 'error')
     end)
end)

RegisterNetEvent('fxo-towrequest:client:forceremove', function()
    exports["rpemotes"]:EmoteCommandStart("broom2", 0)
    QBCore.Functions.Progressbar("forceremove", (Lang:t("forceremove.forceremoveprog")), 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        exports["rpemotes"]:EmoteCancel(true)
        TriggerServerEvent('fxo-towrequest:server:forceremove')
     end, function() -- Cancel
        exports["rpemotes"]:EmoteCancel(true)
        QBCore.Functions.Notify(Lang:t("error.canceled"), 'error')
     end)
end)

RegisterNetEvent('fxo-towrequest:requestTow')
AddEventHandler('fxo-towrequest:requestTow', function(data)
    local player = PlayerPedId()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local coords = GetEntityCoords(player)

    if vehicle ~= 0 then
        TriggerServerEvent('fxo-towrequest:sendTowRequest', GetVehicleNumberPlateText(vehicle), coords, data)
    else
        QBCore.Functions.Notify((Lang:t("error.novehiclefound")), 'error')
    end
end)

RegisterNetEvent('fxo-towrequest:requestResponse')
AddEventHandler('fxo-towrequest:requestResponse', function(towDriverName, accepted)
    if accepted then
        exports['qb-phone']:PhoneNotification((Lang:t("notify.acceptedrequestheader")) .. towDriverName, ((Lang:t("notify.acceptedrequesttxt"))), 'fas fa-info', '#FF8C00', 7500)
    else
        exports['qb-phone']:PhoneNotification(((Lang:t("notify.declinedrequestheader"))), ((Lang:t("notify.declinedrequesttxt"))), '#9f0e63', "NONE", 5000)
    end
end)

RegisterNetEvent('fxo-towrequest:receiveTowRequest')
AddEventHandler('fxo-towrequest:receiveTowRequest', function(target, plate, coords, data)
    local reason = data.reason
    local success = exports['qb-phone']:PhoneNotification((Lang:t("notify.towrequest")), ((Lang:t("notify.vehicelplate"))) .. plate,  'fas fa-map-pin', '#FF8C00', 7500, 'fas fa-check-circle', 'fas fa-times-circle')
    if success then
        TriggerEvent('qb-phone:client:CustomNotification', (Lang:t("notify.reasonheader")), (Lang:t("notify.reasontxt")) .. reason, 'fas fa-info', '#FF8C00', 7500)
        TriggerServerEvent('fxo-towrequest:sendTowResponse', target, true)
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipAsShortRange(blip, false)
        SetBlipSprite(blip, 280)
        SetBlipColour(blip, 5)
        SetBlipScale(blip, 1.0)
        SetBlipDisplay(blip, 6)
        SetBlipRoute(blip, true)
        SetBlipRouteColour(blip, 5)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName((Lang:t("tow.blipname")))
        EndTextCommandSetBlipName(blip)
        Wait(130000)
        RemoveBlip(blip)
    else
        TriggerServerEvent('fxo-towrequest:sendTowResponse', target, false)
    end
end)


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    CreateImpoundZones()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        CreateImpoundZones()
    end
end)

function CreateImpoundZones()
    QBCore.Functions.GetPlayerData(function(PlayerData)

        for k, v in pairs(Config.ImpoundLocation) do
            local ImpoundLocation = PolyZone:Create(v.zones, {
                    name = 'ImpoundLocation ' .. k,
                    minZ = v.minz,
                    maxZ = v.maxz,
                    debugPoly = Config.Debug
               })

               ImpoundLocation:onPlayerInOut(function(isPointInside)
		    	if isPointInside then
                    InImpoundZone = true
                    RadialMenu = exports['qb-radialmenu']:AddOption({
                        id = 'fxp-depotandimpound',
                        title = 'Impound Lot',
                        icon = 'square-parking',
                        type = 'client',
                        event = 'fxo-towrequest:client:ImpoundLot',
                        shouldClose = true
                    })
                else
                    exports['qb-radialmenu']:RemoveOption(RadialMenu)
                end
			end)
		end
	end)
end

RegisterNetEvent('fxo-towrequest:client:depotvehicle', function()
    exports["rpemotes"]:EmoteCommandStart("clipboard", 0)
    QBCore.Functions.Progressbar("depotvehicle", (Lang:t("tow.depotvehicle")), 15000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        exports["rpemotes"]:EmoteCancel(true)
        TriggerServerEvent('fxo-towrequest:server:depot')
     end, function() -- Cancel
        exports["rpemotes"]:EmoteCancel(true)
        QBCore.Functions.Notify(Lang:t("error.canceled"), 'error')
     end)
end)

RegisterNetEvent('fxo-towrequest:client:impoundvehicle', function()
    TriggerServerEvent('fxo-towrequest:server:impound')
end)