data modify storage fnf:game_store Prompts append value {}
data modify storage fnf:game_store Prompts[-1].Prompt set from block ~ ~ ~ Book.tag.pages[0]
data modify storage fnf:game_store Prompts[-1].P_ID set from block ~ ~ ~ Book.tag.AuthorId

execute store result score $FNF_ID fnf_temp run data get block ~ ~ ~ Book.tag.AuthorId
execute if score $FNF_ID fnf_temp matches 0 run function fnf:game/fix_prompt