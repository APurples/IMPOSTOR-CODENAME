import flixel.addons.display.FlxBackdrop;
import funkin.menus.ModSwitchMenu;
import funkin.editors.EditorPicker;
import flixel.text.FlxTextBorderStyle;

var menuTxt:FlxText;

var portVer:Int = 0.1;

var menuItems:FlxTypedGroup<FlxSprite>;
var optionShit:Array<String> = CoolUtil.coolTextFile(Paths.txt("config/menuItems"));

function create(){
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

	versionShit = new FunkinText(5, FlxG.height - 22, 0, 'VS Impostor V4: CNE Port v' + portVer);
	versionShit.scrollFactor.set();
	versionShit.y -= versionShit.height;
	add(versionShit);

	controlsShit = new FunkinText(5, FlxG.height - 2, 0, 'Press 1 to open the story mode menu, Press 2 to open the freeplay menu, Press 3 to open the credits menu, Press 4 to open the options menu.');
	controlsShit.scrollFactor.set();
	controlsShit.y -= controlsShit.height;
	add(controlsShit);

	changeItem();
}

var selectedSomethin:Bool = false;

function update(elapsed){
	if (FlxG.sound.music.volume < 0.8) FlxG.sound.music.volume += 0.5 * elapsed;

    if (FlxG.keys.justPressed.SEVEN && !selectedSomethin){
		persistentUpdate = !(persistentDraw = true);
		openSubState(new EditorPicker());
	}

	if (controls.SWITCHMOD && !selectedSomethin) {
		openSubState(new ModSwitchMenu());
		persistentUpdate = !(persistentDraw = true);
	}

	if (controls.BACK && !selectedSomethin) FlxG.switchState(new TitleState());

	if (FlxG.keys.justPressed.ONE && !selectedSomethin){
		selectItem();
		new FlxTimer().start(1, function() {
			FlxG.switchState(new StoryMenuState());
		});
	}
	if (FlxG.keys.justPressed.TWO && !selectedSomethin){
		selectItem();
		new FlxTimer().start(1, function() {
			FlxG.switchState(new FreeplayState());
		});
	}
	if (FlxG.keys.justPressed.THREE && !selectedSomethin){
		selectItem();
		new FlxTimer().start(1, function() {
			FlxG.switchState(new CreditsMain());
		});
	}
	if (FlxG.keys.justPressed.FOUR && !selectedSomethin){
		selectItem();
		new FlxTimer().start(1, function() {
			FlxG.switchState(new OptionsMenu());
		});
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
}

function beatHit() logo.animation.play("bump");