scoreboard players add $FNF_DISABLE_PROMPTS fnf_option 1
execute unless score $FNF_DISABLE_PROMPTS fnf_option matches 0..1 run scoreboard players set $FNF_DISABLE_PROMPTS fnf_option 0

execute if score $FNF_DISABLE_PROMPTS fnf_option matches 0 run tellraw @s [{"text":"The prompts phase is now: ","color":"yellow"},{"text":"Enabled","color":"green"}]
execute if score $FNF_DISABLE_PROMPTS fnf_option matches 1 run tellraw @s [{"text":"The prompts phase is now: ","color":"yellow"},{"text":"Disabled","color":"red"}]
function fnf:no_feedback