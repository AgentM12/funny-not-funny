
## Gamerules ##
gamerule announceAdvancements false
gamerule commandBlockOutput false
gamerule disableRaids true
gamerule doDaylightCycle false
#gamerule doEntityDrops false
gamerule doFireTick false
gamerule doImmediateRespawn true
gamerule doInsomnia false
gamerule doLimitedCrafting true
#gamerule doMobLoot false
gamerule doMobSpawning false
gamerule doPatrolSpawning false
#gamerule doTileDrops false
gamerule doTraderSpawning false
gamerule doWeatherCycle false
gamerule drowningDamage false
gamerule fallDamage false
gamerule fireDamage false
gamerule freezeDamage false
gamerule keepInventory true
gamerule logAdminCommands false
gamerule mobGriefing false
gamerule randomTickSpeed 0
gamerule showDeathMessages false
gamerule playersSleepingPercentage 200
gamerule spawnRadius 10
gamerule spectatorsGenerateChunks false

#gamerule sendCommandFeedback false

## Define ##
scoreboard objectives add fnf_option dummy "Option"
scoreboard objectives add fnf_const dummy "Constant"
scoreboard objectives add fnf_game dummy "Game Variables"
scoreboard objectives add fnf_temp dummy "Temporary Variables"
scoreboard objectives add fnf_timer dummy "Timer Variables"

scoreboard objectives add fnf_pid dummy "Player ID"
scoreboard objectives add fnf_pstate dummy "Player State"
scoreboard objectives add fnf_int_score dummy "Internal Player Score"
scoreboard objectives add fnf_disp_score dummy "Score"
scoreboard objectives add fnf_disp_count dummy "Players"
scoreboard objectives add fnf_rounds dummy "Rounds Played"
scoreboard objectives add fnf_spec_rounds dummy "Rounds Spectated"
scoreboard objectives add fnf_votes_cast dummy "Total Votes Cast"
scoreboard objectives add fnf_votes_recv dummy "Total Votes Received"

# Non-dummy
scoreboard objectives add fnf_use_wfstick minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add fnf_relog minecraft.custom:minecraft.leave_game "Relogged"

## Initialize ##

# MinPlayers: 3
scoreboard players set $FNF_MIN_PLAYERS fnf_const 3
# MaxPlayers: 10
scoreboard players set $FNF_MAX_PLAYERS fnf_const 10
# Prompt Time in ticks: 2400 (2 minutes)
scoreboard players set $FNF_PROMPT_TIME fnf_const 2400
# Answer Time in ticks: 2400 (2 minutes)
scoreboard players set $FNF_ANSWER_TIME fnf_const 2400
# Vote Time per prompt in ticks: 600 (30 seconds)
scoreboard players set $FNF_VOTE_TIME fnf_const 600
# Results Time in ticks: 800 (30 seconds)
scoreboard players set $FNF_RESULT_TIME fnf_const 600

# Numbers
scoreboard players set $FNF_20 fnf_const 20


# State: 0 - Lobby, 1 - Prompt input, 2 - Answer Prompts, 3 - Vote Rounds, 4 - Results
scoreboard players add $FNF_STATE fnf_game 0
# ID: each game generates a unique ID (increment)
scoreboard players add $FNF_ID fnf_game 0
# Players: How many players are joining
scoreboard players add $FNF_PLAYERS fnf_game 0

# PlayerID: An identifier bound to players.
scoreboard players set @e[tag=fnf_p1] fnf_pid 1
scoreboard players set @e[tag=fnf_p2] fnf_pid 2
scoreboard players set @e[tag=fnf_p3] fnf_pid 3
scoreboard players set @e[tag=fnf_p4] fnf_pid 4
scoreboard players set @e[tag=fnf_p5] fnf_pid 5
scoreboard players set @e[tag=fnf_p6] fnf_pid 6
scoreboard players set @e[tag=fnf_p7] fnf_pid 7
scoreboard players set @e[tag=fnf_p8] fnf_pid 8
scoreboard players set @e[tag=fnf_p9] fnf_pid 9
scoreboard players set @e[tag=fnf_p10] fnf_pid 10

## Defaults ##
scoreboard players add $FNF_ADMINS_START_GAME fnf_option 0
scoreboard players add $FNF_DISABLE_PROMPTS fnf_option 0
scoreboard players add $FNF_HIDDEN_VOTES fnf_option 0

execute unless score $FNF_INITIALIZED fnf_game matches 1 run function fnf:reset



## Teams ##
team add fnf_players "Players"
team modify fnf_players collisionRule never
team modify fnf_players color green
team modify fnf_players deathMessageVisibility never
team modify fnf_players friendlyFire false
team modify fnf_players seeFriendlyInvisibles true
team modify fnf_players nametagVisibility always

team add fnf_spectators "Spectators"
team modify fnf_spectators collisionRule never
team modify fnf_spectators color dark_gray
team modify fnf_spectators deathMessageVisibility never
team modify fnf_spectators friendlyFire false
team modify fnf_spectators seeFriendlyInvisibles true
