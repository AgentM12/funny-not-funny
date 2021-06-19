tag @s remove fnf_can_vote
tag @s add fnf_has_voted

execute if score $FNF_HIDDEN_VOTES fnf_option matches 0 run tellraw @a ["",{"selector":"@s"},{"text":" abstained from voting!"}]
execute if score $FNF_HIDDEN_VOTES fnf_option matches 1 run tellraw @s ["",{"text":"You abstained from voting!"}]
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 2 0