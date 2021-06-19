title @a[gamemode=adventure] subtitle ["",{"text":"Vote for your favorite!"}]
title @a[gamemode=adventure] title ["",{"text":"Voting time!"}]

execute as @e[type=minecraft:marker,tag=fnf_state_3,tag=fnf_lectern] at @s run function fnf:state/3_vote/populate_prompt
execute as @e[type=minecraft:marker,tag=fnf_state_3,tag=fnf_answer_display,tag=fnf_first] at @s run function fnf:state/3_vote/populate_answer1
execute as @e[type=minecraft:marker,tag=fnf_state_3,tag=fnf_answer_display,tag=fnf_second] at @s run function fnf:state/3_vote/populate_answer2

# If you aren't the author of either question you can vote
tag @a remove fnf_has_voted
tag @a remove fnf_can_vote
execute as @a[tag=fnf_playing] unless score @s fnf_pid = $FNF_AUTHOR1 fnf_pid unless score @s fnf_pid = $FNF_AUTHOR2 fnf_pid run tag @s add fnf_can_vote
tag @a[tag=!fnf_playing,gamemode=adventure] add fnf_can_vote

# Remove the prompts from the copy
execute if score $FNF_SELECTED fnf_pid matches 0 run data remove storage fnf:game_store PromptsCopy[0]
execute if score $FNF_SELECTED fnf_pid matches 1 run data remove storage fnf:game_store PromptsCopy[1]
execute if score $FNF_SELECTED fnf_pid matches 2 run data remove storage fnf:game_store PromptsCopy[2]
execute if score $FNF_SELECTED fnf_pid matches 3 run data remove storage fnf:game_store PromptsCopy[3]
execute if score $FNF_SELECTED fnf_pid matches 4 run data remove storage fnf:game_store PromptsCopy[4]
execute if score $FNF_SELECTED fnf_pid matches 5 run data remove storage fnf:game_store PromptsCopy[5]
execute if score $FNF_SELECTED fnf_pid matches 6 run data remove storage fnf:game_store PromptsCopy[6]
execute if score $FNF_SELECTED fnf_pid matches 7 run data remove storage fnf:game_store PromptsCopy[7]
execute if score $FNF_SELECTED fnf_pid matches 8 run data remove storage fnf:game_store PromptsCopy[8]
execute if score $FNF_SELECTED fnf_pid matches 9 run data remove storage fnf:game_store PromptsCopy[9]
execute if score $FNF_SELECTED fnf_pid matches 10 run data remove storage fnf:game_store PromptsCopy[10]