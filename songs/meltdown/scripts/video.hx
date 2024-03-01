import funkin.game.cutscenes.VideoCutscene;

var newVideo:FlxVideo = null;

function postCreate(){
    newVideo = new VideoCutscene(Paths.video('midsong/meltdown'), function() {
        newVideo.skippable = false;
        canPause = false;
        persistentUpdate = false;
        persistentDraw = false;
	});
}

function stepHit()
    if (curStep == 1152){
        openSubState(newVideo);
        camGame.visible = camHUD.visible = false;
    }