
scoreboard players set $FNF_RANDOM_MAX fnf_temp 3
function fnf:random/get

execute if score $FNF_RANDOM fnf_temp matches 0 positioned ~ ~ ~ run function fnf:fireworks/random
execute if score $FNF_RANDOM fnf_temp matches 1 positioned ~ ~2 ~ run function fnf:fireworks/random
execute if score $FNF_RANDOM fnf_temp matches 2 positioned ~ ~4 ~ run function fnf:fireworks/random