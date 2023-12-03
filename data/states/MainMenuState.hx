import flixel.addons.display.FlxBackdrop;

function create() {
	FlxG.mouse.visible = true;

	if (!FlxG.save.data.devMode) canAccessDebugMenus = false;
	else canAccessDebugMenus = true;

	starBG = new FlxBackdrop(Paths.image('menus/mainmenu/starBG'));
	starBG.updateHitbox();
	starBG.antialiasing = true;
	starBG.scrollFactor.set();
	add(starBG);

	starFG = new FlxBackdrop(Paths.image('menus/mainmenu/starFG'));
	starFG.updateHitbox();
	starFG.antialiasing = true;
	starFG.scrollFactor.set();
	add(starFG);

	greenImpostor = new FlxSprite(-300, -60);
	greenImpostor.frames = Paths.getSparrowAtlas('menus/mainmenu/greenmenu');
	greenImpostor.animation.addByPrefix('idle', 'green idle', 24, true);
	greenImpostor.animation.addByPrefix('select', 'green select', 24, false);
	greenImpostor.animation.play('idle');
	greenImpostor.antialiasing = true;
	greenImpostor.updateHitbox();
	greenImpostor.active = true;
	greenImpostor.scale.set(0.7, 0.7);
	greenImpostor.scrollFactor.set();
	add(greenImpostor);

	redImpostor = new FlxSprite(350, -160);
	redImpostor.frames = Paths.getSparrowAtlas('menus/mainmenu/redmenu');
	redImpostor.animation.addByPrefix('idle', 'red idle', 24, true);
	redImpostor.animation.addByPrefix('select', 'red select', 24, false);
	redImpostor.animation.play('idle');
	redImpostor.antialiasing = true;
	redImpostor.updateHitbox();
	redImpostor.active = true;
	redImpostor.scale.set(0.7, 0.7);
	redImpostor.scrollFactor.set();
	add(redImpostor);

	logo = new FlxSprite(0, 100);
	logo.frames = Paths.getSparrowAtlas('menus/logoBumpin');
	logo.animation.addByPrefix('bump', 'logo bumpin', 24, false);
	logo.screenCenter();
	logo.updateHitbox();
	logo.scrollFactor.set();
	logo.antialiasing = true;
	logo.scale.set(0.65, 0.65);
	logo.y -= 160;
	add(logo);

	vignette = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/mainmenu/vignette'));
	vignette.antialiasing = true;
	vignette.updateHitbox();
	vignette.active = false;
	vignette.scrollFactor.set();
	add(vignette);

	/*glowyThing = new FlxSprite(361, 438).loadGraphic(Paths.image('menus/mainmenu/buttonglow'));
	glowyThing.antialiasing = true;
	glowyThing.scale.set(0.51, 0.51);
	glowyThing.updateHitbox();
	glowyThing.active = false;
	glowyThing.scrollFactor.set();
	add(glowyThing);*/

	impostorVer = new FlxText(5, FlxG.height - 2, 2, 'VS Impostor V4 CNE Port v0.2 [ALPHA]');
	//add(impostorVer);
}

function postCreate(){
    magenta.destroy(); // fuck you magenta sprite

    for(e in state.menuItems){
        e.scale.x = e.scale.y = 0.425;
        e.scrollFactor.set();
        e.updateHitbox();
        e.animation.play(e.animation.curAnim.name, true);
    }

	// prevents the bg froming moving around when using arrow keys
    FlxG.camera.followLerp = 0;
}

function update(){
	// moves the stars to the left
	starFG.x -= 0.06;
	starBG.x -= 0.03;

	if (controls.BACK || FlxG.mouse.justPressedRight) FlxG.switchState(new TitleState());

	if (controls.ACCEPT || FlxG.mouse.justPressed){
		selectItem();
		transition();
	}
}

function postUpdate(){
    state.menuItems.members[0].offset.set(125, -275); // story mode
    state.menuItems.members[1].offset.set(125, -210); // freeplay
    state.menuItems.members[2].offset.set(125, -155); // donate/credits
	state.menuItems.members[3].offset.set(55, -50); // settings

    FlxG.camera.scroll.x = FlxG.camera.scroll.y = 0;
    FlxG.camera.scroll.set();
}

function beatHit() logo.animation.play('bump');

function transition(){
	redImpostor.animation.play('select');
	greenImpostor.animation.play('select');

	FlxTween.tween(starFG, {y: starFG.y + 500}, 0.7, {ease: FlxEase.quadInOut});
	FlxTween.tween(starBG, {y: starBG.y + 500}, 0.7, {ease: FlxEase.quadInOut, startDelay: 0.2});
	FlxTween.tween(greenImpostor, {y: greenImpostor.y + 800}, 0.7, {ease: FlxEase.quadInOut, startDelay: 0.24});
	FlxTween.tween(redImpostor, {y: redImpostor.y + 800}, 0.7, {ease: FlxEase.quadInOut, startDelay: 0.3});
	FlxG.camera.fade(FlxColor.BLACK, 0.7, false);
}