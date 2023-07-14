## F0xzY x oste Development

## What is this?
I've always found the Tow Truck Job to be boringly original, so I've done a bit more for it.
It provides more RP options for Tow Truckers.
It's nothing groundbreaking, but I think it adds a lot to the Tow Truck Job.

If you have any questions, please join the linked Discord server.

## NOTE - Some of the things you see in the preview may be in Danish. If so, this has been changed in the script.
## NOTE - If you want to add your own Impound or Depot Options, go into 'fxo-towrequest/client/menu.lua' there will be a guide there


Our Tebex Store - https://fxo.tebex.io/
Our Discord Server - https://discord.gg/rwnwevZGTw

# Dependencies
- QB-Core 
- QB-Target
- QB-Menu
- QB-Towjob
- QB-PoliceJob
- Renewed QB-Phone 
- RP Emotes 
- PolyZone

## Installation

- Insert the Target function in qb-target/init.lua

```lua
Config.GlobalVehicleOptions = {
	options = {
        {
            type = 'client',
            event = "fxo-towrequest:client:OpenTowOptions",
            icon = "fas fa-lock",
            label = "Request Tow",
        },
    },
    distance = 1.5
}
```

- Set Config.lua to your preference
- Make sure you have the correct dependencies installed
- Enjoy!

## Credit
The general idea comes from Maji. After seeing Maji's Tow Request and having previously used Green's Impound script, I thought it would be cool to combine them and get an even better experience from the scripts.

Green - https://github.com/GreenSlayer/dynyx-impound
Maji - https://github.com/PineappleOnMyPizza/qb-towrequest