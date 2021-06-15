scoreboard players operation $FNF_REM fnf_temp = $FNF_TIMER fnf_timer
scoreboard players operation $FNF_REM fnf_temp %= $FNF_20 fnf_const

execute if score $FNF_REM fnf_temp matches 0 run function fnf:timer/display

execute if score $FNF_TIMER fnf_timer matches 0 if score $FNF_STATE_CHANGE fnf_game matches 0 run function fnf:state/next_state
execute if score $FNF_TIMER fnf_timer matches 1.. if score $FNF_STATE_CHANGE fnf_game matches 0 run scoreboard players remove $FNF_TIMER fnf_timer 1