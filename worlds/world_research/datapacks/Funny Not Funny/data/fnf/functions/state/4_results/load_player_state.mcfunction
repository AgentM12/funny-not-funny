tp @s[tag=fnf_playing] @e[type=minecraft:marker,tag=fnf_state_4,tag=fnf_player_spawn,limit=1]
execute at @e[type=minecraft:marker,tag=fnf_state_4,tag=fnf_player_spawn] run spreadplayers ~ ~ 1 5 false @s[tag=fnf_playing]

scoreboard players set @s[tag=fnf_playing] fnf_disp_score 0

scoreboard players operation @s[tag=fnf_playing,scores={fnf_pid=1}] fnf_disp_score = $P1 fnf_int_score
scoreboard players operation @s[tag=fnf_playing,scores={fnf_pid=2}] fnf_disp_score = $P2 fnf_int_score
scoreboard players operation @s[tag=fnf_playing,scores={fnf_pid=3}] fnf_disp_score = $P3 fnf_int_score
scoreboard players operation @s[tag=fnf_playing,scores={fnf_pid=4}] fnf_disp_score = $P4 fnf_int_score
scoreboard players operation @s[tag=fnf_playing,scores={fnf_pid=5}] fnf_disp_score = $P5 fnf_int_score
scoreboard players operation @s[tag=fnf_playing,scores={fnf_pid=6}] fnf_disp_score = $P6 fnf_int_score
scoreboard players operation @s[tag=fnf_playing,scores={fnf_pid=7}] fnf_disp_score = $P7 fnf_int_score
scoreboard players operation @s[tag=fnf_playing,scores={fnf_pid=8}] fnf_disp_score = $P8 fnf_int_score
scoreboard players operation @s[tag=fnf_playing,scores={fnf_pid=9}] fnf_disp_score = $P9 fnf_int_score
scoreboard players operation @s[tag=fnf_playing,scores={fnf_pid=10}] fnf_disp_score = $P10 fnf_int_score

scoreboard players operation @s[tag=fnf_playing] fnf_votes_recv += @s fnf_disp_score

scoreboard players set @s fnf_pstate 4