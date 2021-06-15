# Biased random, but it's not of big importance.
scoreboard players operation $FNF_RANDOM_MAX fnf_temp = $FNF_PROMPT_COUNT fnf_temp
scoreboard players remove $FNF_PROMPT_COUNT fnf_temp 1
function fnf:random/get
scoreboard players operation $FNF_SELECTED fnf_pid = $FNF_RANDOM fnf_temp
function fnf:state/3_vote/populate_text

# Timer
scoreboard players operation $FNF_TIMER fnf_timer = $FNF_VOTE_TIME fnf_const