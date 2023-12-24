function new(){
    if (FlxG.save.data.flashingLights) FlxG.camera.flash(0xFFFF0000, 1);
    if (FlxG.save.data.screenShake) FlxG.camera.shake(0.015, .35);

    new FlxTimer().start(1.1, function(tmr:FlxTimer){
        if (FlxG.save.data.screenShake) FlxG.camera.shake(0.0035, .35);
    });
}

function update() if (controls.BACK) PlayState.deathCounter = 0;