// this is a wip custom state for freeplay

import flixel.group.FlxTypedGroup;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.input.mouse.FlxMouseEventManager;
import funkin.backend.system.framerate.Framerate;

var songs:Array<ChartMetaData> = ["sussus moogus"];

var curSelected:Int = 0;
var curDiff:Int = 0;

var scoreText:FunkinText;
var diffText:FunkinText;

var scoreBG:FunkinSprite;
var bg:FunkinSprite;

var canSelect:Bool = true;

var grpSongs:FlxGroup;

var portraitTween:FlxTween;
var portraitAlphaTween:FlxTween;

function create(){
    FlxTween.tween(Framerate.offset, {y: 77.5}, .75, {ease: FlxEase.elasticOut});

    camGame = new FlxCamera();
    camGame.bgColor = 0;
    FlxG.cameras.add(camGame, false);
    camUpper = new FlxCamera();
    camUpper.bgColor = 0;
    FlxG.cameras.add(camUpper, false);
    camOther = new FlxCamera();
    camOther.bgColor = 0;
    FlxG.cameras.add(camOther, false);

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

    porGlow = new FlxSprite(-11.1, -12.65).loadGraphic(Paths.image('menus/freeplay/backGlow'));
    porGlow.antialiasing = true;
	porGlow.updateHitbox();
	porGlow.scrollFactor.set();
    insert(members.indexOf(bg), porGlow);
	add(porGlow);

    portrait = new FlxSprite();
    portrait.frames = Paths.getSparrowAtlas('menus/freeplay/portraits');

    // gonn make this into an array later
    portrait.animation.addByIndices('red', 'Character', [1], null, 24, true);
    portrait.animation.addByIndices('yellow', 'Character', [2], null, 24, true);
    portrait.animation.addByIndices('green', 'Character', [3], null, 24, true);
    portrait.animation.addByIndices('black', 'Character', [6], null, 24, true);
    portrait.animation.addByIndices('chef', 'Character', [12], null, 24, true);
    portrait.antialiasing = true;
    portrait.setPosition(304.65, -100);
    add(portrait);

    infoText = new FlxText(1071.05, 91, 0, '291921 \n Rating: 32 \n', 48);
    infoText.antialiasing = true;
    infoText.updateHitbox();
    infoText.scrollFactor.set();
    infoText.setFormat(Paths.font(""), 36, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    //add(infoText);

    upperBar = new FlxSprite(-2, -1.4).loadGraphic(Paths.image('menus/freeplay/topBar'));
    upperBar.antialiasing = true;
    upperBar.updateHitbox();
    upperBar.scrollFactor.set();
    upperBar.cameras = [camUpper];
    add(upperBar);

    crossImage = new FlxSprite(12.50, 8.05).loadGraphic(Paths.image('menus/freeplay/menuBack'));
    crossImage.antialiasing = true;
    crossImage.scrollFactor.set();
    crossImage.updateHitbox();
    crossImage.cameras = [camUpper];
    add(crossImage);
    FlxMouseEventManager.add(crossImage, function onMouseDown(s:FlxSprite){
        FlxG.switchState(new ModState('customStates/AmongMainMenuState'));
	}, null, null);

    topBean = new FlxSprite(30, 100).loadGraphic(Paths.image('menus/shop/bean'));
    topBean.antialiasing = true;
    topBean.cameras = [camUpper];
    topBean.updateHitbox();
    add(topBean);	

    grpSongs = new FlxGroup();

	for (i in 0...songs.length){
		var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i].displayName, true, false);
		songText.isMenuItem = true;
		songText.targetY = i;
		songText.alpha = i == curSelected ? 1 : 0.5;
		grpSongs.add(songText);
	}
    add(grpSongs);

    portraitTween();
}

function update(){
    starFG.x -= 0.06;
    starBG.x -= 0.03;
}

function portraitTween(){
    portraitTween = FlxTween.tween(portrait, {x: 304.65}, 0.3, {ease: FlxEase.expoOut});
    portraitAlphaTween = FlxTween.tween(portrait, {alpha: 1}, 0.3, {ease: FlxEase.expoOut});
}