tag @a remove fnf_has_highscore
scoreboard players set $FNF_SCORE_MAX fnf_temp -1
scoreboard players operation $FNF_SCORE_MAX fnf_temp > @a[tag=fnf_playing] fnf_disp_score
execute as @a[tag=fnf_playing] at @s if score @s fnf_disp_score = $FNF_SCORE_MAX fnf_temp run tag @s add fnf_has_highscore