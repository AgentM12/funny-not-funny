tag @s add fnf_self
execute as @a[tag=fnf_playing] if score @s fnf_pid = @e[type=minecraft:marker,tag=fnf_self,limit=1] fnf_pid run tag @s add fnf_targeted
tellraw @a ["",{"selector":"@a[tag=fnf_targeted,limit=1]"},{"text":" finished answering their last prompt!"}]
playsound minecraft:entity.player.levelup master @a[tag=fnf_targeted,limit=1] ~ ~ ~ 1 2 0
tag @a remove fnf_targeted
tag @s remove fnf_self

setblock ~ ~1 ~ minecraft:stone
tag @s remove fnf_waiting
