import flixel.addons.display.FlxBackdrop;

function create(){
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

function update(){
    starFG.x -= 0.06;
    starBG.x -= 0.03;

	if (controls.BACK || FlxG.mouse.justPressedRight){
		FlxG.sound.play(Paths.sound('menu/cancel'));
		FlxG.camera.fade(FlxColor.BLACK, 0.5, false);
		new FlxTimer().start(.75, function(tmr:FlxTimer){
            FlxG.switchState(new ModState('customStates/AmongMainMenuState'));
		});
	}
}