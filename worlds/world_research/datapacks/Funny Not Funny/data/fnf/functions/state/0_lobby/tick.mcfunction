
# By default, you're playing.
team join fnf_players @a[team=!fnf_spectators]

effect give @a[team=fnf_players] minecraft:glowing 1 0 true

clear @a[tag=fnf_playing,gamemode=!creative] minecraft:writable_book
clear @a[tag=fnf_playing,gamemode=!creative] minecraft:written_book
clear @a[tag=fnf_playing,gamemode=!creative] minecraft:paper

kill @e[type=item,tag=!fnf_imp]
item replace entity @a[team=fnf_players] hotbar.0 with minecraft:warped_fungus_on_a_stick{display:{Name:'[{"text":"Right Click to Toggle ","italic":false},{"text":"Participation","color":"green"}]',Lore:['{"text":"You are queued up to play!","color":"dark_green","italic":false}']}}
item replace entity @a[team=!fnf_players] hotbar.0 with minecraft:warped_fungus_on_a_stick{display:{Name:'[{"text":"Right Click to Toggle ","italic":false},{"text":"Participation","color":"red"}]',Lore:['{"text":"You will be spectating!","color":"gray","italic":false}']}}

execute as @a[scores={fnf_use_wfstick=1..}] run function fnf:trigger/wfstick

# Update participating player count.
execute store result score $FNF_PLAYERS fnf_game if entity @a[team=fnf_players]

scoreboard players operation Participating fnf_disp_count = $FNF_PLAYERS fnf_game
execute store result score Spectating fnf_disp_count if entity @a[team=fnf_spectators]

# Timer
execute if score $FNF_START_GAME fnf_timer matches 100 run title @a actionbar ["",{"text":"Game starting in 5","color":"dark_blue"}]
execute if score $FNF_START_GAME fnf_timer matches 80 run title @a actionbar ["",{"text":"Game starting in 4","color":"dark_blue"}]
execute if score $FNF_START_GAME fnf_timer matches 60 run title @a actionbar ["",{"text":"Game starting in 3","color":"dark_blue"}]
execute if score $FNF_START_GAME fnf_timer matches 40 run title @a actionbar ["",{"text":"Game starting in 2","color":"dark_blue"}]
execute if score $FNF_START_GAME fnf_timer matches 20 run title @a actionbar ["",{"text":"Game starting in 1","color":"dark_blue"}]

# Remove lever just before game starts due to redstone delay.
execute if score $FNF_START_GAME fnf_timer matches 10 run function fnf:trigger/remove_lever
execute if score $FNF_START_GAME fnf_timer matches 0 run function fnf:state/0_lobby/try_start

execute if score $FNF_START_GAME fnf_timer matches 1.. run scoreboard players remove $FNF_START_GAME fnf_timer 1