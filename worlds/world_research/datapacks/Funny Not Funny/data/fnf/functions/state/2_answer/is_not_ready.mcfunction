tag @s add fnf_self
execute as @a[tag=fnf_playing] if score @s fnf_pid = @e[type=minecraft:marker,tag=fnf_self,limit=1] fnf_pid run tag @s add fnf_targeted
tellraw @a[tag=fnf_targeted] ["",{"text":"The answer you submitted was empty."}]
item replace entity @a[tag=fnf_targeted] hotbar.0 with minecraft:paper{display:{Name:'{"text":""}',Lore:['"Rename this paper to your answer."','"Then throw it into the hopper!"']}}
tag @a remove fnf_targeted
tag @s remove fnf_self

data remove block ~ ~ ~ Items