var flashTime:Bool = false;

function create(){
    window.title = "Vs Impostor: V4 Codename Engine Port";
}

function beatHit(){
    switch (curBeat){
        case 1: flashTime = false;
        case 8: flash();
        case 14: flash();
        case 15: flash();
        case 16: flashTime = true;
    }
}

function flash(){
    if (FlxG.save.data.flashingLights) FlxG.camera.flash(0x86FF0000, .35);
    FlxG.camera.zoom += 0.045;
    FlxTween.tween(FlxG.camera, {zoom: 1}, .35, {ease: FlxEase.expoOut});
}

function measureHit(){
    if (flashTime){
        if (curMeasure % 4 == 0) flash();
    }
}