data modify storage fnf:temp Games append from storage fnf:temp Games[0]
data remove storage fnf:temp Games[0]

scoreboard players remove $FNF_ROTATIONS fnf_temp 1
execute if score $FNF_ROTATIONS fnf_temp matches 1.. run function fnf:game/rotate_games