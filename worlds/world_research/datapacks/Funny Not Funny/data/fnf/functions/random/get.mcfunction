summon minecraft:marker ~ ~ ~ {Tags:["fnf_temp","fnf_rng"]}
execute store result score $FNF_RANDOM fnf_temp run data get entity @e[type=minecraft:marker,tag=fnf_rng,limit=1] UUID[0]
kill @e[type=minecraft:marker,tag=fnf_rng]

scoreboard players operation $FNF_RANDOM fnf_temp %= $FNF_RANDOM_MAX fnf_temp