execute if score $FNF_PLAYERS fnf_game < $FNF_MIN_PLAYERS fnf_const run tellraw @a [{"text":"Unable to start game. At least ","color":"red"},{"score":{"name":"$FNF_MIN_PLAYERS","objective":"fnf_const"},"color":"yellow","bold":true},{"text":" players should join!"}]
execute if score $FNF_PLAYERS fnf_game > $FNF_MAX_PLAYERS fnf_const run tellraw @a [{"text":"At most ","color":"red"},{"score":{"name":"$FNF_MAX_PLAYERS","objective":"fnf_const"},"color":"yellow","bold":true},{"text":" players can play at once, participating players will be picked at random!"}]

execute if score $FNF_PLAYERS fnf_game >= $FNF_MIN_PLAYERS fnf_const run scoreboard players set $FNF_START_GAME fnf_timer 100
execute if score $FNF_PLAYERS fnf_game >= $FNF_MIN_PLAYERS fnf_const as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 2 0

execute if score $FNF_ADMINS_START_GAME fnf_option matches 1 run tellraw @a [{"text":"An admin can cancel the game queue by clicking ","color":"yellow"},{"text":"[Here]","color":"light_purple","clickEvent":{"action":"run_command","value":"/function fnf:trigger/cancel_start"}}]
function fnf:no_feedback