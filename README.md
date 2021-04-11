# Pieray-bot
Pieray &amp; reset script for AutoHotKey. Approved for 1.16 RSG runs.

For a more detailed explanation and info on criteria:
https://youtu.be/B1NopkA0B-c

AutoHotKey must be downloaded to run this script.
https://www.autohotkey.com/

# Defualt values and hotkeys

Run the script: Y

Stop the script: U

After downloading the file, right click the .ahk file and click "Edit Script" to get into the code.

Scroll down to the last few lines where it says "#IfWinActive, Minecraft." You'll see Y and U before two semicolons, indicating they're hotkeys. You can change them.

At the top of the script, you'll see some global variables defined. DELAY holds the number of milliseconds between inputs when creating new worlds. Below that are a list of biomes, set their values to "true" or "false" (case sensitive, no quotations) to search for specific ones. Below that, turn SIMPLE_RESET to 0 if you only want the script to reset a world and NOT search for anything. The final global variable TTS_OFF turns off the audio files that alert you when a seed is found.

After changing the global variables, make sure to save the file and double click it to run.

# Important info
The script cannot be run directly from a world if that world is open to LAN. If you do open a world to LAN, exit to the title screen and it should work fine.

Since previous world files are not automatically deleted, if you don't have a great computer I don't recommend leaving this running for several hours at a time because world creation can become laggy and inconsistent after a few hundred resets.

If you run into a problem please let me know, code is prone to bugs.

# Update log
. . .

# Look here if you have a problem
Do not start the script from the pause menu.

If the world is open to LAN, exit to the title screen and run it.

You must have at least ONE world created before running the script, so it can find the correct directory.

MultiMC users: Pieray bot uses the local AppData directory to find your world files, so you'll have to manually change %A_AppData% to match your instance of Minecraft (Thanks Surreal for letting me know).

If you run into any problems message me at fire#3543, I can probably figure it out.
