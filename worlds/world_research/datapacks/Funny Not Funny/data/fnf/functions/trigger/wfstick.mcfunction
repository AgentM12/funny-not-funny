
execute if entity @s[team=fnf_players] run tag @s add fnf_tmp_player
execute if entity @s[team=fnf_spectators] run function fnf:trigger/join_players
execute if entity @s[tag=fnf_tmp_player] run function fnf:trigger/join_spectators

tag @s remove fnf_tmp_player
scoreboard players set @s fnf_use_wfstick 0