import flixel.addons.display.FlxBackdrop;
//import openfl.display.BlendMode;

var swing:Bool = false;
var bopping:Bool = false;
var chaseCamPos:Bool = false;
var buildUpCamPos:Bool = false;
var focusOnBf:Bool = false;

camGame.alpha = 0;
camHUD.alpha = 0;
isStoryMode = true;

function create() {
	lightoverlayDK = new FlxSprite(0, 0).loadGraphic(Paths.image('stages/cargo bay/scvavd'));
	lightoverlayDK.antialiasing = true;
	lightoverlayDK.scrollFactor.set(1, 1);
	lightoverlayDK.active = false;
	//lightoverlayDK.blend = ADD;
	lightoverlayDK.alpha = 0.51;
	if (!Options.lowMemoryMode){
		add(lightoverlayDK);
	}

	mainoverlayDK = new FlxSprite(-100, 0).loadGraphic(Paths.image('stages/cargo bay/overlay ass dk'));
	mainoverlayDK.antialiasing = true;
	mainoverlayDK.scrollFactor.set(1, 1);
	mainoverlayDK.active = false;
	//mainoverlayDK.blend == ADD;
	mainoverlayDK.alpha = 0.6;
	if (!Options.lowMemoryMode){
		add(mainoverlayDK);
	}

	defeatDKoverlay = new FlxSprite(900, 350).loadGraphic(Paths.image('stages/cargo bay/iluminao omaga'));
	defeatDKoverlay.antialiasing = true;
	defeatDKoverlay.scrollFactor.set(1, 1);
	defeatDKoverlay.active = false;
	//defeatDKoverlay.blend = ADD;
	defeatDKoverlay.alpha = 0;
	if (!Options.lowMemoryMode){
		add(defeatDKoverlay);
	}

	flashback = new FlxSprite(1805, 800).loadGraphic(Paths.image('stages/cargo bay/airshipFlashback'));
	flashback.alpha = 0;
	flashback.scale.x = flashback.scale.y = 1.5;
	insert(members.indexOf(dad), flashback);

	hall = new FlxBackdrop(Paths.image('stages/cargo bay/chase'));
	hall.y -= 225;
	hall.velocity.x -= 1500; // moves the hall to the left
	hall.scale.x = hall.scale.y = .75;
	hall.alpha = 0;
	hall.moves = true;
	hall.active = true;
	insert(members.indexOf(dad), hall);

	defeat = new FlxSprite(1200, 50);
	defeat.frames = Paths.getSparrowAtlas('stages/cargo bay/defeat');
	defeat.animation.addByPrefix('bop', 'defeat', 24, false);
	defeat.antialiasing = true;
	defeat.alpha = 0;
	insert(members.indexOf(dad), defeat);

	cargo = new FlxSprite(50, 50).loadGraphic(Paths.image('stages/cargo bay/cargo'));
	cargo.alpha = 0;
	insert(members.indexOf(dad), cargo);
}

function update(elapsed) {
	if (swing) {
		camHUD.angle = Math.sin((Conductor.songPosition / 500) * (Conductor.bpm / 60) * 1.0);
	}

	if (focusOnBf){
        switch(strumLines.members[curCameraTarget].characters[0].getAnimName()){
			case "singLEFT": camGame.angle = (lerp(camGame.angle, -1, 0.35));
			case "idle", "singDOWN", "singUP": camGame.angle = (lerp(camGame.angle, 0, 0.35));
			case "singRIGHT": camGame.angle = (lerp(camGame.angle, 1, 0.35));
		}
	}

	if (PlayState.opponentMode) {
		comboGroup.x = 2050;
	}

	if (PlayState.coopMode) {
		comboGroup.x = 2250;
	}
}

function postCreate() {
	/* lmfao */ strumLines.members[0].characters[1].visible = strumLines.members[0].characters[2].visible = strumLines.members[1].characters[1].visible = strumLines.members[1].characters[2].visible = false;
	strumLines.members[0].characters[1].x -= 173;
	strumLines.members[0].characters[1].y += 60;
	strumLines.members[2].characters[0].y += 25;
	strumLines.members[0].characters[2].x = strumLines.members[0].characters[1].x + 15;
	strumLines.members[0].characters[2].y = strumLines.members[0].characters[1].y - 60;
	strumLines.members[1].characters[1].x = strumLines.members[1].characters[2].x - 147.25;
	strumLines.members[1].characters[1].y = strumLines.members[1].characters[2].y + 95;

	for (e in [iconP1, iconP2, healthBar, healthBarBG, scoreTxt, missesTxt, accuracyTxt, hudTxt]) e.alpha = 0;
}

function postUpdate() {
	// cpuStrums.forEach(function(strums) strums.alpha = 0);
	// cpuStrums.notes.forEach(function(notes) notes.alpha = 0.25);

	if (focusOnBf) {
		camFollow.x += 175;
		camFollow.y += 50;
	}

	if (buildUpCamPos) {
		camFollow.x -= 275;
		camFollow.y -= 50;
	}

	if (chaseCamPos) {
		camFollow.x += 400;
		camFollow.y -= 25;
	}
}

function onSongStart() {
	FlxTween.tween(camGame, {zoom: 1.1}, 1.25, {ease: FlxEase.circIn});
}

function measureHit() {
	defeat.animation.play("bop");
}

function beatHit() {
	if (swing) {
		camGame.zoom += 0.045;
		camHUD.zoom += 0.06;
		camZoomingStrength = 0;
	}

	if (bopping) {
		camGame.zoom += 0.015;
		camHUD.zoom += 0.03;
		camZoomingStrength = 0;
	}
}

function stepHit() {
	if (curSong == "double kill vtwo") {
		switch (curStep) {
			case 4:
				FlxTween.tween(camGame, {alpha: 1}, 1.75);
			case 16:
				defaultCamZoom = 1;
				camGame.alpha = 1;
				camHUD.alpha = 1;
				if (FlxG.save.data.flashingLights) {
					camHUD.flash(0xFFFFFF, 1);
				}
			case 272:
				FlxG.camera.followLerp = 0.08;
				cargo.alpha = 1;
				scrollSpeed = 3.3;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .75);
				}
			case 398:
				FlxTween.tween(camGame, {zoom: 1.2}, .35);
			case 400:
				FlxG.camera.followLerp = 0.05;
				FlxTween.tween(camGame, {alpha: 0}, .275);
			case 404:
				FlxG.camera.followLerp = 0.08;
				camGame.alpha = 1;
				scrollSpeed = 3.1;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .5);
				}
			case 520:
				camGame.angle = 1;
				camHUD.angle = 1;
			case 522:
				camGame.angle = -1;
				camHUD.angle = -1;
			case 524:
				camGame.angle = 1;
				camHUD.angle = 1;
				FlxTween.tween(camGame, {alpha: 0}, .275);
				FlxTween.tween(camHUD, {alpha: 0}, .275);
			case 526:
				camGame.angle = -1;
				camHUD.angle = -1;
			case 528:
				camGame.alpha = 1;
				camHUD.alpha = 1;
				camGame.angle = 0;
				camHUD.angle = 0;
				FlxG.camera.followLerp = 0.04;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .5);
				}
			case 656:
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .5);
				}
			case 776:
				camGame.angle = 1;
				camHUD.angle = 1;
			case 778:
				camGame.angle = -1;
				camHUD.angle = -1;
			case 780:
				camGame.angle = 1;
				camHUD.angle = 1;
			case 782:
				camGame.angle = -1;
				camHUD.angle = -1;
			case 784:
				FlxG.camera.followLerp = 0.06;
				camGame.angle = 0;
				camHUD.angle = 0;
			case 1040:
				FlxG.camera.followLerp = 0.08;
				scrollSpeed = 3.3;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .5);
				}
			case 1296:
				scrollSpeed = 3.1;
				FlxG.camera.followLerp = 0.06;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .5);
				}
			case 1456:
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .5);
				}
			case 1552:
				FlxG.camera.followLerp = 0.04;
				scrollSpeed = 2.6;
				cargo.alpha = 0;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .5);
				}
			case 1788:
				FlxTween.tween(camGame, {zoom: 1.2}, 1.6, {ease: FlxEase.circIn});
			case 1936:
				FlxTween.tween(flashback, {alpha: .5}, 8.5);
				FlxTween.tween(mainoverlayDK, {alpha: 0}, 8.5);
				FlxTween.tween(lightoverlayDK, {alpha: 0}, 8.5);
			case 2082:
				FlxTween.tween(camHUD, {alpha: 1}, 1);
			case 2096:
				FlxG.camera.followLerp = 0.08;
				scrollSpeed = 3.15;
				boyfriend.alpha = 1;
				dad.alpha = 1;
				gf.alpha = 1;
				cargo.alpha = 1;
				mainoverlayDK.alpha = 0.6;
				lightoverlayDK.alpha = 0.51;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .5);
				}
			case 2216:
				cpuStrums.forEach(function(strum:StrumNote) {
					FlxTween.tween(strum, {alpha: 1}, .5);
				});
				if (!FlxG.save.data.middlescroll)
					for (i in playerStrums.members)
						FlxTween.tween(i, {x: i.x + 320}, .75, {ease: FlxEase.smootherStepInOut});
			case 2624:
				FlxG.camera.followLerp = 0.06;
			case 2640:
				FlxG.camera.followLerp = 69420; // OVER NINE THOUSAND!!
			case 2641:
				FlxG.camera.followLerp = 0.06;
			case 2672:
				FlxG.camera.followLerp = 69420;
			case 2673:
				FlxG.camera.followLerp = 0.06;
			case 2880:
				FlxG.camera.followLerp = 0.08;
				scrollSpeed = 3.3;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .5);
				}
			case 3128:
				FlxTween.tween(camGame, {alpha: 0}, .45);
				FlxTween.tween(camHUD, {alpha: 0}, .45);
				FlxTween.tween(camGame, {zoom: 1.2}, .45);
			case 3328:
				buildUpCamPos = true;
				FlxTween.tween(camGame, {zoom: 0.725}, 10);
			case 3392:
				buildUpCamPos = false;
				camZoomingStrength = 1;
				camGame.alpha = 0;
				camHUD.alpha = 0;
				defeatDKoverlay.alpha = 0;
				mainoverlayDK.alpha = 0;
				lightoverlayDK.alpha = 0;
			case 3402:
				if (PlayState.coopMode || PlayState.opponentMode) {
					FlxTween.tween(camHUD, {alpha: 1}, 1);
				}
			case 3408:
				scrollSpeed = 3.5;
				camGame.alpha = 1;
				camHUD.alpha = 1;
			case 3536:
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .5);
				}
			case 3664:
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .5);
				}
			case 3792:
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .5);
				}
			case 3920:
				end1.alpha = 1;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .35);
				}
			case 3926:
				end2.alpha = 1;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .35);
				}
			case 3932:
				end3.alpha = 1;
				camHUD.alpha = 0;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .35);
				}
			case 3952:
				end4.alpha = 1;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .35);
				}
			case 3958:
				end5.alpha = 1;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .35);
				}
			case 3964:
				end6.alpha = 1;
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, .35);
				}
			case 3976:
				playVid("end");
				if (FlxG.save.data.flashingLights) {
					camGame.flash(0xFFFFFF, 2);
				}
		}
	}
}

// hscript call stuff

function boppingShit() {
	bopping = true;
	camZoomingStrength = 0;
}

function stopBoppingShit() {
	bopping = false;
	camZoomingStrength = 1;
}

function focusOnBf() {
	focusOnBf = true;
	scrollSpeed = 2.9;
	camZoomingStrength = 2;
	dad.alpha = 0;
	gf.alpha = 0;
	if (FlxG.save.data.flashingLights) {
		camGame.flash(0xFFFFFF, .5);
	}
	cpuStrums.forEach(function(strum:StrumNote) {
		FlxTween.tween(strum, {alpha: 0}, 1);
	});
	if (!FlxG.save.data.middlescroll)
		for (i in playerStrums.members)
			FlxTween.tween(i, {x: i.x - 320}, 1, {ease: FlxEase.smootherStepInOut});
}

function unfocusOnBf() {
	focusOnBf = false;
	camZoomingStrength = 1;
	camGame.angle = 0;
	boyfriend.alpha = 0;
	flashback.alpha = 0;
	camHUD.alpha = 0;
}

function healthFade() {
	for(e in [iconP1, iconP2, healthBar, healthBarBG, scoreTxt, missesTxt, accuracyTxt, hudTxt]){
		FlxTween.tween(e, {alpha: 0}, .35);
	}
	trace("healthbar faded");
}

function healthFadeBack() {
	for(e in [iconP1, iconP2, healthBar, healthBarBG, scoreTxt, missesTxt, accuracyTxt, hudTxt]){
		FlxTween.tween(e, {alpha: 1}, .35);
	}
	trace("healthbar unfaded");
}

function tweenAngle1(){
	FlxTween.tween(camGame, {angle: -1}, .35, {ease: FlxEase.quartOut});
}

function tweenAngle2(){
	FlxTween.tween(camGame, {angle: 1}, .35, {ease: FlxEase.quartOut});
}

function tweenAngleBack(){
	FlxTween.tween(camGame, {angle: 0}, .35, {ease: FlxEase.quartOut});
}

function defeatReference(){
	strumLines.members[2].characters[0].visible = false;
	FlxG.camera.followLerp = 0.04;
	scrollSpeed = 2.6;
	camGame.alpha = 1;
	camHUD.alpha = 1;
	defeat.alpha = 1;
	defeatDKoverlay.alpha = 1;
	camZoomingStrength = 2.5;
	remove(cargo);
	if (FlxG.save.data.flashingLights) {
		camGame.flash(0xFFFFFF, 2);
	}
}

function chaseTime() {
	chaseCamPos = true;
	swing = true;
	defeat.alpha = 0;
	strumLines.members[0].characters[0].visible = false;
	strumLines.members[1].characters[0].visible = false;
	if (FlxG.save.data.flashingLights) {
		camGame.flash(0xFFFFFF, .5);
	}
	trace("i can feel black coming inside of me at this part");
}

function chaseDrop() {
	camMoveOffset = 32;
	chaseCamPos = false;
	scrollSpeed = 3.575;
	hall.velocity.x -= 250;
	trace("gyat damn black :fire: :fire:"); // 🔥🔥
}

function noMoreChaseDrop() {
	camMoveOffset = 24;
	scrollSpeed = 3.5;
	chaseCamPos = true;
	hall.velocity.x += 250;
}

function chaseTime2() {
	strumLines.members[0].characters[1].visible = true;
	strumLines.members[0].characters[2].visible = true;
	strumLines.members[1].characters[1].visible = true;
	strumLines.members[1].characters[2].visible = true;
	hall.alpha = 1;
}

function stopChaseTime() {
	swing = false;
	camHUD.angle = 0;
}