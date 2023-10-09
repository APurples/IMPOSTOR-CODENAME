var boing:Bool = false;

function onEvent(e:EventGameEvent){
    if (e.event.name == "Note Bounce"){
        mult = e.event.params[1];

        if (e.event.params[0] == true){
            boing = true;
        }
        if (e.event.params[0] == false){
            boing = false;
        }
    }
}

function stepHit(){
    if (boing){
        if (curStep % 4 == 0){
            boingUp();
        }
        if (curStep % 4 == 2){
            boingDown();
        }
    }
    else{
        FlxTween.tween(camHUD, {y: 0}, Conductor.stepCrochet * 0.002, {ease: FlxEase.sineOut});
    }
}

function boingUp(){
    FlxTween.tween(camHUD, {y: -10 * mult}, Conductor.stepCrochet * 0.002, {ease: FlxEase.circOut});
}

function boingDown(){
    FlxTween.tween(camHUD, {y: 0}, Conductor.stepCrochet * 0.002, {ease: FlxEase.sineIn});
}