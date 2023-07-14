local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('fxo-towrequest:client:OpenTowOptions', function(args) -- This first menu is where the police chose if they want to Depot, Impound or Force Remove 
    local forceremove = true
    QBCore.Functions.GetPlayerData(function(PlayerData)

        if PlayerData.job.type == Config.PoliceType then forceremove = false
            forceremovetxt = (Lang:t("forceremove.forceremovetxtaccess"))
        else forceremove = true
            forceremovetxt = (Lang:t("forceremove.forceremovetxtnoaccess"))
        end
        if PlayerData.job.type == Config.PoliceType then



            exports['qb-menu']:openMenu({  -- Police Depot, Impound and Force Remove   
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
            exports['qb-menu']:openMenu({ -- This is the Civilian menu. Here the Civilian can select the reason to the tow request
                                          -- To add more reasons you have to make another section with Qb-Menu. 
                {                         -- You can copy one of the existent and change the Lang:t . You dont have to change the Event.
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

RegisterNetEvent('fxo-towrequest:client:OpenDepotMenu', function(args) -- This is the Police Depot menu, here the police can chose the depot reason. 
    exports['qb-menu']:openMenu({ -- To add more Depot reasons you have to make another section with Qb-Menu. 
        {                         -- You can copy one of the existent and change the Lang:t . You dont have to change the Event.
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


RegisterNetEvent('fxo-towrequest:client:OpenImpoundMenu', function(args) -- This is the Police Impound menu, here the police can chose the Impound reason. 
    exports['qb-menu']:openMenu({ -- To add more Impound reasons you have to make another section with Qb-Menu. 
        {                         -- You can copy one of the existent and change the Lang:t . You dont have to change the Event.
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

RegisterNetEvent('fxo-towrequest:client:ImpoundLot', function(args) -- This is the Impound Lot menu, here can the Police and Tow Truckers Impound and Depot
    QBCore.Functions.GetPlayerData(function(PlayerData)

    if PlayerData.job.type == Config.PoliceType then impoundvehicle = false
        impoundvehicletxt = (Lang:t("tow.impoundvehicletxt"))
    else impoundvehicle = true
        impoundvehicletxt = (Lang:t("tow.impoundvehicletxtnoaccess"))
    end

    if PlayerData.job.name == Config.TowJob then depotvehicle = false
        depotvehicletxt = (Lang:t("tow.depotvehicletxt"))
    else depotvehicle = true
        depotvehicletxt = (Lang:t("tow.depotvehicletxtnoaccess"))
    end
    

        exports['qb-menu']:openMenu({
            {
                header = (Lang:t("tow.impoundlotheader")),
                txt = "",
                isMenuHeader = true, 
                icon = "fa-solid fa-gears", 
            },
            {
                header = (Lang:t("tow.depotvehicleheader")),
                txt = depotvehicletxt,
                icon = "fa-solid fa-car-on", 
                params = {
                    event = "fxo-towrequest:client:depotvehicle",
                },
                disabled = depotvehicle,
            },
            {
                header = (Lang:t("tow.impoundvehicleheader")),
                txt = impoundvehicletxt,
                icon = "fa-solid fa-car-on",
                params = {
                    event = "fxo-towrequest:client:impoundvehicle",
                },
                disabled = impoundvehicle,
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
end)




