local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('fxo-towrequest:client:OpenTowOptions', function(args)
    local forceremove = true
    QBCore.Functions.GetPlayerData(function(PlayerData)

        if PlayerData.job.name == Config.PoliceJob then forceremove = false
            forceremovetxt = (Lang:t("forceremove.forceremovetxtaccess"))
        else forceremove = true
            forceremovetxt = (Lang:t("forceremove.forceremovetxtnoaccess"))
        end
        if PlayerData.job.name == Config.PoliceJob then



            exports['qb-menu']:openMenu({
                {
                    header = "Police Depot And Impound",
                    isMenuHeader = true, 
                    icon = "fa-solid fa-gears", 
                },
                {
                    header = (Lang:t("tow.depotmenuheader")),
                    txt = (Lang:t("tow.depotmenutxt")),
                    icon = "fa-solid fa-gears",
                    params = {
                        event = "fxo-towrequest:client:OpenDepotMenu",
                    }
                },
                {
                    header = (Lang:t("tow.impoundmenuheader")),
                    txt = (Lang:t("tow.impoundmenutxt")),
                    icon = "fa-solid fa-gears", 
                    params = {
                    event = "fxo-towrequest:client:OpenImpoundMenu",
                    }
                },
                {
                    header = (Lang:t("forceremove.forceremoveheader")),
                    txt = forceremovetxt,
                    icon = "fa-solid fa-gears", 
                    disabled = forceremove,
                    params = {
                        event = "fxo-towrequest:client:forceremove",
                    }
                },
                {
                    header = (Lang:t("tow.close")),
                    icon = "fa-solid fa-xmark",
                    params = {
                        event = "",
                    }
                },
            })
        else
            exports['qb-menu']:openMenu({
                {
                    header = "Request Tow Truck",
                    txt = "Select the reason why the car needs to be towed",
                    isMenuHeader = true, 
                    icon = "fa-solid fa-gears",
                },
                {
                    header = (Lang:t("tow.damagedvehicleheader")),
                    txt = (Lang:t("tow.damagedvehicletxt")),
                    icon = "fa-solid fa-car-burst", 
                    params = {
                        event = "fxo-towrequest:client:tow",
                        args = {
                            reason = (Lang:t("tow.damagedvehicleheader")),
                        }
                    }
                },

                {
                    header = (Lang:t("tow.missingtireheader")),
                    txt = (Lang:t("tow.missingtiretxt")),
                    icon = "fa-solid fa-gear", 
                    params = {
                        event = "fxo-towrequest:client:tow",
                        args = {
                            reason = (Lang:t("tow.missingtireheader")),
                        }
                    }
                },

                {
                    header = (Lang:t("tow.outoffuelheader")),
                    txt = (Lang:t("tow.outoffueltxt")),
                    icon = "fa-solid fa-gas-pump", 
                    params = {
                        event = "fxo-towrequest:client:tow",
                        args = {
                            reason = (Lang:t("tow.outoffuelheader")),
                        }
                    }
                },
                {
                    header = (Lang:t("tow.close")),
                    icon = "fa-solid fa-xmark",
                    params = {
                        event = "",
                    }
                },
            })
        end
    end)
end)

RegisterNetEvent('fxo-towrequest:client:OpenDepotMenu', function(args)
    exports['qb-menu']:openMenu({
        {
            header = "Police Depot Options",
            txt = "Select the reason why the car needs to be towed",
            isMenuHeader = true, 
            icon = "fa-solid fa-gears", 
        },
        {
            header = (Lang:t("depot.damagedvehicleheader")),
            txt = (Lang:t("depot.damagedvehicletxt")),
            icon = "fa-solid fa-car-burst", 
            params = {
                event = "fxo-towrequest:client:depot", 
                args = {
                    reason = (Lang:t("depot.damagedvehicleheader")),
                }
            }
        },
        {
            header = (Lang:t("depot.illegalparkingheader")),
            txt = (Lang:t("depot.illegalparkingtxt")),
            icon = "fa-solid fa-square-parking", 
            params = {
                event = "fxo-towrequest:client:depot",
                args = {
                    reason = (Lang:t("depot.illegalparkingheader")),
                }
            }
        },
        {
            header = (Lang:t("tow.goback")),
            icon = "fa-solid fa-rotate-left",
            params = {
                event = "fxo-towrequest:client:OpenTowOptions",
            }
        },
        {
            header = (Lang:t("tow.close")),
            icon = "fa-solid fa-xmark",
            params = {
                event = "",
            }
        },
    })
end)


RegisterNetEvent('fxo-towrequest:client:OpenImpoundMenu', function(args)
    exports['qb-menu']:openMenu({
        {
            header = "Police Impound Options",
            txt = "Select the reason why the car needs to be towed",
            isMenuHeader = true, 
            icon = "fa-solid fa-gears", 
        },
        {
            header = (Lang:t("impound.getawayvehicleheader")),
            txt = (Lang:t("impound.getawayvehicletxt")),
            icon = "fa-solid fa-car-on", 
            params = {
                event = "fxo-towrequest:client:impound", 
                args = {
                    reason = (Lang:t("impound.getawayvehicleheader")),
                }
            }
        },
        {
            header = (Lang:t("impound.bolovehicleheader")),
            txt = (Lang:t("impound.bolovehicletxt")),
            icon = "fa-solid fa-car", 
            params = {
                event = "fxo-towrequest:client:impound", 
                args = {
                    reason = (Lang:t("impound.bolovehicleheader")),
                }
            }
        },
        {
            header = (Lang:t("impound.stolenvehicleheader")),
            txt = (Lang:t("impound.stolenvehicletxt")),
            icon = "fa-solid fa-mask", 
            params = {
                event = "fxo-towrequest:client:impound", 
                args = {
                    reason = (Lang:t("impound.stolenvehicleheader")),
                }
            }
        },
        {
            header = (Lang:t("tow.goback")),
            icon = "fa-solid fa-rotate-left",
            params = {
                event = "fxo-towrequest:client:OpenTowOptions",
            }
        },
        {
            header = (Lang:t("tow.close")),
            icon = "fa-solid fa-xmark",
            params = {
                event = "",
            }
        },
    })
end)

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

