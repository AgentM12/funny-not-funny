effect give @s[gamemode=spectator] minecraft:invisibility 1000000 0 true
gamemode adventure @s[gamemode=!creative]
tp @s[gamemode=!creative] @e[type=minecraft:marker,tag=fnf_state_3,tag=fnf_player_spawn,limit=1]
execute at @e[type=minecraft:marker,tag=fnf_state_3,tag=fnf_player_spawn] run spreadplayers ~ ~ 1 5 false @s
tag @s remove fnf_can_vote
scoreboard players set @s fnf_pstate 3