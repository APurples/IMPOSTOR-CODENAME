import funkin.game.cutscenes.VideoCutscene;
import flixel.addons.display.FlxBackdrop;
import flixel.group.FlxTypedGroup;

for (i in [camGame, camHUD]) i.visible = false;

function create(){
    speedLines = new FlxBackdrop(Paths.image('stages/ejected/speedLines'));
    speedLines.updateHitbox();
    speedLines.scrollFactor.set(1.3, 1.3);
    speedLines.alpha = 0.3;
    speedLines.velocity.y = -9000;
}

function postCreate(){
    ejectedShit = new VideoCutscene(Paths.video('midsong/ejected'), function() {
	});
    persistentUpdate = false;
    ejectedShit.skippable = false;
    canPause = false;
    persistentDraw = false;

    add(speedLines);
}

function update(elapsed){
    //FlxTween.tween(trail, {y: boyfriend.y + 750}, .5, {ease: FlxEase.cubeOut});
    for (i in [boyfriend, gf, dad]){
        i.angle = Math.sin((Conductor.songPosition / 1200) * (Conductor.bpm / 60) * -1.0) * 1.2;
        i.y = Math.sin((Conductor.songPosition / 1000) * (Conductor.bpm / 60) * 1.0) * 30;
    }
    camHUD.y = Math.sin((Conductor.songPosition / 1000) * (Conductor.bpm / 60) * 1.0) * 15;
    camHUD.angle = Math.sin((Conductor.songPosition / 1200) * (Conductor.bpm / 60) * -1.0) * 1.2;
}

function startVideo() openSubState(ejectedShit);

function stopVid(){
    canPause = true;
    persistentUpdate = true;
    persistentDraw = true;
    for (i in [camGame, camHUD]) i.visible = true;
}


function postUpdate(elapsed:Float) {
    FlxG.camera.shake(0.0025, 0.1);
    camHUD.shake(0.00175, 0.1);
}