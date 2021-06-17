execute if score @s fnf_pstate matches 3 run function fnf:state/3_vote/unload_player_state

execute if score $FNF_STATE fnf_game matches 2 run function fnf:state/2_answer/load_player_state
execute if score $FNF_STATE fnf_game matches 3 run function fnf:state/3_vote/load_player_state
execute if score $FNF_STATE fnf_game matches 4 run function fnf:state/4_results/load_player_state