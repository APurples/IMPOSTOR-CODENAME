/*
	todo:
	- add in unused crewmates walking in bg
*/

var blueNotDead:Bool = true;
var orangeNotDead:Bool = true;
var whiteNotDead:Bool = true;

function create(){
	bg = new FlxSprite(-1750, 50).loadGraphic(Paths.image('stages/toogus/mirabg'));
	bg.setGraphicSize(Std.int(bg.width * 1.06));
	insert(members.indexOf(gf), bg);

	fg = new FlxSprite(-1750, 50).loadGraphic(Paths.image('stages/toogus/mirafg'));
	fg.setGraphicSize(Std.int(fg.width * 1.06));
	insert(members.indexOf(gf), fg);

	if (curSong == "lights down"){
		toogusblue = new FlxSprite(1200, 250);
		toogusblue.frames = Paths.getSparrowAtlas('stages/toogus/mirascaredmates');
		toogusblue.animation.addByPrefix('bop', 'blue', 24, false);
		toogusblue.animation.addByPrefix('bop2', '1body', 24, false);
		toogusblue.setGraphicSize(Std.int(toogusblue.width * 0.7));
		toogusblue.active = true;
		toogusblue.antialiasing = true;
		toogusblue.flipX = true;
		insert(members.indexOf(gf), toogusblue);

		toogusorange = new FlxSprite(-300, 250);
		toogusorange.frames = Paths.getSparrowAtlas('stages/toogus/mirascaredmates');
		toogusorange.animation.addByPrefix('bop', 'orange', 24, false);
		toogusorange.animation.addByPrefix('bop2', '2body', 24, false);
		toogusorange.setGraphicSize(Std.int(toogusorange.width * 0.7));
		toogusorange.active = true;
		toogusorange.antialiasing = true;
		insert(members.indexOf(gf), toogusorange);

		tooguswhite = new FlxSprite(1350, 200);
		tooguswhite.frames = Paths.getSparrowAtlas('stages/toogus/mirascaredmates');
		tooguswhite.animation.addByPrefix('bop', 'white', 24, false);
		tooguswhite.animation.addByPrefix('bop2', '3body', 24, false);
		tooguswhite.setGraphicSize(Std.int(tooguswhite.width * 0.9));
		tooguswhite.active = true;
		tooguswhite.antialiasing = true;
		tooguswhite.flipX = true;
		insert(members.indexOf(gf), tooguswhite);

		bfvent = new FlxSprite(70, 200);
		bfvent.frames = Paths.getSparrowAtlas('stages/toogus/bf_mira_vent');
		bfvent.animation.addByPrefix('vent', 'bf vent', 24, false);
		bfvent.scrollFactor.set(1, 1);
		bfvent.active = true;
		bfvent.antialiasing = true;
		bfvent.alpha = 0.001;
		insert(members.indexOf(gf), bfvent);
	}

	table = new FlxSprite(-1600, 50).loadGraphic(Paths.image('stages/toogus/table_bg'));
	table.setGraphicSize(Std.int(table.width * 1.06));
	insert(members.indexOf(gf), table);

    saxguy = new FlxSprite(-550, 275);
	saxguy.frames = Paths.getSparrowAtlas('stages/toogus/cyan_toogus');
	saxguy.animation.addByPrefix('POP OFF CYAN', 'Cyan Dancy', 24, true);
	saxguy.antialiasing = true;
	saxguy.scrollFactor.set(1, 1);
    saxguy.alpha = 0;
    add(saxguy);
}

function postCreate(){
	if (curSong == "lights down"){
		strumLines.members[0].characters[1].x = strumLines.members[0].characters[0].x;
		strumLines.members[0].characters[1].y = strumLines.members[0].characters[0].y;
		strumLines.members[0].characters[1].visible = false;
		strumLines.members[1].characters[1].visible = false;
	}
}

function update(){
	if (blueNotDead == false){
		toogusblue.setPosition(1150, 400);
	}
	if (orangeNotDead == false){
		toogusorange.setPosition(-350, 400);
	}
	if (whiteNotDead == false){
		tooguswhite.setPosition(1300, 400);
	}
}

function onSongStart(){
	if (curSong == "sussus toogus") FlxTween.tween(camHUD, {alpha: 0}, .75);
}

function beatHit(){
	if (curBeat % 2 == 0){
		if (blueNotDead){
			toogusblue.animation.play('bop');
		}else if (blueNotDead == false){
			toogusblue.animation.play("bop2");
		}
		if (orangeNotDead){
			toogusorange.animation.play('bop');
		}else if (orangeNotDead == false){
			toogusorange.animation.play("bop2");
		}
		if (whiteNotDead){
			tooguswhite.animation.play('bop');
		}else if (whiteNotDead == false){
			tooguswhite.animation.play("bop2");
		}
	}
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
			case 897:
				dad.playAnim("notice");
			case 908:
				dad.playAnim("wave");
			case 924:
				dad.playAnim("unwave");
			case 928:
				dad.playAnim("stare");
			case 1016:
				if (PlayState.opponentMode || PlayState.coopMode) FlxTween.tween(camHUD, {alpha: 1}, .75);
			case 1024:
				FlxTween.tween(camHUD, {alpha: 1}, .75);
		}
	}else if (curSong == "lights down"){
		switch (curStep){
			case 512:
				blueNotDead = false;
			case 832:
				orangeNotDead = false;
		}
	}
}

/*
	HSCRIPT CALL STUFF
*/	

// sussus toogus

function POPOFFCYAN(){
	FlxTween.tween(camHUD, {alpha: 0}, .75);
	saxguy.animation.play("POP OFF CYAN");
	saxguy.alpha = 1;
	saxguy.velocity.x = 125;
}

// lights down

function lightsout(){
	if (FlxG.save.data.flashingLights){
		camGame.flash(FlxColor.WHITE, 0.35);
	}
	gf.alpha = 0;
	bg.alpha = 0;
	fg.alpha = 0;
	table.alpha = 0;
	toogusblue.alpha = 0;
	tooguswhite.alpha = 0;
	toogusorange.alpha = 0;
	strumLines.members[0].characters[1].visible = true;
	strumLines.members[0].characters[0].visible = false;
	strumLines.members[1].characters[0].visible = false;
	strumLines.members[1].characters[1].visible = true;
	healthBar.createFilledBar(FlxColor.BLACK, FlxColor.WHITE);
}

function lightson(){
	if (FlxG.save.data.flashingLights){
		camGame.flash(FlxColor.BLACK, 0.35);
	}
	gf.alpha = 1;
	bg.alpha = 1;
	fg.alpha = 1;
	table.alpha = 1;
	toogusblue.alpha = 1;
	tooguswhite.alpha = 1;
	toogusorange.alpha = 1;
	strumLines.members[0].characters[0].visible = true;
	strumLines.members[0].characters[1].visible = false;
	strumLines.members[1].characters[0].visible = true;
	strumLines.members[1].characters[1].visible = false;
	healthBar.createFilledBar(0xFF1F6B2B,0xFF31B0D1);
}
function lightsoutquick(){
	if (FlxG.save.data.flashingLights){
		camGame.flash(FlxColor.WHITE, 0.15);
	}
	gf.alpha = 0;
	bg.alpha = 0;
	fg.alpha = 0;
	table.alpha = 0;
	toogusblue.alpha = 0;
	tooguswhite.alpha = 0;
	toogusorange.alpha = 0;
	strumLines.members[0].characters[1].visible = true;
	strumLines.members[0].characters[0].visible = false;
	strumLines.members[1].characters[0].visible = false;
}

function lightsonquick(){
	if (FlxG.save.data.flashingLights){
		camGame.flash(FlxColor.BLACK, 0.15);
	}
	gf.alpha = 1;
	bg.alpha = 1;
	fg.alpha = 1;
	table.alpha = 1;
	toogusblue.alpha = 1;
	tooguswhite.alpha = 1;
	toogusorange.alpha = 1;
	strumLines.members[0].characters[0].visible = true;
	strumLines.members[0].characters[1].visible = false;
}

function ending(){
	dad.playAnim("bwomp");
}

function blackout(){
	camGame.alpha = 0;
	camHUD.alpha = 0;
}