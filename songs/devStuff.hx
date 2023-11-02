// fast forward script by lunarcleint
// opponent mode fix for fast forward and open console by pressing f6 by yasher
// botplay by me (lol)

import funkin.backend.utils.NativeAPI;

var devMode:Bool = true; // youre not a dev youre not a dev youre not a dev youre not a dev youre not a dev youre not a-

function update(elapsed) {
    if (devMode == true){
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