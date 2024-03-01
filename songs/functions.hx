//

/*
* This is the code for oftenly used events (such as red flashing, play videos, etc).
*/


/*
* Amount of beats before the red flash occurs. Set to null to stop the flashing
*/
public var redFlashBeat:Int = null;

function beatHit(curBeat:Int)
    if (redFlashBeat != null && curBeat % redFlashBeat == 0)
        redFlash(0.35);

public function redFlash(time:Float){
    camGame.zoom += 0.015;
    camHUD.zoom += 0.03;
    if (FlxG.save.data.flashingLights) camGame.flash(0x7EFF0000, time);
}