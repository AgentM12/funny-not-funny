tag @s add fnf_self
execute as @a[tag=fnf_playing] if score @s fnf_pid = @e[type=minecraft:marker,tag=fnf_self,limit=1] fnf_pid run tag @s add fnf_targeted
execute store result block ~ ~ ~ Book.tag.AuthorId int 1 run scoreboard players get @a[tag=fnf_targeted,limit=1] fnf_pid
tellraw @a ["",{"selector":"@a[tag=fnf_targeted,limit=1]"},{"text":" finished writing their prompt!"}]
tag @a remove fnf_targeted
tag @s remove fnf_self

tag @s remove fnf_waiting

