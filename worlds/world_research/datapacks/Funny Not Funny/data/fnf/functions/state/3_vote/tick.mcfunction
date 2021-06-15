
clear @a[tag=fnf_playing,gamemode=!creative] minecraft:writable_book
clear @a[tag=fnf_playing,gamemode=!creative] minecraft:written_book
clear @a[tag=fnf_playing,gamemode=!creative] minecraft:paper

kill @e[type=item,tag=!fnf_imp]

execute unless entity @a[tag=fnf_playing,tag=fnf_can_vote] run function fnf:state/3_vote/next_state

function fnf:timer/tick