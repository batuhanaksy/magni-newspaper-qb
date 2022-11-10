fx_version 'cerulean'
game 'gta5'

description '[QB] Magni-Newspaper'
version '1.0.0'
author 'Magni#0247'

client_scripts {
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'config.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

ui_page 'nui/index.html'

files {
    'nui/*.css',
    'nui/index.html',
    'nui/*.js'
}

escrow_ignore {
	'config.lua'
}

lua54 'yes'