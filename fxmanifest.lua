name 'AMIR Leaderboard Sign'
description 'Control the display on the AMIR Leaderboard'

author 'glitchdetector'

game 'gta5'
fx_version 'adamant'

file 'stream/def_amir_speedway.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/def_amir_speedway.ytyp'

file 'LCDMB___.TTF'
file 'speedway.html'
file 'ads/*.png'

this_is_a_map 'rrerr'

server_script 'sv_speedway.lua'
client_script 'cl_speedway.lua'