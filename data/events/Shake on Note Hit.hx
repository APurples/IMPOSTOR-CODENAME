var shakeBfHit:Bool = false;
var shakeDadHit:Bool = false;
var shakeOppMode:Bool = false;

function onEvent(e:EventGameEvent){
    if (e.event.name == "Shake on Note Hit"){
        if (e.event.params[0] == true) shakeBfHit = true;
        else shakeBfHit = false;

        if (e.event.params[1] == true) shakeDadHit = true;
        else shakeDadHit = false;
    }
}

function onDadHit(event:NoteHitEvent){
    if(FlxG.save.data.screenShake){
        if (shakeDadHit == true) FlxG.camera.shake(0.015, .1, null, true);
    }
}

function onPlayerHit(event:NoteHitEvent){
    if(FlxG.save.data.screenShake){
        if (shakeBfHit == true) FlxG.camera.shake(0.015, .1, null, true);
    }
}