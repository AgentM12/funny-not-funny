function fnf:game/get_random_prompt_from_archive
data modify storage fnf:game_store Prompts[-1].Prompt set from storage fnf:temp SelectedPrompt

execute if entity @s[tag=fnf_p1] run data modify storage fnf:game_store Prompts[-1].P_ID set value 1
execute if entity @s[tag=fnf_p2] run data modify storage fnf:game_store Prompts[-1].P_ID set value 2
execute if entity @s[tag=fnf_p3] run data modify storage fnf:game_store Prompts[-1].P_ID set value 3
execute if entity @s[tag=fnf_p4] run data modify storage fnf:game_store Prompts[-1].P_ID set value 4
execute if entity @s[tag=fnf_p5] run data modify storage fnf:game_store Prompts[-1].P_ID set value 5
execute if entity @s[tag=fnf_p6] run data modify storage fnf:game_store Prompts[-1].P_ID set value 6
execute if entity @s[tag=fnf_p7] run data modify storage fnf:game_store Prompts[-1].P_ID set value 7
execute if entity @s[tag=fnf_p8] run data modify storage fnf:game_store Prompts[-1].P_ID set value 8
execute if entity @s[tag=fnf_p9] run data modify storage fnf:game_store Prompts[-1].P_ID set value 9
execute if entity @s[tag=fnf_p10] run data modify storage fnf:game_store Prompts[-1].P_ID set value 10