/* 
    Hiiii, if you're looking at this file because you turned on dev mode in the settings for whatever reason,
    you have access to the tools coded in here, heres what you can do:
        - In the main menu, you can press 7 to access the editors such as the chart editor, character editor, etc. (cne modders probably already know this lmfao)
        - Hold down 2 to fast forward through a song, release anytime to stop
        - Hold down 3 to enable botplay. Release anytime to disable it
        - Press F6 to see the logs, which let you see traces, warnings, and errors. Helpful for fixing code

    Credits:
    fast forward script by lunarcleint
    opponent mode fix for fast forward and open console by pressing f6 by yasher
    botplay by me (lol)

    ok have fun
*/

import funkin.backend.utils.NativeAPI;

function update(elapsed) {
    if (FlxG.save.data.devMode){
        if (startingSong || !canPause || paused || health <= 0) return;
        updateSpeed(FlxG.keys.pressed.TWO);
    
        if (FlxG.keys.pressed.THREE){
            player.cpu = true;
        }
    
        if (FlxG.keys.justPressed.F6)
            NativeAPI.allocConsole();
    }
}

function updateSpeed(fast:Bool) {
    if (!PlayState.opponentMode) {
        FlxG.timeScale = inst.pitch = vocals.pitch = (player.cpu = fast) ? 10 : 1;
        FlxG.sound.muted = fast;
        health = !(canDie != fast) ? 2 : health;
    }
}

function onGamePause() {updateSpeed(false);}
function onSongEnd() {updateSpeed(false);}
function destroy() {FlxG.timeScale = 1;FlxG.sound.muted = false;}