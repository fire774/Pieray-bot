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
   global IGNORE_BIOMES, VILLAGES, TTS_OFF

   ; Set the delay time between inputs (in milliseconds)
      DELAY = 20

   ; Select specific biomes to search for (change to "true")
      BEACH := true
      FOREST := false
      PLAINS := false
      DESERT := true
      SAVANNA := true
      OCEAN := true
      JUNGLE := true

   ; Ignore biomes
   ; (resets for only blacksmiths & nearby chests)
      IGNORE_BIOMES := false

   ; Plays villages (without blacksmiths)
      VILLAGES := true

   ; Disable TTS audio files from playing when a seed is found
      TTS_OFF := false
      
}

; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;

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
   global IGNORE_BIOMES, VILLAGES, TTS_OFF
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

; checks if there are any special blocks on pie chart
PieRay()
{
   global VILLAGES, TTS_OFF
   Sleep, 500
   WinGetPos, X, Y, Width, Height, A
   HalfWidth := Width//2
   Xsearch1 := HalfWidth
   Ysearch1 := 0
   Xsearch2 := Width
   Ysearch2 := Height
   ; filtering for furnace detections (blacksmiths)
   PixelSearch, Xfound, Yfound, %Xsearch1%, %Ysearch1%, %Xsearch2%, %Ysearch2%, 0xCEE4C4, 1, Fast
   if(!ErrorLevel)
   {
       if !(TTS_OFF)
          SoundPlay, %A_ScriptDir%\Audio\blacksmith.mp3
       return true
   }
   Else
   {
      If (VILLAGES)
      {
         ; filtering for brewing stand (village spawn)
         PixelSearch, Xfound2, Yfound2, %Xsearch1%, %Ysearch1%, %Xsearch2%, %Ysearch2%, 0x6EEE4E, 1, Fast
         if(!ErrorLevel)
         {
            if !(TTS_OFF)
               SoundPlay, %A_ScriptDir%\Audio\village_detected.mp3
            return true
         }
       
         ; filtering for a bell (village spawn)
         Else
         {
            PixelSearch, Xfound2, Yfound2, %Xsearch1%, %Ysearch1%, %Xsearch2%, %Ysearch2%, 0xE466EE, 1, Fast
            if(!ErrorLevel)
            {
               if !(TTS_OFF)
                  SoundPlay, %A_ScriptDir%\Audio\village_detected.mp3
               return true
            }
         }
      }

      ; filtering for chest detections
      PixelSearch, Xfound, Yfound, %Xsearch1%, %Ysearch1%, %Xsearch2%, %Ysearch2%, 0xE46EC6, 1, Fast
      if (!ErrorLevel)
      {
         ; filtering for mob spawners (abandoned mineshafts)
         PixelSearch, Xfound2, Yfound2, %Xsearch1%, %Ysearch1%, %Xsearch2%, %Ysearch2%, 0xCCE44E, 1, Fast
         ; mob spawner is found
         if(!ErrorLevel)
         {
            return false
         }
         ; all non-mineshaft chest cases
         Else
         {
            ; only a chest is detected (unknown / outer case)
            if !(TTS_OFF)
               SoundPlay, %A_ScriptDir%\Audio\chest_nearby.mp3
            return true
         }
      }
      ; nothing is found
      Else
      {
         return false
      }
   }
}

; main function to reset the program
LoopCreation()
{
   ; global variables ;
   global BEACH, DESERT, FOREST, OCEAN, SAVANNA, PLAINS, JUNGLE
   global IGNORE_BIOMES, VILLAGES, TTS_OFF

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
      Loop
      {
         IfWinActive, Minecraft
         {
            PixelSearch, Xfound3, Yfound3, 0, Height-40, 50, Height, 0xFCFCFC, 1, Fast
            if(ErrorLevel)
            {
               Sleep, 200
            }
            Else
            {
            CreateWorld()
            break
            }
         }
      }
   }

   ; wait until the world is generated
   FinishLoadingWorld()
   
   ; not searching for biomes
   if(IGNORE_BIOMES)
   {
      CheckDebug()
      if !(PieRay())
      {
         LoopCreation()
      }
      Send {F3}
   }
   
   ; searching for biomes
   Else
   {
     ; check if spawn biome matches one being searched for
      CheckBiomes()
      ; if spawn biome is good, piechart is checked and world is not reset
      if(CheckBiomes())
      {
         CheckDebug()
         PieRay()
         Send {F3}
      }
   
      ; check pieray and reset if nothing is found
      Else
      {
        CheckDebug()
         if !(PieRay())
         {
            LoopCreation()
         }
      } 
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