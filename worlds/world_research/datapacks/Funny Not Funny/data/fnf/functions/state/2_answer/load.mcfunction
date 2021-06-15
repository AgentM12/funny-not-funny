execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_archive] at @s run setblock ~ ~ ~ minecraft:oak_planks
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_archive] at @s run setblock ~ ~1 ~ minecraft:hopper
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_archive] at @s run setblock ~ ~ ~ barrel{Lock:"__THIS_BARREL_SHALL_NEVER_BE_OPENED_BY_ANY_PARTICIPATING_PLAYERS__",CustomName:'"Archive"'}

execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_lectern] at @s run setblock ~ ~ ~ minecraft:oak_planks
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_lectern] at @s run setblock ~ ~ ~ minecraft:lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{author:"Unknown",title:"Prompt",filtered_title:"Prompt",pages:[""]}}}

# Teleport players
tp @a[tag=fnf_playing,scores={fnf_pid=1},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p1,tag=fnf_first,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=2},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p2,tag=fnf_first,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=3},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p3,tag=fnf_first,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=4},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p4,tag=fnf_first,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=5},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p5,tag=fnf_first,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=6},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p6,tag=fnf_first,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=7},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p7,tag=fnf_first,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=8},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p8,tag=fnf_first,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=9},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p9,tag=fnf_first,limit=1]
tp @a[tag=fnf_playing,scores={fnf_pid=10},limit=1] @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_player_spawn,tag=fnf_p10,tag=fnf_first,limit=1]

execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_archive] if score @s fnf_pid <= $FNF_PLAYERS fnf_game run tag @s add fnf_waiting

# Copy from storage to books
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p3,tag=fnf_lectern,tag=fnf_first] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[1].Prompt
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p3,tag=fnf_lectern,tag=fnf_second] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[0].Prompt

execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p4,tag=fnf_lectern,tag=fnf_first] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[2].Prompt
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p4,tag=fnf_lectern,tag=fnf_second] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[1].Prompt

execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p5,tag=fnf_lectern,tag=fnf_first] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[3].Prompt
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p5,tag=fnf_lectern,tag=fnf_second] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[2].Prompt

execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p6,tag=fnf_lectern,tag=fnf_first] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[4].Prompt
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p6,tag=fnf_lectern,tag=fnf_second] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[3].Prompt

execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p7,tag=fnf_lectern,tag=fnf_first] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[5].Prompt
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p7,tag=fnf_lectern,tag=fnf_second] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[4].Prompt

execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p8,tag=fnf_lectern,tag=fnf_first] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[6].Prompt
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p8,tag=fnf_lectern,tag=fnf_second] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[5].Prompt

execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p9,tag=fnf_lectern,tag=fnf_first] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[7].Prompt
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p9,tag=fnf_lectern,tag=fnf_second] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[6].Prompt

execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p10,tag=fnf_lectern,tag=fnf_first] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[8].Prompt
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p10,tag=fnf_lectern,tag=fnf_second] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[7].Prompt

execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p1,tag=fnf_lectern,tag=fnf_first] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[-1].Prompt
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p1,tag=fnf_lectern,tag=fnf_second] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[-2].Prompt

execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p2,tag=fnf_lectern,tag=fnf_first] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[0].Prompt
execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_p2,tag=fnf_lectern,tag=fnf_second] at @s run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store Prompts[-1].Prompt

item replace entity @a[tag=fnf_playing] hotbar.0 with minecraft:paper{display:{Name:'{"text":""}',Lore:['"Rename this paper to your answer."','"Then throw it into the hopper!"']}}

# Timer
scoreboard players operation $FNF_TIMER fnf_timer = $FNF_ANSWER_TIME fnf_const