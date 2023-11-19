import openfl.Lib;

var flashTime:Bool = false;

function create(){
    window.title = "Vs Impostor: V4";
    Lib.application.window.move(Std.int(325),Std.int(175));
}

function update(){
    FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, 0.95); // every time the camera gets zoomed it lerps back to the original zoom
}

function beatHit(){
    switch (curBeat){
        case 1:
            flashTime = false;
        case 8:
            FlxG.camera.zoom += 0.045;
            if (FlxG.save.data.flashingLights){
                FlxG.camera.flash(0x86FF0000, .35);
            }
        case 14:
            FlxG.camera.zoom += 0.045;
            if (FlxG.save.data.flashingLights){
                FlxG.camera.flash(0x86FF0000, .35);
            }
        case 15:
            FlxG.camera.zoom += 0.045;
            if (FlxG.save.data.flashingLights){
                FlxG.camera.flash(0x86FF0000, .35);
            }
        case 16:
            flashTime = true;
    }
}

function measureHit(){
    if (flashTime){
        if (curMeasure % 4 == 0){
            FlxG.camera.zoom += 0.045;
            if (FlxG.save.data.flashingLights){
                FlxG.camera.flash(0x86FF0000, .35);
            }
        }
    }
}