
execute unless score $FNF_STATE fnf_game matches 0 unless score @s fnf_game = $FNF_ID fnf_game run function fnf:game/players/game_id_mismatch

execute if score $FNF_STATE fnf_game matches 0 run function fnf:game/players/return_to_lobby
execute if score $FNF_STATE fnf_game matches 0 run tellraw @s [{"text":"Welcome to ","color":"yellow"},{"text":"Funny Not Funny","color":"green"},{"text":" by "},{"color":"light_purple","text":"AgentM","clickEvent":{"action":"open_url","value":"https://www.youtube.com/c/AgentMOfficial"}},{"text":"\nFor more info about this project, click here!","clickEvent":{"action":"open_url","value":"https://tinyurl.com/rp-fnf-info"}}]

scoreboard players reset @s fnf_relog