setblock ~ ~ ~ minecraft:oak_planks
setblock ~ ~ ~ minecraft:lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{author:"Unknown",title:"Prompt",filtered_title:"Prompt",pages:[""]}}}

execute if score $FNF_SELECTED fnf_pid matches 0 run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store PromptsCopy[0].Prompt
execute if score $FNF_SELECTED fnf_pid matches 0 store result score $FNF_PID fnf_pid run data get storage fnf:game_store PromptsCopy[0].P_ID
execute if score $FNF_SELECTED fnf_pid matches 1 run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store PromptsCopy[1].Prompt
execute if score $FNF_SELECTED fnf_pid matches 1 store result score $FNF_PID fnf_pid run data get storage fnf:game_store PromptsCopy[1].P_ID
execute if score $FNF_SELECTED fnf_pid matches 2 run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store PromptsCopy[2].Prompt
execute if score $FNF_SELECTED fnf_pid matches 2 store result score $FNF_PID fnf_pid run data get storage fnf:game_store PromptsCopy[2].P_ID
execute if score $FNF_SELECTED fnf_pid matches 3 run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store PromptsCopy[3].Prompt
execute if score $FNF_SELECTED fnf_pid matches 3 store result score $FNF_PID fnf_pid run data get storage fnf:game_store PromptsCopy[3].P_ID
execute if score $FNF_SELECTED fnf_pid matches 4 run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store PromptsCopy[4].Prompt
execute if score $FNF_SELECTED fnf_pid matches 4 store result score $FNF_PID fnf_pid run data get storage fnf:game_store PromptsCopy[4].P_ID
execute if score $FNF_SELECTED fnf_pid matches 5 run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store PromptsCopy[5].Prompt
execute if score $FNF_SELECTED fnf_pid matches 5 store result score $FNF_PID fnf_pid run data get storage fnf:game_store PromptsCopy[5].P_ID
execute if score $FNF_SELECTED fnf_pid matches 6 run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store PromptsCopy[6].Prompt
execute if score $FNF_SELECTED fnf_pid matches 6 store result score $FNF_PID fnf_pid run data get storage fnf:game_store PromptsCopy[6].P_ID
execute if score $FNF_SELECTED fnf_pid matches 7 run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store PromptsCopy[7].Prompt
execute if score $FNF_SELECTED fnf_pid matches 7 store result score $FNF_PID fnf_pid run data get storage fnf:game_store PromptsCopy[7].P_ID
execute if score $FNF_SELECTED fnf_pid matches 8 run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store PromptsCopy[8].Prompt
execute if score $FNF_SELECTED fnf_pid matches 8 store result score $FNF_PID fnf_pid run data get storage fnf:game_store PromptsCopy[8].P_ID
execute if score $FNF_SELECTED fnf_pid matches 9 run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store PromptsCopy[9].Prompt
execute if score $FNF_SELECTED fnf_pid matches 9 store result score $FNF_PID fnf_pid run data get storage fnf:game_store PromptsCopy[9].P_ID
execute if score $FNF_SELECTED fnf_pid matches 10 run data modify block ~ ~ ~ Book.tag.pages[0] set from storage fnf:game_store PromptsCopy[10].Prompt
execute if score $FNF_SELECTED fnf_pid matches 10 store result score $FNF_PID fnf_pid run data get storage fnf:game_store PromptsCopy[10].P_ID
