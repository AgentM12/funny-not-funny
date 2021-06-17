# Timer
scoreboard players operation $FNF_TIMER fnf_timer = $FNF_RESULT_TIME fnf_const

# Set all player scores
scoreboard players reset * fnf_disp_score

scoreboard objectives setdisplay sidebar fnf_disp_score

# Teleport players into result room randomly
execute as @a at @s run function fnf:state/4_results/load_player_state



function fnf:game/get_highest_score
tellraw @a [{"text":"Congratulations! ","color":"yellow"},{"selector":"@a[tag=fnf_has_highscore]","color":"green","separator":{"text":" and ","color":"yellow"}},{"text":" had the funniest answers!"}]