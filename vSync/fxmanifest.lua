fx_version 'cerulean'
game 'gta5'

author 'Arad | github.com/aradashkan'
description 'Listen for txAdmin scheduledRestart event and print message'
version '1.2.0'

-- server script
server_scripts {
    'server.lua',
    'tx.lua'
}

client_scripts {
    'client.lua'
}