data modify storage fnf:game_store Topics append from storage fnf:game_store Topics[0]
data remove storage fnf:game_store Topics[0]

scoreboard players remove $FNF_ROTATIONS fnf_temp 1
execute if score $FNF_ROTATIONS fnf_temp matches 1.. run function fnf:game/rotate_topics