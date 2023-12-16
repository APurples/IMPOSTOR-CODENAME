import funkin.game.cutscenes.VideoCutscene;

var ejectedShit:VideoCutscene;

for (i in [camGame, camHUD]) i.alpha = 0;

function postCreate(){
    ejectedShit = new VideoCutscene(Paths.video('midsong/ejected'), function() {
	});
}

function startVideo(){
    persistentUpdate = false;
    ejectedShit.skippable = false;
    canPause = false;
    openSubState(ejectedShit);
    persistentDraw = false;
}

function stopVid(){
    canPause = true;
    persistentUpdate = true;
    persistentDraw = true;
    for (i in [camGame, camHUD]) i.alpha = 1;
}