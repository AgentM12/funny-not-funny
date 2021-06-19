time set midnight

# Reset head
tag @s remove fnf_has_submitted_head
tag @s remove fnf_has_highscore
data modify storage fnf:game_store PlayerHeads set value []

# Timer
scoreboard players operation $FNF_TIMER fnf_timer = $FNF_RESULT_TIME fnf_const

# Set all player scores
scoreboard players reset * fnf_disp_score
scoreboard players set $FNF_WHO_HAS_MAX fnf_temp 0

scoreboard objectives setdisplay sidebar fnf_disp_score

# Retrieve max(scores)
function fnf:game/get_highest_score

# Load playerstate
execute as @a at @s run function fnf:state/4_results/load_player_state

tellraw @a [{"text":"Congratulations! ","color":"aqua"},{"selector":"@a[tag=fnf_has_highscore]","color":"green","separator":{"text":" and ","color":"aqua"}},{"text":" had the funniest answers!"}]

# Leaderboard
execute unless score $FNF_WHO_HAS_MAX fnf_temp matches 10.. as @e[type=minecraft:marker,tag=fnf_state_4,tag=fnf_player_head] at @s run function fnf:state/4_results/set_player_heads