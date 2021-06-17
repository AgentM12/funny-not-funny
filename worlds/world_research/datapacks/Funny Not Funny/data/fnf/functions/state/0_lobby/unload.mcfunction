gamemode adventure @a[team=fnf_players]

effect clear @a[gamemode=!creative]
clear @a[gamemode=!creative]
scoreboard players set $FNF_START_GAME_TIMER fnf_game -1

# Inc the game id
scoreboard players add $FNF_ID fnf_game 1

# Assign random players an ID to play.
scoreboard players reset @a fnf_pid
scoreboard players set $FNF_TEMP_ID fnf_pid 1
execute as @a[team=fnf_players,sort=random] at @s run function fnf:game/players/assign_id

scoreboard players add @a[tag=fnf_playing] fnf_rounds 1

# Remaining players will be spectating
execute as @a[tag=!fnf_playing,gamemode=!creative] run function fnf:game/players/force_spectator

scoreboard players add @a[tag=!fnf_playing] fnf_spec_rounds 1

# Can't see nametags while writing prompts...
team modify fnf_players seeFriendlyInvisibles false
team modify fnf_players nametagVisibility hideForOwnTeam

# Clear temp storage
data remove storage fnf:temp Games
data remove storage fnf:temp Prompts
data remove storage fnf:temp SelectedPrompt