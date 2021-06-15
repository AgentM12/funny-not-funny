tag @a remove fnf_has_highscore

# Save all game data to archive storage
data modify storage fnf:data_archive Games append value {}
data modify storage fnf:data_archive Games[-1].Prompts set from storage fnf:game_store Prompts
execute store result storage fnf:data_archive Games[-1].Size int 1 run scoreboard players get $FNF_PLAYERS fnf_game

execute store result score $FNF_LEN fnf_temp run data get storage fnf:data_archive Size
scoreboard players add $FNF_LEN fnf_temp 1
execute store result storage fnf:data_archive Size int 1 run scoreboard players get $FNF_LEN fnf_temp