execute as @e[type=marker,tag=fnf_state_1,tag=fnf_lectern] at @s run data remove block ~ ~ ~ Book
execute as @e[type=marker,tag=fnf_state_1,tag=fnf_lectern] at @s run setblock ~ ~ ~ minecraft:lectern[facing=west,has_book=false]

tp @a[tag=fnf_playing,scores={fnf_pid=1},limit=1] @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_player_spawn,tag=fnf_p1,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=2},limit=1] @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_player_spawn,tag=fnf_p2,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=3},limit=1] @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_player_spawn,tag=fnf_p3,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=4},limit=1] @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_player_spawn,tag=fnf_p4,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=5},limit=1] @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_player_spawn,tag=fnf_p5,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=6},limit=1] @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_player_spawn,tag=fnf_p6,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=7},limit=1] @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_player_spawn,tag=fnf_p7,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=8},limit=1] @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_player_spawn,tag=fnf_p8,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=9},limit=1] @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_player_spawn,tag=fnf_p9,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=10},limit=1] @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_player_spawn,tag=fnf_p10,limit=1]

tag @e[type=minecraft:marker] remove fnf_waiting
execute as @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_lectern] if score @s fnf_pid <= $FNF_PLAYERS fnf_game run tag @s add fnf_waiting

item replace entity @a[tag=fnf_playing] hotbar.0 with minecraft:writable_book{display:{Lore:['"Write your prompt in this book."','"Sign it with whatever title and"','"place it on the lectern to submit!"']}}

# Timer
scoreboard players operation $FNF_TIMER fnf_timer = $FNF_PROMPT_TIME fnf_const
execute if score $FNF_DISABLE_PROMPTS fnf_option matches 1 run scoreboard players set $FNF_TIMER fnf_timer 1

# Rotate topics randomly
execute if score $FNF_DISABLE_PROMPTS fnf_option matches 0 run function fnf:state/1_prompt/set_topic

scoreboard players set @a fnf_pstate 1