# Disable for 1 tick
execute store result score $FNF_TEMP fnf_game run gamerule sendCommandFeedback
execute if score $FNF_TEMP fnf_game matches 1 run gamerule sendCommandFeedback false
execute if score $FNF_TEMP fnf_game matches 1 run schedule function fnf:feedback_on 1t