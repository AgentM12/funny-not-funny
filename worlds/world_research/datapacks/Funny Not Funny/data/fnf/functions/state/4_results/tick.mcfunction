clear @a[tag=fnf_playing,gamemode=!creative] minecraft:writable_book
clear @a[tag=fnf_playing,gamemode=!creative] minecraft:written_book
clear @a[tag=fnf_playing,gamemode=!creative] minecraft:paper

kill @e[type=item,tag=!fnf_imp]

scoreboard players set $FNF_RANDOM_MAX fnf_temp 10
function fnf:random/get

execute if score $FNF_RANDOM fnf_temp matches 0 at @e[type=minecraft:marker,tag=fnf_state_4,tag=fnf_player_spawn,limit=1] run spreadplayers ~ ~ 1 8 false @e[type=minecraft:marker,tag=fnf_state_4,tag=fnf_spawn_firework,sort=random,limit=1]
execute if score $FNF_RANDOM fnf_temp matches 0 at @e[type=minecraft:marker,tag=fnf_state_4,tag=fnf_spawn_firework,sort=random,limit=1] run function fnf:state/4_results/fireworks

function fnf:timer/tick