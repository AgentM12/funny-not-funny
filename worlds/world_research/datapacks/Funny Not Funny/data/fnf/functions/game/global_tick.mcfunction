effect give @a minecraft:saturation 10 0 true

# Players online and in-game.
execute store result score $FNF_PLAYERS_ONLINE fnf_game if entity @a[scores={fnf_pid=1..}]