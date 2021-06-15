
execute if score $FNF_PLAYERS fnf_game < $FNF_MIN_PLAYERS fnf_const run tellraw @a [{"text":"Unable to start game. At least ","color":"red"},{"score":{"name":"$FNF_MIN_PLAYERS","objective":"fnf_const"},"color":"yellow","bold":true},{"text":" players should join!"}]
execute if score $FNF_PLAYERS fnf_game > $FNF_MAX_PLAYERS fnf_const run tellraw @a [{"text":"At most ","color":"red"},{"score":{"name":"$FNF_MAX_PLAYERS","objective":"fnf_const"},"color":"yellow","bold":true},{"text":" players can play at once, participating players will be picked at random!"}]

execute if score $FNF_PLAYERS fnf_game >= $FNF_MIN_PLAYERS fnf_const run scoreboard players set $FNF_START_GAME fnf_timer 100