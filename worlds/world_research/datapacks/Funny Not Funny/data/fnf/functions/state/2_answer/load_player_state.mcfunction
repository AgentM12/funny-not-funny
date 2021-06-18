execute if score @s[tag=fnf_playing] fnf_pid matches 1 run tp @s @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p1,tag=fnf_first,limit=1]
execute if score @s[tag=fnf_playing] fnf_pid matches 2 run tp @s @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p2,tag=fnf_first,limit=1]
execute if score @s[tag=fnf_playing] fnf_pid matches 3 run tp @s @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p3,tag=fnf_first,limit=1]
execute if score @s[tag=fnf_playing] fnf_pid matches 4 run tp @s @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p4,tag=fnf_first,limit=1]
execute if score @s[tag=fnf_playing] fnf_pid matches 5 run tp @s @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p5,tag=fnf_first,limit=1]
execute if score @s[tag=fnf_playing] fnf_pid matches 6 run tp @s @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p6,tag=fnf_first,limit=1]
execute if score @s[tag=fnf_playing] fnf_pid matches 7 run tp @s @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p7,tag=fnf_first,limit=1]
execute if score @s[tag=fnf_playing] fnf_pid matches 8 run tp @s @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p8,tag=fnf_first,limit=1]
execute if score @s[tag=fnf_playing] fnf_pid matches 9 run tp @s @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p9,tag=fnf_first,limit=1]
execute if score @s[tag=fnf_playing] fnf_pid matches 10 run tp @s @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p10,tag=fnf_first,limit=1]

execute if entity @s[gamemode=spectator] run spectate @r[tag=fnf_playing]

scoreboard players set @s fnf_pstate 2
