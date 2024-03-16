import flixel.addons.display.FlxBackdrop;
import flixel.group.FlxTypedGroup;

var startSwing:Bool = false;

function create(){
    speedLines = new FlxBackdrop(Paths.image('stages/ejected/speedLines'));
    speedLines.updateHitbox();
    speedLines.scrollFactor.set(1.3, 1.3);
    speedLines.alpha = 0.0001;
    speedLines.velocity.y = -9000;
}

function postCreate()
    add(speedLines);

function update(elapsed){
    for (i in [boyfriend, gf, dad]){
        i.angle = Math.sin((Conductor.songPosition / 1200) * (Conductor.bpm / 60) * -1.0) * 1.2;
        i.y = Math.sin((Conductor.songPosition / 1000) * (Conductor.bpm / 60) * 1.0) * 30;
    }

    if (startSwing){
        camHUD.y = Math.sin((Conductor.songPosition / 1000) * (Conductor.bpm / 60) * 1.0) * 15;
        camHUD.angle = Math.sin((Conductor.songPosition / 1200) * (Conductor.bpm / 60) * -1.0) * 1.2;

        speedLines.alpha = 0.3;
    }
}

function postUpdate(elapsed:Float) {
    if (startSwing){
        FlxG.camera.shake(0.0025, 0.1);
        camHUD.shake(0.00175, 0.1);
    }
}

function hudSwing(start:Bool)
    startSwing = start;