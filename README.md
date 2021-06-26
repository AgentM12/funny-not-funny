# Funny Not Funny
A simple party game for 3-10 players (and any amount of spectators) implemented in Minecraft.

The goal is to create prompts and answers. Try to come up with the funniest answers to a prompt to get lots of player votes to win.

## Install Instructions
**Pre-requisites**: All participating players will need a Minecraft Java Edition account and connect to the server using `Minecraft Java Edition version 1.17`.
The server host will need `Java 16` as well as at least 4GB RAM and a decent internet connection.

**Steps**:
1. Simply clone this git repository in an empty directory
2. Run the `start_server.bat` (Minecraft version 1.17, requires Java 16) or use the command: \
    ```bat
    java -Xms2048M -Xmx2048M -jar server.jar --universe worlds --world world_research --port 25565
    ```
3. Join the server at your IP address with port 25565

**Note** that you may have to port-forward 25565 in case you want to allow incoming external connections.


## Options
These options can be set by an admin to customize the experience:
 - `/function fnf:_option/admin_start`: Toggles the ability for anyone/only admins to start the game.
 - `/function fnf:_option/hidden_votes`: Toggles the messages telling who voted for what.
 - `/function fnf:_option/no_prompts`: Toggles the prompts phase on/off to allow old prompts from re-appearing.

To add players as admins use `/op <PlayerName>`. Alternatively, you can run the option functions above from the server console directly.

## Debug Info

If there are any bugs in the game, let me know in an issue, or create a PR with a fix.

*Code analysis:*
tools/debug contains a static analysis tool `mcsa.py` that checks for common errors and returns command usage statistics.

*Fixing Game State:* If you get stuck during any game (which shouldn't happen), you could try fixing this by running `/function fnf:state/0_lobby/transition` to transition all online players back to the lobby. You should also run `/reload`. If things don't work, try reinstalling this entire project.


## Data 
The data is stored in the nbt storage `fnf:data_archive`. The game itself uses and modifies `fnf:game_store` for any internal state. Furthermore, player specific stats are stored in the playerdata files within the world.

The data can be extracted using the `extract_data.py` script in `/tools`. This will dettach the player specific stats from any personally identifiable data, however any game data is merely extracted and not anonymized in any way due to the potential loss or alteration of critical data.