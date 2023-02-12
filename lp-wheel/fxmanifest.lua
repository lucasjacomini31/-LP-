fx_version 'cerulean'
game 'gta5'

description 'lp-wheel'
version '0.0.1'

shared_scripts {
    '@qb-core/shared/locale.lua',
	'locales/en.lua',
	'locales/*.lua',
}

client_scripts {
    'client/client.lua',
}

lua54 'yes'
