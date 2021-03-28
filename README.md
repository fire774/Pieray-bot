# Pieray-bot
Pieray &amp; reset script for AutoHotKey

AutoHotKey must be downloaded to run this script.
https://www.autohotkey.com/

# Defualt values and hotkeys

Run the script: Y

Stop the script: U

After downloading the file, right click the .ahk file and click "Edit Script" to get into the code.

Scroll down to the last few lines where it says "#IfWinActive, Minecraft." You'll see Y and U before two semicolons, indicating they're hotkeys. You can change them.

At the top of the script, you'll see some global variables defined. DELAY holds the number of milliseconds between inputs when creating new worlds. Below that are a list of biomes, set their values to "true" or "false" (case sensitive, no quotations) to search for specific ones. Below that, making IGNORE_BIOMES true is essentially the same as changing every biome to false. Turning VILLAGES to true includes villages in the search that have no blacksmiths. The final global variable TTS_OFF does not alert you when a seed is found. Recommended to leave this as false.

After changing the global variables, make sure to save the file and double click it to run.

# Important info
SET UP THE PIE CHART BEFORE RUNNING! Go into a world, open the pie chart manually with Shift+F3, and use the numbers on your keyboard to navigate into the following subsets of the pie: tick > level > entities > block entities. The bot cannot do this by itself because "tick" is not always the same, although the order will probably be something similar to "4, 1, 1, 3."

The script cannot be run directly from a world if that world is open to LAN. If you do open a world to LAN, exit to the title screen and it should work fine.

Since previous world files are not automatically deleted, if you don't have a great computer I don't recommend leaving this running for several hours at a time because world creation can become laggy and inconsistent after a few hundred resets.