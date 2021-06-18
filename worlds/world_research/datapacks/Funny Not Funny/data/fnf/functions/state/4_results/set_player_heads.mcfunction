setblock ~ ~ ~ minecraft:air

execute if entity @s[tag=fnf_p1] if score $FNF_WHO_HAS_MAX fnf_temp matches 1..9 run setblock ~ ~ ~ minecraft:player_wall_head[facing=north]
execute if entity @s[tag=fnf_p2] if score $FNF_WHO_HAS_MAX fnf_temp matches 2..9 run setblock ~ ~ ~ minecraft:player_wall_head[facing=north]
execute if entity @s[tag=fnf_p3] if score $FNF_WHO_HAS_MAX fnf_temp matches 3..9 run setblock ~ ~ ~ minecraft:player_wall_head[facing=north]
execute if entity @s[tag=fnf_p4] if score $FNF_WHO_HAS_MAX fnf_temp matches 4..9 run setblock ~ ~ ~ minecraft:player_wall_head[facing=north]
execute if entity @s[tag=fnf_p5] if score $FNF_WHO_HAS_MAX fnf_temp matches 5..9 run setblock ~ ~ ~ minecraft:player_wall_head[facing=north]
execute if entity @s[tag=fnf_p6] if score $FNF_WHO_HAS_MAX fnf_temp matches 6..9 run setblock ~ ~ ~ minecraft:player_wall_head[facing=north]
execute if entity @s[tag=fnf_p7] if score $FNF_WHO_HAS_MAX fnf_temp matches 7..9 run setblock ~ ~ ~ minecraft:player_wall_head[facing=north]
execute if entity @s[tag=fnf_p8] if score $FNF_WHO_HAS_MAX fnf_temp matches 8..9 run setblock ~ ~ ~ minecraft:player_wall_head[facing=north]
execute if entity @s[tag=fnf_p9] if score $FNF_WHO_HAS_MAX fnf_temp matches 9 run setblock ~ ~ ~ minecraft:player_wall_head[facing=north]

execute if entity @s[tag=fnf_p1] if score $FNF_WHO_HAS_MAX fnf_temp matches 1..9 run data modify block ~ ~ ~ SkullOwner set from storage fnf:game_store PlayerHeads[0].SkullOwner
execute if entity @s[tag=fnf_p2] if score $FNF_WHO_HAS_MAX fnf_temp matches 2..9 run data modify block ~ ~ ~ SkullOwner set from storage fnf:game_store PlayerHeads[1].SkullOwner
execute if entity @s[tag=fnf_p3] if score $FNF_WHO_HAS_MAX fnf_temp matches 3..9 run data modify block ~ ~ ~ SkullOwner set from storage fnf:game_store PlayerHeads[2].SkullOwner
execute if entity @s[tag=fnf_p4] if score $FNF_WHO_HAS_MAX fnf_temp matches 4..9 run data modify block ~ ~ ~ SkullOwner set from storage fnf:game_store PlayerHeads[3].SkullOwner
execute if entity @s[tag=fnf_p5] if score $FNF_WHO_HAS_MAX fnf_temp matches 5..9 run data modify block ~ ~ ~ SkullOwner set from storage fnf:game_store PlayerHeads[4].SkullOwner
execute if entity @s[tag=fnf_p6] if score $FNF_WHO_HAS_MAX fnf_temp matches 6..9 run data modify block ~ ~ ~ SkullOwner set from storage fnf:game_store PlayerHeads[5].SkullOwner
execute if entity @s[tag=fnf_p7] if score $FNF_WHO_HAS_MAX fnf_temp matches 7..9 run data modify block ~ ~ ~ SkullOwner set from storage fnf:game_store PlayerHeads[6].SkullOwner
execute if entity @s[tag=fnf_p8] if score $FNF_WHO_HAS_MAX fnf_temp matches 8..9 run data modify block ~ ~ ~ SkullOwner set from storage fnf:game_store PlayerHeads[7].SkullOwner
execute if entity @s[tag=fnf_p9] if score $FNF_WHO_HAS_MAX fnf_temp matches 9 run data modify block ~ ~ ~ SkullOwner set from storage fnf:game_store PlayerHeads[8].SkullOwner