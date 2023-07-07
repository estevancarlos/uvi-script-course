--------------------------------------------------------------------------------
-- Variables
--------------------------------------------------------------------------------
local isPlaying = false                     -- This checks the state of playback
local count = 0                             -- Keeps count of beats
local noteTable = {60,64,65,67}             -- A table of MIDI Notes
local mainBg = Image("assets/tut-table_bg.png")

--------------------------------------------------------------------------------
-- User Interface
--------------------------------------------------------------------------------
mainBg.x = 0
mainBg.y = 0

--------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------

function counter()
    -- Each time the function runs it counts.
    -- Counts up to 4 then restarts.
    if count < 4 then
        count = count + 1
    else
        count = 1
    end

    -- The print is at the end in order to show 
    -- the right number after the previous calculations
    print(count)                            
end

function beatCount()
    -- Checks if the transport is currently playing
    -- While transport is playing, it repeats the functions
    while(isPlaying == true)
    do
        counter()
        playNote(noteTable[count],100,1000)
        waitBeat(1)
    end
end

--------------------------------------------------------------------------------
-- Event callbacks
--------------------------------------------------------------------------------

function onTransport(e)
    isPlaying = e
    beatCount()
end

--------------------------------------------------------------------------------
-- Initialize UI
--------------------------------------------------------------------------------
setSize(720, 500)
