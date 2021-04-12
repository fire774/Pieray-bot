# Pieray-bot
Pieray &amp; reset script for AutoHotKey. NO LONGER APPROVED FOR 1.16 RSG RUNS. DO NOT USE (Currently under developement).

For a more detailed explanation and info on criteria:
https://youtu.be/B1NopkA0B-c

AutoHotKey must be downloaded to run this script.
https://www.autohotkey.com/

# Defualt values and hotkeys

Run the script: Y

Stop the script: U

After downloading the file, right click the .ahk file and click "Edit Script" to get into the code.

Scroll down to the last few lines where it says "#IfWinActive, Minecraft." You'll see Y and U before two semicolons, indicating they're hotkeys. You can change them.

At the top of the script, you'll see some global variables defined. DELAY holds the number of milliseconds between inputs when creating new worlds. Below that are a list of biomes, set their values to "true" or "false" (case sensitive, no quotations) to search for specific ones. Below that, making IGNORE_BIOMES true is essentially the same as changing every biome to false. The variables BLACKSMITHS, VILLAGES, and CHESTS tell the bot to search for these things after loading into a world if true. The final global variable TTS_OFF turns off the audio files that alert you when a seed is found. Recommended to leave this as false.

After changing the global variables, make sure to save the file and double click it to run.

# Important info
SET UP THE PIE CHART BEFORE RUNNING! Go into a world, open the pie chart manually with Shift+F3, and use the numbers on your keyboard to navigate into the following subsets of the pie: tick > level > entities > block entities. The bot cannot do this by itself without invalidating the run - the order will probably be something similar to "4, 1, 1, 3." Once you set it up you can leave it unless you close the window (in which case you'll need to reset it again).

The script cannot be run directly from a world if that world is open to LAN. If you do open a world to LAN, exit to the title screen and it should work fine.

Since previous world files are not automatically deleted, if you don't have a great computer I don't recommend leaving this running for several hours at a time because world creation can become laggy and inconsistent after a few hundred resets.

If you run into a problem please let me know, code is prone to bugs.

# Update log
version 1.1 (03-29-2021): Filtering for chests and blacksmiths is now optional, they're no longer hard coded into the Pieray bot. Added option of SIMPLE_RESET which only resets the world once, it does not search for anything. Default delay set to 70ms, as recommended by the mods.

04-11-2021: Added the LITE version, which does not use pieray. It filters by biome only, and does not use AHK's PixelSearch function which has recently been really buggy. Use this if you want a simplified version or the original is not working. Find it here: https://github.com/fire774/Pieray-bot/tree/fire774-lite

# Look here if you have a problem
Do not start the script from the pause menu.

If the world is open to LAN, exit to the title screen and run it.

You must have at least ONE world created before running the script, so it can find the correct directory.

If you use fullscreen mode and the bot does not work properly right after downloading it, go to windowed then back to fullscreen and restart the script. 

Use the LITE version for a much more reliable script: https://github.com/fire774/Pieray-bot/tree/fire774-lite

MultiMC users: Pieray bot uses the local AppData directory to find your world files, so you'll have to manually change %A_AppData% to match your instance of Minecraft (Thanks Surreal for letting me know).

If you run into any problems message me at fire#3543 so I can put them here.
