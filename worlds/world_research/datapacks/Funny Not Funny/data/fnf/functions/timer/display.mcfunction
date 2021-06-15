scoreboard players operation $FNF_SEC fnf_timer = $FNF_TIMER fnf_timer
scoreboard players operation $FNF_SEC fnf_timer /= $FNF_20 fnf_const

execute if score $FNF_SEC fnf_timer matches 10 if score $FNF_STATE fnf_game matches 1..2 run tellraw @a[tag=fnf_playing] ["",{"text":"There are 10 seconds left!","color":"yellow"}]

execute if score $FNF_SEC fnf_timer matches 11.. if score $FNF_STATE fnf_game matches 1..3 run title @a[tag=fnf_playing] actionbar ["",{"text":"Time remaining: ","color":"white"},{"score":{"name":"$FNF_SEC","objective":"fnf_timer"},"color":"dark_green","bold":true}]
execute if score $FNF_SEC fnf_timer matches 4..10 if score $FNF_STATE fnf_game matches 1..3 run title @a[tag=fnf_playing] actionbar ["",{"text":"Time remaining: ","color":"white"},{"score":{"name":"$FNF_SEC","objective":"fnf_timer"},"color":"gold","bold":true}]
execute if score $FNF_SEC fnf_timer matches 0..3 if score $FNF_STATE fnf_game matches 1..3 run title @a[tag=fnf_playing] actionbar ["",{"text":"Time remaining: ","color":"white"},{"score":{"name":"$FNF_SEC","objective":"fnf_timer"},"color":"dark_red","bold":true}]