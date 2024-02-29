//

/*
* This is the code for oftenly used events (such as red flashing, play videos, etc).
*/

var cancelRedFlashBeat:Bool = true;

public function redFlash(camera:FlxCamera, time:Float){
    camGame.zoom += 0.015;
    camHUD.zoom += 0.03;
    if (FlxG.save.data.flashingLights) camera.flash(0x7EFF0000, time);
}

public function redFlashBeat(camera:FlxCamera, time:Float, beat:Int){
    cancelRedFlashBeat = false;

    if (!cancelRedFlashBeat && curBeat % beat == 0){
        camGame.zoom += 0.015;
        camHUD.zoom += 0.03;
        if (FlxG.save.data.flashingLights) redFlash(0x7EFF0000, time);
    }
}

public function cancelRedFlashBeat() cancelRedFlashBeat = true;