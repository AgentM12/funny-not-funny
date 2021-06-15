kill @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_first]
summon minecraft:armor_stand ~ ~ ~ {CustomName:'""',CustomNameVisible:1b,Tags:["fnf_answer_display","fnf_state_3","fnf_first","fnf_display"],Marker:1b,Invisible:1b}
execute if score $FNF_SELECTED fnf_pid matches 0 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_first,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[0].Answer1
execute if score $FNF_SELECTED fnf_pid matches 0 store result score $FNF_AUTHOR1 fnf_pid run data get storage fnf:game_store PromptsCopy[0].A1_ID
execute if score $FNF_SELECTED fnf_pid matches 1 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_first,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[1].Answer1
execute if score $FNF_SELECTED fnf_pid matches 1 store result score $FNF_AUTHOR1 fnf_pid run data get storage fnf:game_store PromptsCopy[1].A1_ID
execute if score $FNF_SELECTED fnf_pid matches 2 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_first,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[2].Answer1
execute if score $FNF_SELECTED fnf_pid matches 2 store result score $FNF_AUTHOR1 fnf_pid run data get storage fnf:game_store PromptsCopy[2].A1_ID
execute if score $FNF_SELECTED fnf_pid matches 3 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_first,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[3].Answer1
execute if score $FNF_SELECTED fnf_pid matches 3 store result score $FNF_AUTHOR1 fnf_pid run data get storage fnf:game_store PromptsCopy[3].A1_ID
execute if score $FNF_SELECTED fnf_pid matches 4 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_first,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[4].Answer1
execute if score $FNF_SELECTED fnf_pid matches 4 store result score $FNF_AUTHOR1 fnf_pid run data get storage fnf:game_store PromptsCopy[4].A1_ID
execute if score $FNF_SELECTED fnf_pid matches 5 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_first,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[5].Answer1
execute if score $FNF_SELECTED fnf_pid matches 5 store result score $FNF_AUTHOR1 fnf_pid run data get storage fnf:game_store PromptsCopy[5].A1_ID
execute if score $FNF_SELECTED fnf_pid matches 6 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_first,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[6].Answer1
execute if score $FNF_SELECTED fnf_pid matches 6 store result score $FNF_AUTHOR1 fnf_pid run data get storage fnf:game_store PromptsCopy[6].A1_ID
execute if score $FNF_SELECTED fnf_pid matches 7 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_first,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[7].Answer1
execute if score $FNF_SELECTED fnf_pid matches 7 store result score $FNF_AUTHOR1 fnf_pid run data get storage fnf:game_store PromptsCopy[7].A1_ID
execute if score $FNF_SELECTED fnf_pid matches 8 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_first,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[8].Answer1
execute if score $FNF_SELECTED fnf_pid matches 8 store result score $FNF_AUTHOR1 fnf_pid run data get storage fnf:game_store PromptsCopy[8].A1_ID
execute if score $FNF_SELECTED fnf_pid matches 9 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_first,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[9].Answer1
execute if score $FNF_SELECTED fnf_pid matches 9 store result score $FNF_AUTHOR1 fnf_pid run data get storage fnf:game_store PromptsCopy[9].A1_ID
execute if score $FNF_SELECTED fnf_pid matches 10 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_first,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[10].Answer1
execute if score $FNF_SELECTED fnf_pid matches 10 store result score $FNF_AUTHOR1 fnf_pid run data get storage fnf:game_store PromptsCopy[10].A1_ID