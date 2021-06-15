
clear @a[tag=fnf_playing,gamemode=!creative] minecraft:writable_book
clear @a[tag=fnf_playing,gamemode=!creative] minecraft:written_book

# Persist items
execute as @e[type=item,tag=!imp] run data modify entity @s Owner set from entity @s Thrower
execute as @e[type=item,tag=!imp] run data modify entity @s Age set value -32768s

execute as @e[type=marker,tag=fnf_state_2,tag=fnf_anvil] at @s run setblock ~ ~ ~ minecraft:anvil
xp set @a[tag=fnf_playing] 2 levels

execute as @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_waiting,tag=fnf_archive] at @s if data block ~ ~ ~ Items[0] run function fnf:state/2_answer/check_ready
execute unless entity @e[type=minecraft:marker,tag=fnf_state_2,tag=fnf_waiting,tag=fnf_archive] run function fnf:state/next_state

function fnf:timer/tick