function create(){
    saxguy = new FlxSprite(-300, 200);
	saxguy.frames = Paths.getSparrowAtlas('stages/toogus/cyan_toogus');
	saxguy.animation.addByPrefix('POP OFF CYAN', 'Cyan Dancy', 24, true);
	saxguy.antialiasing = true;
	saxguy.scrollFactor.set(1, 1);
    saxguy.alpha = 0;
    add(saxguy);
}

function onSongStart(){
	if (curSong == "sussus toogus") FlxTween.tween(camHUD, {alpha: 0}, .75);
}

function stepHit(){
	if (curSong == "sussus toogus"){
		switch(curStep){
			case 112:
				dad.playAnim("left", true);
			case 116:
				dad.playAnim("right", true);
			case 120:
				dad.playAnim("left", true);
			case 124:
				dad.playAnim("right", true);
				if (PlayState.opponentMode || PlayState.coopMode) FlxTween.tween(camHUD, {alpha: 1}, .75);
			case 128:
				FlxTween.tween(camHUD, {alpha: 1}, .75);
			case 896:
				FlxTween.tween(camHUD, {alpha: 0}, .75);
				saxguy.animation.play("POP OFF CYAN");
				saxguy.alpha = 1;
				dad.playAnim("notice", true);
			case 1016:
				if (PlayState.opponentMode || PlayState.coopMode) FlxTween.tween(camHUD, {alpha: 1}, .75);
			case 1024:
				FlxTween.tween(camHUD, {alpha: 1}, .75);
		}

		if (curStep > 623 && curStep < 637){
			if (curStep % 4 == 0){
				camGame.zoom += 0.03;
				camHUD.zoom += 0.045;
			}
		}
		if (curStep > 637 && curStep < 640){
			if (curStep % 1 == 0){
				camGame.zoom += 0.03;
				camHUD.zoom += 0.045;
			}
		}
		if (curStep > 1327 && curStep < 1341){
			if (curStep % 4 == 0){
				camGame.zoom += 0.03;
				camHUD.zoom += 0.045;
			}
		}
	}
}