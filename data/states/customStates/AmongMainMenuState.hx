import flixel.addons.display.FlxBackdrop;
import flixel.group.FlxTypedGroup;
import funkin.menus.ModSwitchMenu;
import funkin.editors.EditorPicker;
import flixel.text.FlxTextBorderStyle;
import flixel.effects.FlxFlicker;
import funkin.menus.MainMenuState;
import funkin.menus.credits.CreditsMain;
import funkin.options.OptionsMenu;
import funkin.backend.scripting.Script;

var portVer:Int = 0.1;

var optionShit:Array<String> = ['Story Mode', 'Freeplay', 'Gallery', 'Credits', 'Options', 'Shop', 'Innersloth'];

var menuItems:FlxTypedGroup<FlxSprite> =  new FlxTypedGroup();

var curSelected:Int = 0;

function create(){
	FlxG.mouse.visible = true;

	starFG = new FlxBackdrop(Paths.image('menus/starFG'));
	starFG.updateHitbox();
	starFG.scrollFactor.set();
	starFG.antialiasing = true;
	starFG.velocity.set(-50, 0);
	add(starFG);

	starBG = new FlxBackdrop(Paths.image('menus/starBG'), 0, 0);
	starBG.updateHitbox();
	starBG.scrollFactor.set();
	starBG.antialiasing = true;
	starBG.velocity.set(-42.5, 0);
	add(starBG);
	
	redImpostor = new FlxSprite(350, -160);
	redImpostor.frames = Paths.getSparrowAtlas('menus/menuBooba/redmenu');
	redImpostor.animation.addByPrefix('idle', 'red idle', 24, true);
	redImpostor.animation.addByPrefix('select', 'red select', 24, false);
	redImpostor.animation.play('idle');
	redImpostor.updateHitbox();
	redImpostor.scale.set(0.7, 0.7);
	redImpostor.scrollFactor.set();
	redImpostor.antialiasing = true;
	add(redImpostor);

	greenImpostor = new FlxSprite(-300, -60);
	greenImpostor.frames = Paths.getSparrowAtlas('menus/menuBooba/greenmenu');
	greenImpostor.animation.addByPrefix('idle', 'green idle', 24, true);
	greenImpostor.animation.addByPrefix('select', 'green select', 24, false);
	greenImpostor.animation.play('idle');
	greenImpostor.updateHitbox();
	greenImpostor.scale.set(0.7, 0.7);
	greenImpostor.scrollFactor.set();
	greenImpostor.antialiasing = true;
	add(greenImpostor);

	vignette = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/menuBooba/vignette'));
	vignette.updateHitbox();
	vignette.active = false;
	vignette.scrollFactor.set();
	vignette.antialiasing = true;
	add(vignette);

	logo = new FlxSprite(0, 100);
	logo.frames = Paths.getSparrowAtlas('menus/logoBumpin');
	logo.animation.addByPrefix('bump', 'logo bumpin', 24, false);
	logo.screenCenter();
	logo.updateHitbox();
	logo.scale.set(0.65, 0.65);
	logo.y -= 160;
	logo.antialiasing = true;
	add(logo);

	versionShit = new FunkinText(5, FlxG.height, 0, 'VS Impostor V4: CNE Port v' + portVer);
	versionShit.scrollFactor.set();
	versionShit.y -= versionShit.height;
	add(versionShit);

	for(i in 0...optionShit.length){
		var menuItem:FunkinSprite = new FunkinSprite(0, 130);
		if(i > 3) menuItem.frames = Paths.getSparrowAtlas('menus/menuBooba/Buttons_UI');
		else menuItem.frames = Paths.getSparrowAtlas('menus/menuBooba/Big_Buttons_UI');
		menuItem.animation.addByPrefix('idle', optionShit[i] + ' Button', 24, true);
		menuItem.animation.addByPrefix('hover', optionShit[i] + ' Select', 24, true);
		menuItem.ID = i;
		menuItems.add(menuItem);
        menuItem.scale.set(.5, .5);
		menuItem.updateHitbox();
		menuItem.antialiasing = true;

		switch(optionShit[i]){
			case "Story Mode": menuItem.setPosition(400, 475);
			case "Freeplay": menuItem.setPosition(633, 475);
			case "Credits": menuItem.setPosition(633, 580);
			case "Gallery": menuItem.setPosition(400, 580);
			case "Options": menuItem.setPosition(455, 640);
			case "Innersloth": menuItem.setPosition(725, 640);
			case "Shop": menuItem.setPosition(590, 640);
		}
	}

	add(menuItems);
}

var selectedSomethin:Bool = false;

function update(elapsed){
	if (FlxG.sound.music.volume < 0.8) FlxG.sound.music.volume += 0.5 * elapsed;

    if (FlxG.keys.justPressed.SEVEN){
		persistentUpdate = !(persistentDraw = true);
		openSubState(new EditorPicker());
	}

	if (controls.SWITCHMOD) {
		openSubState(new ModSwitchMenu());
		persistentUpdate = !(persistentDraw = true);
	}

	if (controls.BACK || FlxG.mouse.justPressedRight){
		FlxG.sound.play(Paths.sound('menu/cancel'));
		FlxG.camera.fade(FlxColor.BLACK, 0.5, false);
		new FlxTimer().start(.75, function(tmr:FlxTimer){
			FlxG.switchState(new TitleState());
		});
	}

	if (FlxG.save.data.devMode){
		if (FlxG.keys.justPressed.Q) FlxG.camera.zoom -= .1;
		if (FlxG.keys.justPressed.E) FlxG.camera.zoom += .1;
	}

	if (!selectedSomethin){
		for (i in menuItems.members) {
			updateItems();
			if (FlxG.mouse.overlaps(i) && curSelected != menuItems.members.indexOf(i)) curSelected = menuItems.members.indexOf(i);
		}

		if (FlxG.mouse.justPressed){
			if (optionShit[curSelected] == 'Innersloth') FlxG.openURL('https://www.innersloth.com/');
			else if (optionShit[curSelected] == 'Gallery') FlxG.openURL('https://vsimpostor.com/');
			else selectItem();
		}
	}
}

function selectItem(){
	selectedSomethin = true;
	FlxG.sound.play(Paths.sound('menu/confirm'));
	greenImpostor.animation.play('select');
	redImpostor.animation.play('select');

	FlxTween.tween(starFG, {y: starFG.y + 500}, 0.7, {ease: FlxEase.quadInOut});
	FlxTween.tween(starBG, {y: starBG.y + 500}, 0.7, {ease: FlxEase.quadInOut, startDelay: 0.2});
	FlxTween.tween(greenImpostor, {y: greenImpostor.y + 800}, 0.7, {ease: FlxEase.quadInOut, startDelay: 0.24});
	FlxTween.tween(redImpostor, {y: redImpostor.y + 800}, 0.7, {ease: FlxEase.quadInOut, startDelay: 0.3});
	FlxG.camera.fade(FlxColor.BLACK, 0.7, false);

	new FlxTimer().start(1, function(tmr:FlxTimer){
		switchState();
	});
}

function updateItems() {
	menuItems.forEach(function(spr:FunkinSprite) {
		spr.animation.play('idle');
		if (spr.ID == curSelected) spr.animation.play('hover');
	});
}

function changeItem(huh:Int = 0) {
	curSelected += huh;

	if (curSelected >= menuItems.length) curSelected = 0;
	if (curSelected < 0) curSelected = menuItems.length - 1;
}

function switchState() {
	var daChoice:String = optionShit[curSelected];

	switch (daChoice) {
		case 'Story Mode': FlxG.switchState(new StoryMenuState());
		case 'Freeplay': FlxG.switchState(new FreeplayState());
		case 'Credits': FlxG.switchState(new CreditsMain());
		case 'Options': FlxG.switchState(new OptionsMenu());
		case 'Shop': FlxG.switchState(new ModState('customStates/ShopState'));
	}
}

function beatHit() logo.animation.play("bump");