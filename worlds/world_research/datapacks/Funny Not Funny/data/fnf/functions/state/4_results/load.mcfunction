# Timer
scoreboard players operation $FNF_TIMER fnf_timer = $FNF_RESULT_TIME fnf_const

# Teleport players into result room randomly
tp @a[tag=fnf_playing] @e[type=minecraft:marker,tag=fnf_state_4,tag=fnf_player_spawn,limit=1]
execute as @e[type=minecraft:marker,tag=fnf_state_4,tag=fnf_player_spawn] at @s run spreadplayers ~ ~ 1 5 false @a[tag=fnf_playing]

# Set all player scores
scoreboard players reset * fnf_disp_score
scoreboard players set @a[tag=fnf_playing] fnf_disp_score 0

scoreboard players operation @a[tag=fnf_playing,scores={fnf_pid=1}] fnf_disp_score = $P1 fnf_int_score
scoreboard players operation @a[tag=fnf_playing,scores={fnf_pid=2}] fnf_disp_score = $P2 fnf_int_score
scoreboard players operation @a[tag=fnf_playing,scores={fnf_pid=3}] fnf_disp_score = $P3 fnf_int_score
scoreboard players operation @a[tag=fnf_playing,scores={fnf_pid=4}] fnf_disp_score = $P4 fnf_int_score
scoreboard players operation @a[tag=fnf_playing,scores={fnf_pid=5}] fnf_disp_score = $P5 fnf_int_score
scoreboard players operation @a[tag=fnf_playing,scores={fnf_pid=6}] fnf_disp_score = $P6 fnf_int_score
scoreboard players operation @a[tag=fnf_playing,scores={fnf_pid=7}] fnf_disp_score = $P7 fnf_int_score
scoreboard players operation @a[tag=fnf_playing,scores={fnf_pid=8}] fnf_disp_score = $P8 fnf_int_score
scoreboard players operation @a[tag=fnf_playing,scores={fnf_pid=9}] fnf_disp_score = $P9 fnf_int_score
scoreboard players operation @a[tag=fnf_playing,scores={fnf_pid=10}] fnf_disp_score = $P10 fnf_int_score

scoreboard objectives setdisplay sidebar fnf_disp_score

function fnf:game/get_highest_score

tellraw @a [{"text":"Congratulations! ","color":"yellow"},{"selector":"@a[tag=fnf_has_highscore]","color":"green","separator":{"text":" and ","color":"yellow"}},{"text":" had the funniest answers!"}]