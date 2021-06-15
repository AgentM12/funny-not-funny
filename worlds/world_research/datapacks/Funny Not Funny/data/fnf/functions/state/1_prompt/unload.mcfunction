
# Empty stands have to be filled from the database randomly.

# Store all answers in storage
data modify storage fnf:game_store Prompts set value []
execute as @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_p1,tag=fnf_lectern,limit=1] at @s as @e[type=minecraft:marker,tag=fnf_state_1,tag=fnf_lectern,sort=nearest] if score @s fnf_pid <= $FNF_PLAYERS fnf_game at @s run function fnf:state/1_prompt/store_data
