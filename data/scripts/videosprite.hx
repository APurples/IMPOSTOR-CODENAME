//
import hxvlc.flixel.FlxVideoSprite;

public var camVideos:FlxCamera = new FlxCamera();
public var newVideo:FlxVideoSprite = new FlxVideoSprite();

function create(){
    camVideos = new FlxCamera();
    camVideos.bgColor = 0;
    FlxG.cameras.add(camVideos, false);

    newVideo = new FlxVideoSprite();
    newVideo.scrollFactor.set(0, 0);
    newVideo.cameras = [camVideos];
    newVideo.load(Assets.getPath(Paths.video("ingame/" + PlayState.SONG.meta.displayName)));
    add(newVideo);
}

public function playVideo(camerasVisible:Bool = false, stepsTillEnd:Int = null){
    camGame.visible = camHUD.visible = camerasVisible;
    newVideo.play();

    if (stepsTillEnd != null) new FlxTimer().start(Conductor.stepCrochet * stepsTillEnd / 1000, function(){
        camVideos.visible = false;
        camGame.visible = camHUD.visible = true;
    });
}

function postUpdate()
    if (!paused) newVideo.resume();

function onGamePause()
    newVideo.pause();