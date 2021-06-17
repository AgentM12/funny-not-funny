# Teleport players into vote room randomly
execute as @a at @s run function fnf:state/3_vote/load_player_state

# Show scores
scoreboard players reset * fnf_int_score

scoreboard players operation $FNF_PROMPT_COUNT fnf_temp = $FNF_PLAYERS fnf_game

data modify storage fnf:game_store PromptsCopy set from storage fnf:game_store Prompts

# Set all votes to 0
data modify storage fnf:game_store Prompts[0] merge value {A1_VOTES:0}
data modify storage fnf:game_store Prompts[1] merge value {A1_VOTES:0}
data modify storage fnf:game_store Prompts[2] merge value {A1_VOTES:0}
data modify storage fnf:game_store Prompts[3] merge value {A1_VOTES:0}
data modify storage fnf:game_store Prompts[4] merge value {A1_VOTES:0}
data modify storage fnf:game_store Prompts[5] merge value {A1_VOTES:0}
data modify storage fnf:game_store Prompts[6] merge value {A1_VOTES:0}
data modify storage fnf:game_store Prompts[7] merge value {A1_VOTES:0}
data modify storage fnf:game_store Prompts[8] merge value {A1_VOTES:0}
data modify storage fnf:game_store Prompts[9] merge value {A1_VOTES:0}

data modify storage fnf:game_store Prompts[0] merge value {A2_VOTES:0}
data modify storage fnf:game_store Prompts[1] merge value {A2_VOTES:0}
data modify storage fnf:game_store Prompts[2] merge value {A2_VOTES:0}
data modify storage fnf:game_store Prompts[3] merge value {A2_VOTES:0}
data modify storage fnf:game_store Prompts[4] merge value {A2_VOTES:0}
data modify storage fnf:game_store Prompts[5] merge value {A2_VOTES:0}
data modify storage fnf:game_store Prompts[6] merge value {A2_VOTES:0}
data modify storage fnf:game_store Prompts[7] merge value {A2_VOTES:0}
data modify storage fnf:game_store Prompts[8] merge value {A2_VOTES:0}
data modify storage fnf:game_store Prompts[9] merge value {A2_VOTES:0}

execute store result score $FNF_MAX_VOTES fnf_temp if entity @a[gamemode=adventure]
scoreboard players remove $FNF_MAX_VOTES fnf_temp 2
execute store result storage fnf:game_store MaxVotes int 1 run scoreboard players get $FNF_MAX_VOTES fnf_temp