import flixel.addons.display.FlxBackdrop;
import funkin.options.OptionsMenu;

var optionsPressed:Bool = false;

function create(){
	if (FlxG.save.data.warningState){
		warningTxt = new Alphabet(450, 300, "WARNING", true);
		warningTxt.scrollFactor.set(0.05, 0.05);
		warningTxt.scale.set(.001, .001);
		warningTxt.alpha = 0;
		add(warningTxt);
	
		warningDesc1 = new FunkinText(-550, 205, 550,
			"In case if you never heard about Codename Engine, this is a W.I.P engine that has bugs and unfinished things. If you see any bugs found from the engine, please report them to the discord server or in the github's issues page.",
			30);
		add(warningDesc1);
	
		warningDesc2 = new FunkinText(1350, 400, 550,
			"This port has flashing lights and shaking effects that can affect some people. You can press ESCAPE right now to open up the options menu if you need to turn anything off.",
			30);
		add(warningDesc2);
	
		enterTxt = new FunkinText(225, 725, 0, "Press ENTER to bootup the port.", 48);
		enterTxt.alignment = 'middle';
		add(enterTxt);
	
		starBG = new FlxBackdrop(Paths.image('menus/starBG'));
		starBG.updateHitbox();
		starBG.antialiasing = true;
		starBG.scrollFactor.set();
		add(starBG);
	
		starFG = new FlxBackdrop(Paths.image('menus/starFG'));
		starFG.updateHitbox();
		starFG.antialiasing = true;
		starFG.scrollFactor.set();
		add(starFG);
	}
}

var selectedSomethin:Bool = false;

function update(){
	if (FlxG.save.data.warningState){
		starFG.x -= 0.06;
		starBG.x -= 0.03;
	
		new FlxTimer().start(.2, function(){
			FlxTween.tween(warningTxt, {alpha: 1}, .75);
			FlxTween.tween(warningTxt.scale, {x: 1, y: 1}, .75, {ease: FlxEase.quintOut});
		});
	
		new FlxTimer().start(1, function(){
			FlxTween.tween(warningTxt, {y: 100}, 1, {ease: FlxEase.sineOut});
			FlxTween.tween(warningDesc1, {x: 75}, 1, {ease: FlxEase.sineOut});
			FlxTween.tween(warningDesc2, {x: 675}, 1, {ease: FlxEase.sineOut});
			FlxTween.tween(enterTxt, {y: 625}, 1, {ease: FlxEase.sineOut});
		});
	
		if (FlxG.keys.justPressed.ENTER && !selectedSomethin) pressedEnter();
		else if (FlxG.keys.justPressed.ESCAPE) pressedEscape();
		else if (FlxG.keys.justPressed.ENTER && selectedSomethin){
			FlxG.camera.stopFX();
			FlxG.switchState(new TitleState());
		}
	}else FlxG.switchState(new TitleState());
}

function pressedEnter(){
	selectedSomethin = true;
	if (FlxG.save.data.flashingLights) FlxG.camera.flash(0xFFFFFFFF, 1);
	FlxG.sound.play(Paths.sound('menu/confirm'));
	FlxG.camera.zoom += 0.1;
	FlxTween.tween(FlxG.camera, {zoom: 1}, 1.5, {ease: FlxEase.expoOut});
	new FlxTimer().start(2, function() {
		FlxG.switchState(new TitleState());
	});
}

function pressedEscape(){
	FlxG.switchState(new OptionsMenu());
	optionsPressed = true;
}