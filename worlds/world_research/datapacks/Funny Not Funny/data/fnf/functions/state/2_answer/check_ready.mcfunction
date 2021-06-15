execute if entity @s[tag=fnf_first] if data block ~ ~ ~ Items[0].tag.RepairCost run function fnf:state/2_answer/is_ready1
execute if entity @s[tag=fnf_second] if data block ~ ~ ~ Items[0].tag.RepairCost run function fnf:state/2_answer/is_ready2
execute unless data block ~ ~ ~ Items[0].tag.RepairCost run function fnf:state/2_answer/is_not_ready