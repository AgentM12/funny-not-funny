clear @a[tag=fnf_playing,gamemode=!creative] minecraft:paper

# Persist items
execute as @e[type=item,tag=!imp] run data modify entity @s Owner set from entity @s Thrower
execute as @e[type=item,tag=!imp] run data modify entity @s Age set value -32768s

execute as @a[tag=fnf_playing] if data entity @s Inventory[{id:"minecraft:written_book"}] unless data entity @s Inventory[{id:"minecraft:written_book",tag:{FNF_MODIFIED:1}}] run item modify entity @s weapon.mainhand fnf:can_place_on_lectern
execute as @a[tag=fnf_playing] if data entity @s Inventory[{id:"minecraft:written_book"}] unless data entity @s Inventory[{id:"minecraft:written_book",tag:{FNF_MODIFIED:1}}] run item modify entity @s weapon.offhand fnf:can_place_on_lectern

execute as @e[type=minecraft:marker,tag=fnf_waiting,tag=fnf_state_1] at @s if block ~ ~ ~ minecraft:lectern[has_book=true] run function fnf:state/1_prompt/filled_book
execute unless entity @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_waiting] run function fnf:state/next_state

function fnf:timer/tick