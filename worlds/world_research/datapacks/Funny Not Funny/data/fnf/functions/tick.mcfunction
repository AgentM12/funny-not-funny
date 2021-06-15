
# PRE
execute as @a[scores={fnf_relog=1..},gamemode=!creative] at @s run function fnf:game/players/handle_relog

# Update
execute if entity @a[tag=fnf_show_markers] as @e[type=marker] at @s run function fnf:debug/show_markers

function fnf:game/global_tick

function fnf:state/tick

# POST