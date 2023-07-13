local Translations = {
    error = {
        ["canceled"]                   = "Canceled",
        ["novehiclefound"]             = "No vehicle found!",
        ["onlypolice"]                 = "Only the police can do this!",
    },
    tow = {
        ["depotmenuheader"]            = "Depot Options",
        ["depotmenutxt"]               = "Select the reason why the vehicle must be in the depot.",

        ["impoundmenuheader"]          = "Impound Options",
        ["impoundmenutxt"]             = "Select the reason for impounding the vehicle.",


        ["goback"]                     = "Go Back",
        ["close"]                      = "Close",

        ["progressbar"]                = "Requesting Tow Truck..",
        
        
        ["damagedvehicleheader"]       = "Damaged vehicle.",
        ["damagedvehicletxt"]          = "Damaged vehicle, unable to drive",

        
        ["missingtireheader"]          = "Missing Tire",
        ["missingtiretxt"]             = "The Vehicle is missing a tire",


        ["outoffuelheader"]           = "Out of fuel",
        ["outoffueltxt"]              = "The vehicle has run out of fuel",

        ["blipname"]                  = "Tow Request",


    },
    depot = {
        ["damagedvehicleheader"]       = "Totally damaged vehicle.",
        ["damagedvehicletxt"]          = "Totally damaged vehicle, no possibility of repair.",

        ["illegalparkingheader"]       = "Illegal Parking.",
        ["illegalparkingtxt"]          = "The vehicle is parked illegally.",

        ["progressbar"]                = "Requesting Tow Truck..",
    },
    impound = {

        ["getawayvehicleheader"]       = "Getaway Vehicle.",
        ["getawayvehicletxt"]          = "Vehicle used for a police chase.",

        ["bolovehicleheader"]          = "BOLO Vehicle.",
        ["bolovehicletxt"]             = "Wanted Vehicle.",

        ["stolenvehicleheader"]        = "Wanted Vehicle.",
        ["stolenvehicletxt"]           = "Vehicle reported stolen.",

        ["progressbar"]                = "Requesting Tow Truck..",
    },
    forceremove = {
        ["forceremoveheader"]          = "Force Remove",
        ["forceremovetxtaccess"]       = "Force remove a vehicle",
        ["forceremovetxtnoaccess"]     = "You do not have access to this",

        ["forceremoveprog"]            = "Removing Vehicle..",
    },
    notify = {
        ["towrequest"]                 = "Tow Request: ",
        ["vehicelplate"]               = "Vehicle Plate: ",

        ["reasonheader"]               = "Tow Reason: ",
        ["reasontxt"]                  = "  ",

        ["successrequest"]             = "Tow Trucker has been called",
        ["forceremoved"]               = "MAGIC!! THE VEHICLE IS GONE",

        ["acceptedrequestheader"]      = "Tow request accepted by ",
        ["acceptedrequesttxt"]         = "They will be there shortly!",
        ["declinedrequestheader"]      = "Tow request declined.",
        ["declinedrequesttxt"]         = "Declined",

    },

}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
