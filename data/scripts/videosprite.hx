//
import hxvlc.flixel.FlxVideoSprite;

public var camVideos:FlxCamera = new FlxCamera();
public var newVideo:FlxVideoSprite = new FlxVideoSprite();

function create(){
    camVideos = new FlxCamera();
    camVideos.bgColor = 0;
    camVideos.alpha = 0.0001;
    FlxG.cameras.add(camVideos);

    newVideo = new FlxVideoSprite();
    newVideo.scrollFactor.set(0, 0);
    newVideo.cameras = [camVideos];
    newVideo.load(Assets.getPath(Paths.video("ingame/" + PlayState.SONG.meta.displayName)));
    add(newVideo);
}

public function playVideo(camerasVisible:Bool = false, stepsTillEnd:Int){
    camGame.visible = camHUD.visible = camerasVisible;
    newVideo.play();

    new FlxTimer().start(0.15, function(){
        camVideos.alpha = 1;
    });

    if (curStep == stepsTillEnd)
        camVideos.visible = false;
}

function postUpdate()
    if (!paused) newVideo.resume();

function onGamePause()
    newVideo.pause();