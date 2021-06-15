execute unless data storage fnf:temp Games run data modify storage fnf:temp Games set from storage fnf:data_archive Games

execute store result score $FNF_GAME_COUNT fnf_temp run data get storage fnf:data_archive Size

# Rotate games randomly
scoreboard players operation $FNF_RANDOM_MAX fnf_temp = $FNF_GAME_COUNT fnf_temp
function fnf:random/get
scoreboard players operation $FNF_ROTATIONS fnf_temp = $FNF_RANDOM fnf_temp

execute if score $FNF_ROTATIONS fnf_temp matches 1.. run function fnf:game/rotate_games

data modify storage fnf:temp Prompts set from storage fnf:temp Games[0].Prompts

execute store result score $FNF_PROMPT_COUNT fnf_temp run data get storage fnf:temp Games[0].Size

# Rotate prompts randomly
scoreboard players operation $FNF_RANDOM_MAX fnf_temp = $FNF_PROMPT_COUNT fnf_temp
function fnf:random/get
scoreboard players operation $FNF_ROTATIONS fnf_temp = $FNF_RANDOM fnf_temp

execute if score $FNF_ROTATIONS fnf_temp matches 1.. run function fnf:game/rotate_prompts

data modify storage fnf:temp SelectedPrompt set from storage fnf:temp Prompts[0].Prompt

