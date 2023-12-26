importScript("data/scripts/pixel");

function postCreate() {
	if (curSong == "rivals"){
		strumLines.members[1].characters[1].x -= 20;
		strumLines.members[1].characters[1].y += 10;
		strumLines.members[1].characters[1].visible = false;
	}
}

function bfShoot(){
	strumLines.members[0].characters[0].playAnim("huh");
	strumLines.members[1].characters[1].playAnim("shoot");
	camHUD.visible = false;
	strumLines.members[1].characters[0].visible = false;
	strumLines.members[1].characters[1].visible = true;
	if (FlxG.save.data.flashingLights) camGame.flash(FlxColor.WHITE, 1);
	FlxG.sound.play(Paths.sound('tomongus_Shot'));
}