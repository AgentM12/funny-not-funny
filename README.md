# Funny Not Funny
A simple party game for 3-10 players (and any amount of spectators) implemented in Minecraft.

The goal is to create prompts and answers. Try to come up with the funniest answers to a prompt to get lots of player votes to win.

## Install Instructions
1. Simply clone this git repository in an empty directory
2. Run the server.jar (Minecraft version 1.17, requires Java 16)
3. Join the server at your IP address with port 25565

Note that you might have to port-forward 25565 in case you want to allow incoming external connections.


## Debug Info

If there are any bugs in the game, let me know in an issue, or create a pr with a fix.

*Code analysis:*
tools/debug contains a static analysis tool (mcsa.py) checking for common errors and giving command usage statistics.

*Highly technical:*
In-game you can see `minecraft:marker` entities by tagging yourself with `/tag @s add fnf_show_markers` or remove it with `/tag @s remove fnf_show_markers`