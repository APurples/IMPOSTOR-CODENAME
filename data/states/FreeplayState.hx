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
    portrait.animation.addByIndices('yellow', 'Character', [2], null, 24, true);
    portrait.animation.addByIndices('green', 'Character', [3], null, 24, true);
    portrait.animation.addByIndices('tomo', 'Character', [4], null, 24, true);
    portrait.animation.addByIndices('ham', 'Character', [5], null, 24, true);
    portrait.animation.addByIndices('black', 'Character', [6], null, 24, true);
    portrait.animation.addByIndices('white', 'Character', [7], null, 24, true);
    portrait.animation.addByIndices('para', 'Character', [8], null, 24, true);
    portrait.animation.addByIndices('pink', 'Character', [9], null, 24, true);
    portrait.animation.addByIndices('maroon', 'Character', [10], null, 24, true);
    portrait.animation.addByIndices('grey', 'Character', [11], null, 24, true);
    portrait.animation.addByIndices('chef', 'Character', [12], null, 24, true);
    portrait.animation.addByIndices('tit', 'Character', [13], null, 24, true);
    portrait.animation.addByIndices('ellie', 'Character', [14], null, 24, true);
    portrait.animation.addByIndices('rhm', 'Character', [15], null, 24, true);
    portrait.animation.addByIndices('loggo', 'Character', [16], null, 24, true);
    portrait.animation.addByIndices('clow', 'Character', [17], null, 24, true);
    portrait.animation.addByIndices('ziffy', 'Character', [18], null, 24, true);
    portrait.animation.addByIndices('chips', 'Character', [19], null, 24, true);
    portrait.animation.addByIndices('oldpostor', 'Character', [20], null, 24, true);
    portrait.animation.addByIndices('top', 'Character', [21], null, 24, true);
    portrait.animation.addByIndices('jorsawsee', 'Character', [22], null, 24, true);
    portrait.animation.addByIndices('warchief', 'Character', [23], null, 24, true);
    portrait.animation.addByIndices('redmungus', 'Character', [24], null, 24, true);
    portrait.animation.addByIndices('bananungus', 'Character', [25], null, 24, true);
    portrait.animation.addByIndices('powers', 'Character', [26], null, 24, true);
    portrait.animation.addByIndices('kills', 'Character', [27], null, 24, true);
    portrait.animation.addByIndices('jerma', 'Character', [28], null, 24, true);
    portrait.animation.addByIndices('who', 'Character', [29], null, 24, true);
    portrait.animation.addByIndices('monotone', 'Character', [30], null, 24, true);
    portrait.animation.addByIndices('charles', 'Character', [31], null, 24, true);
    portrait.animation.addByIndices('finale', 'Character', [32], null, 24, true);
    portrait.animation.addByIndices('pop', 'Character', [33], null, 24, true);
    portrait.animation.addByIndices('torture', 'Character', [34], null, 24, true);
    portrait.animation.addByIndices('dave', 'Character', [35], null, 24, true);
    portrait.animation.addByIndices('bpmar', 'Character', [36], null, 24, true);
    portrait.animation.addByIndices('grinch', 'Character', [37], null, 24, true);
    portrait.animation.addByIndices('redmunp', 'Character', [38], null, 24, true);
    portrait.animation.addByIndices('nuzzus', 'Character', [39], null, 24, true);
    portrait.animation.addByIndices('monotoner', 'Character', [40], null, 24, true);
    portrait.animation.addByIndices('idk', 'Character', [41], null, 24, true);
    portrait.animation.addByIndices('esculent', 'Character', [42], null, 24, true);
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