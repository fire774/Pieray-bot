#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; author: fire774
; contact me on discord: fire#3543

; default global variables
; CHANGE THESE VALUES
SetDefaults()
{
   ; global variables ;
   global DELAY
   global BEACH, DESERT, FOREST, OCEAN, SAVANNA, PLAINS, JUNGLE
   global TTS_OFF, SIMPLE_RESET

; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

   ; Set the delay time between inputs (in milliseconds)
      DELAY = 50

   ; Select specific biomes to search for (change to "true" or "false")
      BEACH := true
      FOREST := true
      PLAINS := true
      DESERT := true
      SAVANNA := false
      OCEAN := true
      JUNGLE := false

   ; Turn to 1 to IGNORE ALL OTHER SETTINGS
   ; simply resets the world when the hotkey is pressed
      SIMPLE_RESET = 0

   ; Disable TTS audio files from playing when a seed is found
      TTS_OFF := false

; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
      
}

; creates a new world from the title screen
CreateWorld()
{
   global DELAY
   FindJsonDir()

   Sleep, 1000
   send {Tab}
   Sleep, %DELAY%
   send {Enter}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Enter}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Enter}
   Sleep, %DELAY%
   send {Enter}
   Sleep, %DELAY%
   send {Enter}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY% 
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Enter}
}

; finding the correct directory of advancements folder and its json
FindJsonDir()
{
   BASE_DIR = %A_AppData%\.minecraft\saves\New World\advancements\
   if FileExist(BASE_DIR)
   {
      Loop
      {
         NEW_DIR = %A_AppData%\.minecraft\saves\New World (%A_Index%)\
         if !FileExist(NEW_DIR)
         {
            global ADVANCEMENTS_DIR
            ADVANCEMENTS_DIR = %NEW_DIR%advancements\
            break
         }
      }
   }
   Else if !FileExist(BASE_DIR)
   {
      global ADVANCEMENTS_DIR
      ADVANCEMENTS_DIR = %BASE_DIR%
   }
}

; exits a world to title screen
ExitWorld()
{
  global DELAY
   send {Esc}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Tab}
   Sleep, %DELAY%
   send {Enter}
}

; loops until player spawns into the world
FinishLoadingWorld()
{
   global ADVANCEMENTS_DIR
   Loop
   {
      if FileExist(ADVANCEMENTS_DIR)
      {
         break
      }
      Sleep, 500
   }
}

; presses Shift+F3 to check pieray
CheckDebug()
{
   Sleep, 300
   send {Shift}+{F3}
}

; returns True if the spawn biome matches the parameter
SpawnBiome(biome)
{
   global ADVANCEMENTS_DIR
   DATA = 0
   Loop, Files, %ADVANCEMENTS_DIR%\*.json
   FileReadLine, DATA, %ADVANCEMENTS_DIR%\%A_LoopFileName%, 4
   If ErrorLevel
   {
      MsgBox, There was an error retrieving biome data.
   }
   Else
   {
      Haystack := DATA
      Needle = %biome%
      If InStr(Haystack, Needle)
      {
         return true
      }
      Else
      {
         return false
      }
   }
}

; returns True if spawn biome matches for any biome currently being searched for
CheckBiomes() 
{
   global BEACH, DESERT, FOREST, OCEAN, SAVANNA, PLAINS, JUNGLE
   global IGNORE_BIOMES, TTS_OFF, SIMPLE_RESET
   if(BEACH)
   {
      if SpawnBiome("beach")
      {
         if !(TTS_OFF)
            SoundPlay, %A_ScriptDir%\Audio\beach.mp3
         return true
      }
   }
   Else if(DESERT)
   {
      if SpawnBiome("desert")
      {
         if !(TTS_OFF)
            SoundPlay, %A_ScriptDir%\Audio\desert.mp3
         return true
      }
   }
   if(FOREST)
   {
      if SpawnBiome("forest")
      {
         if !(TTS_OFF)
            SoundPlay, %A_ScriptDir%\Audio\forest.mp3
         return true
      }
   }
   if(OCEAN)
   {
      if SpawnBiome("ocean")
      {
         if !(TTS_OFF)
            SoundPlay, %A_ScriptDir%\Audio\ocean.mp3
         return true
      }
   }
   if(SAVANNA)
   {
      if SpawnBiome("savanna")
      {
         if !(TTS_OFF)
            SoundPlay, %A_ScriptDir%\Audio\savanna.mp3
         return true
      }
   }
   if(PLAINS)
   {
      if SpawnBiome("plains")
      {
         if !(TTS_OFF)
            SoundPlay, %A_ScriptDir%\Audio\plains.mp3
         return true
      }
   }
   if(JUNGLE)
   {
      if SpawnBiome("jungle")
      {
         if !(TTS_OFF)
            SoundPlay, %A_ScriptDir%\Audio\jungle.mp3
         return true
      }
   }
   Else
   {
      return false
   }
}

; main function to reset the program
LoopCreation()
{
   ; global variables ;
   global BEACH, DESERT, FOREST, OCEAN, SAVANNA, PLAINS, JUNGLE
   global IGNORE_BIOMES, TTS_OFF, SIMPLE_RESET

   ; local variables ;
   WinGetActiveTitle, TITLE
   WinGetPos, X, Y, Width, Height, Minecraft

   ; on the title screen
   IfNotInString TITLE, Singleplayer
      CreateWorld()

   ; exit out of world and create new one
   else
   {
      ExitWorld()
      Sleep, 1500
      CreateWorld()
   }

   If !(SIMPLE_RESET)
   {
         ; wait until the world is generated
      FinishLoadingWorld()
   
        ; searching for biomes
     ; check if spawn biome matches one being searched for
      CheckBiomes()
      if !(CheckBiomes())
         LoopCreation()
   }
}

; terminates the script
ExitFunc()
{
   MsgBox, Script terminated
   ExitApp
}

#IfWinActive, Minecraft
{
U::
   ExitFunc()
Y::
   SetDefaults()
   LoopCreation()
return
}
