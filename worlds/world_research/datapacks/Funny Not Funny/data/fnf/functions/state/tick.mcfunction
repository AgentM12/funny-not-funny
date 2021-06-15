# List of states
execute if score $FNF_STATE_CHANGE fnf_game matches 0 if score $FNF_STATE fnf_game matches 0 run function fnf:state/0_lobby/tick
execute if score $FNF_STATE_CHANGE fnf_game matches 0 if score $FNF_STATE fnf_game matches 1 run function fnf:state/1_prompt/tick
execute if score $FNF_STATE_CHANGE fnf_game matches 0 if score $FNF_STATE fnf_game matches 2 run function fnf:state/2_answer/tick
execute if score $FNF_STATE_CHANGE fnf_game matches 0 if score $FNF_STATE fnf_game matches 3 run function fnf:state/3_vote/tick
execute if score $FNF_STATE_CHANGE fnf_game matches 0 if score $FNF_STATE fnf_game matches 4 run function fnf:state/4_results/tick

scoreboard players set $FNF_STATE_CHANGE fnf_game 0