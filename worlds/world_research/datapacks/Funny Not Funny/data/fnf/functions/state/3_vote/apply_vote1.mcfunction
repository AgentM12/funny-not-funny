# add score to author of this answer
execute if score $FNF_AUTHOR1 fnf_pid matches 1 run scoreboard players add $P1 fnf_int_score 1
execute if score $FNF_AUTHOR1 fnf_pid matches 2 run scoreboard players add $P2 fnf_int_score 1
execute if score $FNF_AUTHOR1 fnf_pid matches 3 run scoreboard players add $P3 fnf_int_score 1
execute if score $FNF_AUTHOR1 fnf_pid matches 4 run scoreboard players add $P4 fnf_int_score 1
execute if score $FNF_AUTHOR1 fnf_pid matches 5 run scoreboard players add $P5 fnf_int_score 1
execute if score $FNF_AUTHOR1 fnf_pid matches 6 run scoreboard players add $P6 fnf_int_score 1
execute if score $FNF_AUTHOR1 fnf_pid matches 7 run scoreboard players add $P7 fnf_int_score 1
execute if score $FNF_AUTHOR1 fnf_pid matches 8 run scoreboard players add $P8 fnf_int_score 1
execute if score $FNF_AUTHOR1 fnf_pid matches 9 run scoreboard players add $P9 fnf_int_score 1
execute if score $FNF_AUTHOR1 fnf_pid matches 10 run scoreboard players add $P10 fnf_int_score 1

execute if score $FNF_PID fnf_pid matches 1 store result score $FNF_VOTES fnf_temp run data get storage fnf:game_store Prompts[{P_ID:1}].A1_VOTES
execute if score $FNF_PID fnf_pid matches 2 store result score $FNF_VOTES fnf_temp run data get storage fnf:game_store Prompts[{P_ID:2}].A1_VOTES
execute if score $FNF_PID fnf_pid matches 3 store result score $FNF_VOTES fnf_temp run data get storage fnf:game_store Prompts[{P_ID:3}].A1_VOTES
execute if score $FNF_PID fnf_pid matches 4 store result score $FNF_VOTES fnf_temp run data get storage fnf:game_store Prompts[{P_ID:4}].A1_VOTES
execute if score $FNF_PID fnf_pid matches 5 store result score $FNF_VOTES fnf_temp run data get storage fnf:game_store Prompts[{P_ID:5}].A1_VOTES
execute if score $FNF_PID fnf_pid matches 6 store result score $FNF_VOTES fnf_temp run data get storage fnf:game_store Prompts[{P_ID:6}].A1_VOTES
execute if score $FNF_PID fnf_pid matches 7 store result score $FNF_VOTES fnf_temp run data get storage fnf:game_store Prompts[{P_ID:7}].A1_VOTES
execute if score $FNF_PID fnf_pid matches 8 store result score $FNF_VOTES fnf_temp run data get storage fnf:game_store Prompts[{P_ID:8}].A1_VOTES
execute if score $FNF_PID fnf_pid matches 9 store result score $FNF_VOTES fnf_temp run data get storage fnf:game_store Prompts[{P_ID:9}].A1_VOTES
execute if score $FNF_PID fnf_pid matches 10 store result score $FNF_VOTES fnf_temp run data get storage fnf:game_store Prompts[{P_ID:10}].A1_VOTES

scoreboard players add $FNF_VOTES fnf_temp 1

execute if score $FNF_PID fnf_pid matches 1 store result storage fnf:game_store Prompts[{P_ID:1}].A1_VOTES int 1 run scoreboard players get $FNF_VOTES fnf_temp
execute if score $FNF_PID fnf_pid matches 2 store result storage fnf:game_store Prompts[{P_ID:2}].A1_VOTES int 1 run scoreboard players get $FNF_VOTES fnf_temp
execute if score $FNF_PID fnf_pid matches 3 store result storage fnf:game_store Prompts[{P_ID:3}].A1_VOTES int 1 run scoreboard players get $FNF_VOTES fnf_temp
execute if score $FNF_PID fnf_pid matches 4 store result storage fnf:game_store Prompts[{P_ID:4}].A1_VOTES int 1 run scoreboard players get $FNF_VOTES fnf_temp
execute if score $FNF_PID fnf_pid matches 5 store result storage fnf:game_store Prompts[{P_ID:5}].A1_VOTES int 1 run scoreboard players get $FNF_VOTES fnf_temp
execute if score $FNF_PID fnf_pid matches 6 store result storage fnf:game_store Prompts[{P_ID:6}].A1_VOTES int 1 run scoreboard players get $FNF_VOTES fnf_temp
execute if score $FNF_PID fnf_pid matches 7 store result storage fnf:game_store Prompts[{P_ID:7}].A1_VOTES int 1 run scoreboard players get $FNF_VOTES fnf_temp
execute if score $FNF_PID fnf_pid matches 8 store result storage fnf:game_store Prompts[{P_ID:8}].A1_VOTES int 1 run scoreboard players get $FNF_VOTES fnf_temp
execute if score $FNF_PID fnf_pid matches 9 store result storage fnf:game_store Prompts[{P_ID:9}].A1_VOTES int 1 run scoreboard players get $FNF_VOTES fnf_temp
execute if score $FNF_PID fnf_pid matches 10 store result storage fnf:game_store Prompts[{P_ID:10}].A1_VOTES int 1 run scoreboard players get $FNF_VOTES fnf_temp

tag @s remove fnf_can_vote
tag @s add fnf_has_voted

scoreboard players add @s fnf_votes_cast 1

tellraw @a ["",{"selector":"@s"},{"text":" voted for the first answer!"}]
