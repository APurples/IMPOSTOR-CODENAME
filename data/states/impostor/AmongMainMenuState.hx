import flixel.addons.display.FlxBackdrop;
import flixel.group.FlxTypedGroup;
import funkin.menus.ModSwitchMenu;
import funkin.editors.EditorPicker;
import flixel.text.FlxTextBorderStyle;
import funkin.menus.MainMenuState;
import funkin.menus.credits.CreditsMain;
import funkin.options.OptionsMenu;
import funkin.backend.scripting.Script;
import openfl.ui.Mouse;

var portVer:Int = 0.1;

var optionShit:Array<String> = ['Story Mode', 'Freeplay', 'Gallery', 'Credits', 'Options', 'Shop', 'Innersloth'];
var menuItems:FlxTypedGroup<FlxSprite> = new FlxTypedGroup();

var confirm, cancel, locked:FlxSound;

var shopTxtTween, shakeTweenX, shakeTweenY, shakeTweenAngle:FlxTween;

var curSelected:Int = 0;

function create(){
	CoolUtil.playMenuSong();
	Script.staticVariables.set('skipTitleIntro', true);
	FlxG.mouse.visible = true;

	// loads sounds in for no lag when selecting something
	confirm = FlxG.sound.load(Paths.sound('menu/confirm'));
	cancel = FlxG.sound.load(Paths.sound('menu/cancel'));
	locked = FlxG.sound.load(Paths.sound('menu/locked'));

	starFG = new FlxBackdrop(Paths.image('menus/starFG'));
	starFG.scrollFactor.set();
	starFG.antialiasing = Options.antialiasing;
	starFG.velocity.set(-50, 0);
	add(starFG);

	starBG = new FlxBackdrop(Paths.image('menus/starBG'), 0, 0);
	starBG.scrollFactor.set();
	starBG.antialiasing = Options.antialiasing;
	starBG.velocity.set(-42.5, 0);
	add(starBG);
	
	redImpostor = new FlxSprite(350, -160);
	redImpostor.frames = Paths.getSparrowAtlas('menus/menuBooba/redmenu');
	redImpostor.animation.addByPrefix('idle', 'red idle', 24, true);
	redImpostor.animation.addByPrefix('select', 'red select', 24, false);
	redImpostor.animation.play('idle');
	redImpostor.scale.set(0.7, 0.7);
	redImpostor.antialiasing = Options.antialiasing;
	add(redImpostor);

	greenImpostor = new FlxSprite(-300, -60);
	greenImpostor.frames = Paths.getSparrowAtlas('menus/menuBooba/greenmenu');
	greenImpostor.animation.addByPrefix('idle', 'green idle', 24, true);
	greenImpostor.animation.addByPrefix('select', 'green select', 24, false);
	greenImpostor.animation.play('idle');
	greenImpostor.scale.set(0.7, 0.7);
	greenImpostor.antialiasing = Options.antialiasing;
	add(greenImpostor);

	vignette = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/menuBooba/vignette'));
	vignette.antialiasing = Options.antialiasing;
	add(vignette);

	logo = new FlxSprite(0, 100);
	logo.frames = Paths.getSparrowAtlas('menus/logoBumpin');
	logo.animation.addByPrefix('bump', 'logo bumpin', 24, false);
	logo.screenCenter();
	logo.scale.set(0.65, 0.65);
	logo.y -= 160;
	logo.antialiasing = Options.antialiasing;
	add(logo);

	tabShit = new FunkinText(5, FlxG.height, 0, 'Press TAB to open up the mods menu');
	tabShit.y -= tabShit.height;
	add(tabShit);

	versionShit = new FunkinText(5, FlxG.height, 0, 'VS Impostor V4.1.0: CNE Port v' + portVer);
	versionShit.y -= versionShit.height + 22;
	add(versionShit);

	shopTxt = new FunkinText(5, 425, 0, 'Shop is currently in the works! Check back here whenever another demo comes out.');
	shopTxt.screenCenter(FlxAxes.X);
	shopTxt.scale.set(0, 0);
	shopTxt.color = FlxColor.RED;
	add(shopTxt);

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
			case "Story Mode":
				menuItem.setPosition(400, 475);
			case "Freeplay":
				menuItem.setPosition(633, 475);
			case "Credits":
				menuItem.setPosition(633, 580);
			case "Gallery":
				menuItem.setPosition(400, 580);
			case "Options":
				menuItem.setPosition(455, 640);
			case "Innersloth":
				menuItem.setPosition(725, 640);
			case "Shop":
				menuItem.setPosition(590, 640);
		}
	}

	add(menuItems);

	updateItems();
}

var selectedSomethin:Bool = false;
var cursor:String = null;
function update(elapsed){
	cursor = null;
	
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
		cancel.play();
		FlxG.camera.fade(FlxColor.BLACK, 0.5, false);
		new FlxTimer().start(.75, function(tmr:FlxTimer){
			FlxG.switchState(new TitleState());
		});
	}

	if (!selectedSomethin){
		for (i in menuItems.members){
			if (FlxG.mouse.overlaps(i)){
				cursor = "button";

				curSelected = menuItems.members.indexOf(i);
				updateItems();

				if (FlxG.mouse.justPressed)
					selectItem();
			}else
				i.animation.play("idle", true);
		}
	}

	Mouse.cursor = cursor ?? "arrow";
}

function selectItem(){
	var option = optionShit[curSelected];
	if (option == "Innersloth") FlxG.openURL('https://www.innersloth.com/');
	else if (option == "Shop"){
		locked.play();

		// my own custom shake thingy :)
		if (FlxG.save.data.screenShake){
			shakeTweenX = FlxTween.tween(FlxG.camera, {x: FlxG.camera.x + 4}, .02, {ease: FlxEase.sineOut, type: 4});
			shakeTweenY = FlxTween.tween(FlxG.camera, {y: FlxG.camera.y + 8}, .04, {ease: FlxEase.sineOut, type: 4});
			shakeTweenAngle = FlxTween.tween(FlxG.camera, {angle: FlxG.camera.angle + 1}, .0325, {ease: FlxEase.quartOut, type: 4});
			new FlxTimer().start(.375, function(tmr:FlxTimer){
				FlxG.camera.setPosition(0, 0);
				FlxG.camera.angle = 0;
				for (i in [shakeTweenX, shakeTweenY, shakeTweenAngle]) i.cancel();
			});
		}

		shopTxtTween = FlxTween.tween(shopTxt.scale, {x: 1.5, y: 1.5}, .25, {ease: FlxEase.bounceOut});
		new FlxTimer().start(7.5, function(tmr:FlxTimer){
			shopTxtTween = FlxTween.tween(shopTxt.scale, {x: 0, y: 0}, .5, {ease: FlxEase.elasticInOut});
		});
	}else{
		selectedSomethin = true;
		confirm.play();
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
		case 'Story Mode':
			FlxG.switchState(new StoryMenuState());
		case 'Freeplay':
			FlxG.switchState(new FreeplayState());
		case 'Credits':
			FlxG.switchState(new CreditsMain());
		case 'Options':
			FlxG.switchState(new OptionsMenu());
		case 'Gallery':
			FlxG.switchState(new ModState('impostor/GalleryState'));
		// case 'Shop':
			// FlxG.switchState(new ModState('customStates/ShopState'));
	}
}

function beatHit()
	logo.animation.play("bump");