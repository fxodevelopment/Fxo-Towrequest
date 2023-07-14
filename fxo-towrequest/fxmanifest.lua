fx_version 'cerulean'
game 'gta5'

author 'F0xzY x oste Development'
description 'Tow Request made to get a better RP experience'
version '1.0.0'

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'client/main.lua',
    'client/menu.lua'
}

server_scripts {
    'server/main.lua',
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua', 
    'config.lua',
}
