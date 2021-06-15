execute if entity @s[tag=fnf_has_voted] run tellraw @s ["",{"text":"You can only vote once!","color":"red"}]
execute if entity @s[tag=!fnf_can_vote,tag=!fnf_has_voted] run tellraw @s ["",{"text":"You can't vote because you answered this prompt.","color":"red"}]
execute if entity @s[tag=fnf_can_vote] run function fnf:state/3_vote/apply_vote2