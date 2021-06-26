# Funny Not Funny
A simple party game for 3-10 players (and any amount of spectators) implemented in Minecraft.

The goal is to create prompts and answers. Try to come up with the funniest answers to a prompt to get lots of player votes to win.

## Install Instructions
1. Simply clone this git repository in an empty directory
2. Run the `start_server.bat` (Minecraft version 1.17, requires Java 16) or use the command: \
    ```bat
    java -Xms2048M -Xmx2048M -jar server.jar --universe worlds --world world_research --port 25565
    ```
3. Join the server at your IP address with port 25565

Note that you may have to port-forward 25565 in case you want to allow incoming external connections.


## Options
These options can be set by an admin to customize the experience:
 - `/function fnf:_option/admin_start`: Toggles the ability for anyone/only admins to start the game.
 - `/function fnf:_option/hidden_votes`: Toggles the messages telling who voted for what.
 - `/function fnf:_option/no_prompts`: Toggles the prompts phase on/off to allow old prompts from re-appearing.


## Debug Info

If there are any bugs in the game, let me know in an issue, or create a pr with a fix.

*Code analysis:*
tools/debug contains a static analysis tool (mcsa.py) checking for common errors and giving command usage statistics.

*Highly technical:*
In-game you can see `minecraft:marker` entities by tagging yourself with `/tag @s add fnf_show_markers` or remove it with `/tag @s remove fnf_show_markers`


## Data 
The data is stored in the nbt storage `fnf:data_archive`. The game itself uses and modifies `fnf:game_store` for any internal state. Furthermore, player specific stats are stored in the playerdata files within the world.

The data can be extracted using the `extract_data.py` script in `/tools`. This will dettach the player specific stats from any personally identifiable data, however any game data is not cleaned, due to the consequences this could have with regards to modifying data unwantedly.