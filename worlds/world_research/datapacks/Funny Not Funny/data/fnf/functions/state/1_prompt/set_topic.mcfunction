scoreboard players operation $FNF_RANDOM_MAX fnf_temp = $FNF_TOPIC_COUNT fnf_const
function fnf:random/get
scoreboard players operation $FNF_ROTATIONS fnf_temp = $FNF_RANDOM fnf_temp
execute if score $FNF_ROTATIONS fnf_temp matches 1.. run function fnf:game/rotate_topics

tellraw @a[tag=fnf_playing] ["",{"text":"This round's topic: "},{"storage":"fnf:game_store","nbt":"Topics[0]","color":"green"}]
title @a[tag=fnf_playing] subtitle ["",{"text":"is this round's topic!"}]
title @a[tag=fnf_playing] title ["",{"storage":"fnf:game_store","nbt":"Topics[0]","color":"green"}]