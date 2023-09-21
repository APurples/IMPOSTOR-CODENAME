import flixel.util.FlxAxes;
import flixel.addons.display.FlxBackdrop;

function create(){
	FlxG.mouse.visible = true;

	starFG = new FlxBackdrop(Paths.image('menus/mainmenu/starFG'));
    starFG.updateHitbox();
    starFG.antialiasing = true;
    starFG.scrollFactor.set();
    add(starFG);

	starBG = new FlxBackdrop(Paths.image('menus/mainmenu/starBG'));
    starBG.updateHitbox();
    starBG.antialiasing = true;
    starBG.scrollFactor.set();
	add(starBG);

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
}

function update(){
    if (FlxG.keys.pressed.ENTER){
        redImpostor.animation.play('select');
        greenImpostor.animation.play('select');
        
        FlxTween.tween(starFG, {y: starFG.y + 500}, 0.7, {ease: FlxEase.quadInOut});
		FlxTween.tween(starBG, {y: starBG.y + 500}, 0.7, {ease: FlxEase.quadInOut, startDelay: 0.2});
        FlxTween.tween(greenImpostor, {y: greenImpostor.y + 800}, 0.7, {ease: FlxEase.quadInOut, startDelay: 0.24});
		FlxTween.tween(redImpostor, {y: redImpostor.y + 800}, 0.7, {ease: FlxEase.quadInOut, startDelay: 0.3});
		FlxG.camera.fade(FlxColor.BLACK, 0.7, false);
		FlxTween.tween(spr, {alpha: 0}, 1.3, {
			ease: FlxEase.quadOut,
			onComplete: function(twn:FlxTween)
			{
				spr.kill();
			}
		});
    }

    remove(magenta);
}