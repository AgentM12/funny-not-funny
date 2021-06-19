tag @s add fnf_self
execute as @a[tag=fnf_playing] if score @s fnf_pid = @e[type=minecraft:marker,tag=fnf_self,limit=1] fnf_pid run tag @s add fnf_targeted

# Teleport players
tp @a[tag=fnf_targeted,scores={fnf_pid=1},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p1,tag=fnf_second,limit=1]
tp @a[tag=fnf_targeted,scores={fnf_pid=2},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p2,tag=fnf_second,limit=1]
tp @a[tag=fnf_targeted,scores={fnf_pid=3},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p3,tag=fnf_second,limit=1]
tp @a[tag=fnf_targeted,scores={fnf_pid=4},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p4,tag=fnf_second,limit=1]
tp @a[tag=fnf_targeted,scores={fnf_pid=5},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p5,tag=fnf_second,limit=1]
tp @a[tag=fnf_targeted,scores={fnf_pid=6},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p6,tag=fnf_second,limit=1]
tp @a[tag=fnf_targeted,scores={fnf_pid=7},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p7,tag=fnf_second,limit=1]
tp @a[tag=fnf_targeted,scores={fnf_pid=8},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p8,tag=fnf_second,limit=1]
tp @a[tag=fnf_targeted,scores={fnf_pid=9},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p9,tag=fnf_second,limit=1]
tp @a[tag=fnf_targeted,scores={fnf_pid=10},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p10,tag=fnf_second,limit=1]

item replace entity @a[tag=fnf_targeted] hotbar.0 with minecraft:paper{display:{Name:'{"text":""}',Lore:['"Rename this paper to your answer."','"Then throw it into the hopper!"']}}
playsound minecraft:entity.player.levelup master @a[tag=fnf_targeted,limit=1] ~ ~ ~ 1 2 0
tag @a remove fnf_targeted
tag @s remove fnf_self

setblock ~ ~1 ~ minecraft:stone

tag @s remove fnf_waiting
