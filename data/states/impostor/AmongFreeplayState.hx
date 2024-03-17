// this is a wip custom state for freeplay

import flixel.input.mouse.FlxMouseEvent;
import funkin.backend.scripting.Script;
import funkin.savedata.FunkinSave;
import funkin.backend.chart.Chart;
import flixel.group.FlxTypedGroup;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import funkin.backend.system.framerate.Framerate;

var songs:Array<ChartMetaData> = [];

var curSelected:Int = 0;
var curDiff:Int = 0;

var canSelect:Bool = true;

var grpSongs:FlxGroup;

var portraitTween:FlxTween;
var portraitAlphaTween:FlxTween;

var camUI:FlxCamera;

function create(){
    FlxTween.tween(Framerate.offset, {y: 77.5}, .75, {ease: FlxEase.elasticOut});

    songs = Paths.txt('freeplaySonglist');

    camUI = new FlxCamera();
	camUI.bgColor = 0;
	FlxG.cameras.add(camUI, false);

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
    infoText.setFormat(Paths.font(""), 36, FlxColor.WHITE, FlxAxes.RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    add(infoText);

    upperBar = new FlxSprite(-2, -1.4).loadGraphic(Paths.image('menus/freeplay/topBar'));
    upperBar.antialiasing = true;
    upperBar.updateHitbox();
    upperBar.scrollFactor.set();
    add(upperBar);

    crossImage = new FlxSprite(12.50, 8.05).loadGraphic(Paths.image('menus/freeplay/menuBack'));
    crossImage.antialiasing = true;
    crossImage.scrollFactor.set();
    crossImage.updateHitbox();
    add(crossImage);
    FlxMouseEvent.add(crossImage, function onMouseDown(s:FlxSprite){goBack();}, null, null);

    topBean = new FlxSprite(30, 100).loadGraphic(Paths.image('menus/shop/bean'));
    topBean.antialiasing = true;
    topBean.updateHitbox();
    add(topBean);	

    songText = new FlxText(50, 23, 0, songs, 48);
    songText.setFormat(Paths.font('AmaticSC-Bold.ttf'), 64, FlxColor.WHITE, FlxAxes.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    songText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
    songText.antialiasing = true;
    songText.updateHitbox();

    for (i in [crossImage, upperBar, infoText, topBean]) i.cameras = [camUI];

    /*for (i in listOfButtons){
		add(i);
		//add(i.spriteOne);
		//add(i.icon);
		add(i.songText);
		//add(i.bean);
		//add(i.lock);
		//add(i.priceText);
	}

	for (i in 0...listOfButtons.length){
		listOfButtons[i].targetY = i;
		listOfButtons[i].spriteOne.setPosition(10, (120 * i) + 100);
	}*/

    changeItem(0);
    portraitTween();
}

var nextSelected:Int = 0;
function changeItem(value:Int) {
	if (!canSelect) return;
	
	nextSelected = value;
	CoolUtil.playMenuSFX(0, 0.7);

	curSelected = nextSelected;
}

function update(){
    starFG.x -= 0.06;
    starBG.x -= 0.03;

    if (controls.BACK) goBack();
}

function portraitTween(){
    portrait.x = 504.65;
    portrait.alpha = 0;
    portraitTween = FlxTween.tween(portrait, {x: 304.65}, 0.3, {ease: FlxEase.expoOut});
    portraitAlphaTween = FlxTween.tween(portrait, {alpha: 1}, 0.3, {ease: FlxEase.expoOut});
}

function goBack(){
    FlxG.sound.play(Paths.sound('menu/cancel'));
    FlxG.camera.fade(FlxColor.BLACK, 0.5, false);
    camUI.fade(FlxColor.BLACK, 0.5, false);
    new FlxTimer().start(.25, function(tmr:FlxTimer){FlxG.switchState(new ModState('customStates/AmongMainMenuState'));});
}