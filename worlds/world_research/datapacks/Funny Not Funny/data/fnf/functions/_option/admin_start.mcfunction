scoreboard players add $FNF_ADMINS_START_GAME fnf_option 1
execute unless score $FNF_ADMINS_START_GAME fnf_option matches 0..1 run scoreboard players set $FNF_ADMINS_START_GAME fnf_option 0

execute if score $FNF_ADMINS_START_GAME fnf_option matches 0 run tellraw @s [{"text":"Anyone","color":"green"},{"text":" can start the game.","color":"yellow"}]
execute if score $FNF_ADMINS_START_GAME fnf_option matches 1 run tellraw @s [{"text":"Only admins","color":"red"},{"text":" can start the game.","color":"yellow"},{"text":"\nUse: ","color":"yellow"},{"text":"/function fnf:trigger/start","clickEvent":{"action":"run_command","value":"/function fnf:trigger/start"},"color":"light_purple"}]
function fnf:no_feedback