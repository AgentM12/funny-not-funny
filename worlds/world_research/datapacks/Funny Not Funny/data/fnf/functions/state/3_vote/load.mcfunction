# Teleport players into vote room randomly
tp @a[tag=fnf_playing] @e[type=minecraft:marker,tag=fnf_state_3,tag=fnf_player_spawn,limit=1]
execute as @e[type=minecraft:marker,tag=fnf_state_3,tag=fnf_player_spawn] at @s run spreadplayers ~ ~ 1 5 false @a[tag=fnf_playing]

# Show scores
scoreboard players reset * fnf_int_score

scoreboard players operation $FNF_PROMPT_COUNT fnf_temp = $FNF_PLAYERS fnf_game
tag @a remove fnf_can_vote

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