import flixel.group.FlxTypedGroup;
import flixel.addons.display.FlxBackdrop;
import flixel.math.FlxPoint;

var isFocused:Bool = false;

var clickPos:FlxPoint;
var clickPosScreen:FlxPoint;

function create(){
    camGame = new FlxCamera();
    camGame.bgColor = 0;
    FlxG.cameras.add(camGame, false);
    camUpper = new FlxCamera();
    camUpper.bgColor = 0;
    FlxG.cameras.add(camUpper, false);
    camOther = new FlxCamera();
    camOther.bgColor = 0;
    FlxG.cameras.add(camOther, false);

    clickPos = new FlxPoint();
    clickPosScreen = new FlxPoint();

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

    equipbutton = new FlxSprite(0, 0);
    equipbutton.frames = Paths.getSparrowAtlas('menus/shop/button');
	equipbutton.animation.addByPrefix('buy', 'buy', 0, false);
    equipbutton.animation.addByPrefix('equipped', 'equipped', 0, false);
    equipbutton.animation.addByPrefix('grey', 'grey', 0, false);
    equipbutton.animation.addByPrefix('locked', 'locked', 0, false);
	equipbutton.animation.play('buy');
    equipbutton.scale.set(0.8, 0.8);
    equipbutton.scrollFactor.set();
    equipbutton.cameras = [camUpper];
    add(equipbutton);

    equipText = new FlxText(0, 0, equipbutton.width, 'BUY', 35);
	equipText.setFormat(Paths.font("ariblk.ttf"), 35, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    equipText.updateHitbox();
	equipText.borderSize = 3;
    equipText.scrollFactor.set();
    equipText.antialiasing = true;
    equipText.cameras = [camUpper];
    add(equipText);

    charName = new FlxText(0, 0, panel.width, 'this is a test', 70);
    charName.setFormat(Paths.font("ariblk.ttf"), 70, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    charName.updateHitbox();
    charName.borderSize = 3;
    charName.scrollFactor.set();
    charName.antialiasing = true;
    charName.cameras = [camUpper];
    add(charName);

    charDesc = new FlxText(0, 0, panel.width, 'this is a test', 20);
    charDesc.setFormat(Paths.font("ariblk.ttf"), 20, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    charDesc.updateHitbox();
    charDesc.borderSize = 1;
    charDesc.scrollFactor.set();
    charDesc.antialiasing = true;
    charDesc.cameras = [camUpper];
    add(charDesc);

    upperBar = new FlxSprite(-2, -1.4).loadGraphic(Paths.image('menus/freeplay/topBar'));
    upperBar.antialiasing = true;
    upperBar.updateHitbox();
    upperBar.scrollFactor.set();
    upperBar.cameras = [camUpper];
    add(upperBar);
}

function update(elapsed){
    starFG.x -= 0.06;
    starBG.x -= 0.03;

	if (controls.BACK || FlxG.mouse.justPressedRight){
		FlxG.sound.play(Paths.sound('menu/cancel'));
		FlxG.camera.fade(FlxColor.BLACK, 0.5, false);
		new FlxTimer().start(.75, function(tmr:FlxTimer){
            FlxG.switchState(new ModState('customStates/AmongMainMenuState'));
		});
	}

    if(FlxG.mouse.pressed) handleCamDrag();

    if(!isFocused){
        if(FlxG.mouse.justPressed) handleCamPress();
    }

    if (FlxG.keys.pressed.E && FlxG.camera.zoom < 3) {
        FlxG.camera.zoom += elapsed * FlxG.camera.zoom;
        if(FlxG.camera.zoom > 3) FlxG.camera.zoom = 3;
    }
    if (FlxG.keys.pressed.Q && FlxG.camera.zoom > 0.1) {
        FlxG.camera.zoom -= elapsed * FlxG.camera.zoom;
        if(FlxG.camera.zoom < 0.1) FlxG.camera.zoom = 0.1;
    }
}

function handleCamPress(){
    clickPos.x = camFollowPos.x;
    clickPos.y = camFollowPos.y;
    clickPosScreen.x = FlxG.mouse.screenX;
    clickPosScreen.y = FlxG.mouse.screenY;
}

function handleCamDrag(){
    camFollowPos.x = clickPos.x + (clickPosScreen.x - FlxG.mouse.screenX);
    camFollowPos.y = clickPos.y + (clickPosScreen.y - FlxG.mouse.screenY);
}

function showPanel() FlxTween.tween(panel, {x: FlxG.width * 0.6}, 0.4, {ease: FlxEase.circOut});

function hidePanel() FlxTween.tween(panel, {x: FlxG.width * 1.4}, 0.4, {ease: FlxEase.circIn});