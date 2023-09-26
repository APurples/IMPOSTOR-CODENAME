// fast forward script by lunarcleint
// opponent mode fix for fast forward by yasher
// botplay by me (lol)

function update() {
    if (startingSong || !canPause || paused || health <= 0) return;
    updateSpeed(FlxG.keys.pressed.TWO);

    if (FlxG.keys.pressed.THREE){
        player.cpu = true;
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