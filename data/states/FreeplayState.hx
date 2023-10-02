import flixel.FlxCamera;
import flixel.math.FlxMath;
import flixel.addons.display.FlxBackdrop;
import flixel.input.mouse.FlxMouseEventManager;

function create(){
    FlxG.mouse.visible = true;

	starsBG = new FlxBackdrop(Paths.image('menus/freeplay/starBG'), 1, 1, true, true);
	starsBG.setPosition(111.3, 67.95);
	starsBG.antialiasing = true;
	starsBG.updateHitbox();
	starsBG.scrollFactor.set();
    add(starsBG);

	starsFG = new FlxBackdrop(Paths.image('menus/freeplay/starFG'), 1, 1, true, true);
	starsFG.setPosition(54.3, 59.45);
	starsFG.updateHitbox();
	starsFG.antialiasing = true;
	starsFG.scrollFactor.set();
	add(starsFG);

    porGlow = new FlxSprite(-11.1, -12.65).loadGraphic(Paths.image('menus/freeplay/backGlow'));
    porGlow.antialiasing = true;
	porGlow.updateHitbox();
	porGlow.scrollFactor.set();
	add(porGlow);

    portrait = new FlxSprite();
    portrait.frames = Paths.getSparrowAtlas('menus/freeplay/portraits');

    portrait.animation.addByIndices('red', 'Character', [1], null, 24, true);
    portrait.animation.addByIndices('black', 'Character', [6], null, 24, true);
    portrait.animation.addByIndices('chef', 'Character', [12], null, 24, true);
    portrait.animation.addByIndices('nuzzus', 'Character', [39], null, 24, true);
    portrait.animation.play('red');
    portrait.antialiasing = true;
    portrait.setPosition(304.65, -100);
    portrait.updateHitbox();
    portrait.scrollFactor.set();
    add(portrait);

    upperBar = new FlxSprite(-2, -1.4).loadGraphic(Paths.image('menus/freeplay/topBar'));
    upperBar.antialiasing = true;
    upperBar.updateHitbox();
    upperBar.scrollFactor.set();
    //upperBar.cameras = [camUpper];
    add(upperBar);

    crossImage = new FlxSprite(12.50, 8.05).loadGraphic(Paths.image('menus/freeplay/menuBack'));
    crossImage.antialiasing = true;
    crossImage.scrollFactor.set();
    crossImage.updateHitbox();
    //crossImage.cameras = [camUpper];
    add(crossImage);
    FlxMouseEventManager.add(crossImage, function onMouseDown(s:FlxSprite){
        FlxG.switchState(new MainMenuState());
	}, null, null);
}

function postCreate(){
    bg.destroy();
}

function update(){
    porGlow.color = interpColor.color;

    starsFG.x -= 0.06;
	starsBG.x -= 0.03;
}

function postUpdate(){
    // stuff that changes the portraits !!!!
    switch(songs[curSelected].name){
        case "sussus moogus" | "sabotage" | "meltdown":
            portrait.animation.play('red');
        case "sauces moogus":
            portrait.animation.play('chef');
        case "sussus nuzzus":
            portrait.animation.play('nuzzus');
            portrait.alpha = 1;
        case "monochrome":
            portrait.alpha = 0;
        case "double kill vtwo":
            portrait.animation.play('black');
            portrait.alpha = 1;
    }
}