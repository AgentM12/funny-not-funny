
# RESET ALL GAME STATE (not data)

# Variables
scoreboard players set $FNF_START_GAME fnf_timer -1


# Constants
scoreboard players set $FNF_TOPIC_COUNT fnf_const 16

data modify storage fnf:game_store Topics set value ["Minecraft", "Games", "Clothes", "Animals", "People", "Countries", "Music", "Family", "Friends", "Work", "School", "Traffic", "Transportation", "Food", "Movies", "Memes"]


# NBT DATA not cleared
#data modify storage fnf:data_archive Games set value []


# Initialized
scoreboard players set $FNF_INITIALIZED fnf_game 1