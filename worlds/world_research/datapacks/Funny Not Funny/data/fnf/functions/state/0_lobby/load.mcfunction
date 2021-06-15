execute as @a[gamemode=!creative] at @s run function fnf:game/players/return_to_lobby

tag @a remove fnf_can_vote
scoreboard players set $FNF_START_GAME fnf_timer -1
kill @e[type=armor_stand,tag=fnf_display]

# Can see nametags while in lobby...
team modify fnf_players seeFriendlyInvisibles true
team modify fnf_players nametagVisibility always

scoreboard objectives setdisplay sidebar fnf_disp_count

function fnf:trigger/reset_lever