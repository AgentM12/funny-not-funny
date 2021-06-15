execute if score $FNF_PLAYERS fnf_game < $FNF_MIN_PLAYERS fnf_const run tellraw @a [{"text":"Unable to start game. At least ","color":"red"},{"score":{"name":"$FNF_MIN_PLAYERS","objective":"fnf_const"},"color":"yellow","bold":true},{"text":" players should join!"}]
execute if score $FNF_PLAYERS fnf_game < $FNF_MIN_PLAYERS fnf_const run function fnf:trigger/cancel_start

execute if score $FNF_PLAYERS fnf_game >= $FNF_MIN_PLAYERS fnf_const if score $FNF_STATE fnf_game matches 0 run function fnf:state/1_prompt/transition