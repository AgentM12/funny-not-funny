execute if score $FNF_START_GAME fnf_timer matches 10.. run title @a actionbar ["",{"text":"Game queue was cancelled!","color":"red"}]
execute if score $FNF_START_GAME fnf_timer matches 10.. run scoreboard players set $FNF_START_GAME fnf_timer -1

execute if score $FNF_START_GAME fnf_timer matches 10.. run function fnf:trigger/reset_lever