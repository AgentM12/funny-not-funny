# No-reload guard
scoreboard objectives add fnf_game dummy "Game Variables"
execute unless score $FNF_INITIALIZED fnf_game matches 1 run function fnf:load
execute if score $FNF_INITIALIZED fnf_game matches 1 run function fnf:safe_tick