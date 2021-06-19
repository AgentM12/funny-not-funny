scoreboard players add $FNF_HIDDEN_VOTES fnf_option 1
execute unless score $FNF_HIDDEN_VOTES fnf_option matches 0..1 run scoreboard players set $FNF_HIDDEN_VOTES fnf_option 0

execute if score $FNF_HIDDEN_VOTES fnf_option matches 0 run tellraw @s [{"text":"Votes will be ","color":"yellow"},{"text":"Shown to everyone","color":"green"}]
execute if score $FNF_HIDDEN_VOTES fnf_option matches 1 run tellraw @s [{"text":"Votes will be ","color":"yellow"},{"text":"Remain anonymous","color":"red"}]
function fnf:no_feedback