kill @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_second]
summon minecraft:armor_stand ~ ~ ~ {CustomName:'"None"',CustomNameVisible:1b,Tags:["fnf_answer_display","fnf_state_3","fnf_second","fnf_display"],Marker:1b,Invisible:1b}
execute if score $FNF_SELECTED fnf_pid matches 0 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_second,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[0].Answer2
execute if score $FNF_SELECTED fnf_pid matches 0 store result score $FNF_AUTHOR2 fnf_pid run data get storage fnf:game_store PromptsCopy[0].A2_ID
execute if score $FNF_SELECTED fnf_pid matches 1 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_second,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[1].Answer2
execute if score $FNF_SELECTED fnf_pid matches 1 store result score $FNF_AUTHOR2 fnf_pid run data get storage fnf:game_store PromptsCopy[1].A2_ID
execute if score $FNF_SELECTED fnf_pid matches 2 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_second,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[2].Answer2
execute if score $FNF_SELECTED fnf_pid matches 2 store result score $FNF_AUTHOR2 fnf_pid run data get storage fnf:game_store PromptsCopy[2].A2_ID
execute if score $FNF_SELECTED fnf_pid matches 3 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_second,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[3].Answer2
execute if score $FNF_SELECTED fnf_pid matches 3 store result score $FNF_AUTHOR2 fnf_pid run data get storage fnf:game_store PromptsCopy[3].A2_ID
execute if score $FNF_SELECTED fnf_pid matches 4 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_second,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[4].Answer2
execute if score $FNF_SELECTED fnf_pid matches 4 store result score $FNF_AUTHOR2 fnf_pid run data get storage fnf:game_store PromptsCopy[4].A2_ID
execute if score $FNF_SELECTED fnf_pid matches 5 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_second,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[5].Answer2
execute if score $FNF_SELECTED fnf_pid matches 5 store result score $FNF_AUTHOR2 fnf_pid run data get storage fnf:game_store PromptsCopy[5].A2_ID
execute if score $FNF_SELECTED fnf_pid matches 6 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_second,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[6].Answer2
execute if score $FNF_SELECTED fnf_pid matches 6 store result score $FNF_AUTHOR2 fnf_pid run data get storage fnf:game_store PromptsCopy[6].A2_ID
execute if score $FNF_SELECTED fnf_pid matches 7 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_second,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[7].Answer2
execute if score $FNF_SELECTED fnf_pid matches 7 store result score $FNF_AUTHOR2 fnf_pid run data get storage fnf:game_store PromptsCopy[7].A2_ID
execute if score $FNF_SELECTED fnf_pid matches 8 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_second,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[8].Answer2
execute if score $FNF_SELECTED fnf_pid matches 8 store result score $FNF_AUTHOR2 fnf_pid run data get storage fnf:game_store PromptsCopy[8].A2_ID
execute if score $FNF_SELECTED fnf_pid matches 9 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_second,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[9].Answer2
execute if score $FNF_SELECTED fnf_pid matches 9 store result score $FNF_AUTHOR2 fnf_pid run data get storage fnf:game_store PromptsCopy[9].A2_ID
execute if score $FNF_SELECTED fnf_pid matches 10 run data modify entity @e[type=armor_stand,tag=fnf_answer_display,tag=fnf_state_3,tag=fnf_second,sort=nearest,limit=1] CustomName set from storage fnf:game_store PromptsCopy[10].Answer2
execute if score $FNF_SELECTED fnf_pid matches 10 store result score $FNF_AUTHOR2 fnf_pid run data get storage fnf:game_store PromptsCopy[10].A2_ID