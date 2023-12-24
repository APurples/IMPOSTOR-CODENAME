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
    camGame.angle = Math.sin((Conductor.songPosition / 1200) * (Conductor.bpm / 60) * -1.0) * 1.2;
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
    defaultCamZoom = curCameraTarget==1 ? 0.75 : 0.45;

    FlxG.camera.shake(0.0025, 0.1);
    camHUD.shake(0.00175, 0.1);
}