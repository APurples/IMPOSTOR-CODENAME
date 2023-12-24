import funkin.ui.FunkinText;
import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import funkin.backend.system.framerate.Framerate;

var pauseCam = new FlxCamera();

var scroll, confirm, cancel:FlxSound;

var bg:FlxSprite;

var blackboxDown = new FlxSprite();
var blackboxUp = new FlxSprite();

var texts:Array<FlxText> = [];

function create(event) {
    FlxTween.tween(Framerate.offset, {y: 60}, .5, {ease: FlxEase.cubeOut});

	// cancel default pause menu!!
	event.cancel();
	event.music = "pause/tomongus";

	cameras = [];

    confirm = FlxG.sound.load(Paths.sound('menu/confirm'), .3);
    cancel = FlxG.sound.load(Paths.sound('menu/cancel'), .3);
    scroll = FlxG.sound.load(Paths.sound('menu/scroll'), .15);

    FlxG.cameras.add(pauseCam, false);
    pauseCam.bgColor = 0x88000000;
    pauseCam.alpha = 0;
    pauseCam.zoom = 1.25;
    FlxTween.tween(pauseCam, {alpha: 1, zoom: 1}, .5, {ease: FlxEase.cubeOut});

    blackboxDown.makeGraphic(FlxG.width * 20, 1000,  0xFF000000);
    blackboxDown.y = 750;
    blackboxDown.cameras = [pauseCam];
    FlxTween.tween(blackboxDown, {y: 665}, .5, {ease: FlxEase.cubeOut});
    add(blackboxDown);

    blackboxUp.makeGraphic(FlxG.width * 20, 1000,  0xFF000000);
    blackboxUp.y = -1040;
    blackboxUp.cameras = [pauseCam];
    FlxTween.tween(blackboxUp, {y: -940}, .5, {ease: FlxEase.cubeOut});
    add(blackboxUp);

    songPlayingText = new FlxText(25, 750, 0, "Song Playing: Pause Menu - Tomongus Version", 18, true);
    FlxTween.tween(songPlayingText, {y: 680}, .5, {ease: FlxEase.cubeOut});
	add(songPlayingText);

	songText = new FlxText(25, -50, 0, "GAME PAUSED", 42, true);
    FlxTween.tween(songText, {y: 5}, .5, {ease: FlxEase.cubeOut});
	add(songText);

    pauseMenuText = new FlxText(1250, 125, 0, "Pause Menu", 24, true);
    FlxTween.tween(pauseMenuText, {x: 815}, .5, {ease: FlxEase.cubeOut});
    pauseMenuText.borderStyle = FlxTextBorderStyle.OUTLINE;
    pauseMenuText.borderSize = 1.25;
	add(pauseMenuText);

    var i:Float = 2;
	for(e in menuItems) {
		text = new FlxText(1250, (22 * 2) + (i * 9 * 6), 0, e, 8, false);
        FlxTween.tween(text, {x: 800}, .5, {ease: FlxEase.cubeOut});
		confText(text);
		add(text);
		texts.push(text);
		i++;
	}

    hand = new FlxSprite().loadGraphic(Paths.image('stages/school/ui/hand_textbox'));
	hand.scale.set(4.5, 4.5);
	hand.updateHitbox();
	add(hand);

	cameras = [pauseCam];
}

function confText(text) {
	text.scale.set(5.25, 5.25);
	text.updateHitbox();
	text.borderStyle = FlxTextBorderStyle.OUTLINE;
}

function destroy() FlxG.cameras.remove(pauseCam);

var canDoShit = true;
var time:Float = 0;
function update(elapsed) {
	time += elapsed;

	var curText = texts[curSelected];
	hand.setPosition(curText.x - hand.width - 18 + (Math.sin(time * Math.PI * 2) * 12), curText.y + (text.height - hand.height) - 6);
	hand.x -= hand.x % 6;
	hand.y -= hand.y % 6;

	if (!canDoShit) return;
	var oldSec = curSelected;
	if (controls.DOWN_P) changeSelection(1, false);
	if (controls.UP_P) changeSelection(-1);

	if (controls.ACCEPT) {
		var option = menuItems[curSelected];

        if (option == "Exit to menu") cancel.play();
        else confirm.play();

        FlxTween.tween(Framerate.offset, {y: 0}, .5, {ease: FlxEase.cubeOut});
		if (option == "Resume" || option == "Restart Song" || option == "Skip Song") {
			canDoShit = false;
            FlxTween.tween(pauseCam, {alpha: 0, zoom: 1.25}, .5, {ease: FlxEase.cubeOut});
            new FlxTimer().start(.65, function(tmr:FlxTimer){
                selectOption();
            });
		}else if (option == "Exit to menu" || option == "Change Options"){
            canDoShit = false;
            FlxTween.tween(pauseCam, {zoom: 1.25}, .5, {ease: FlxEase.cubeOut});
            pauseCam.fade(FlxColor.BLACK, .5);
            new FlxTimer().start(.65, function(tmr:FlxTimer){
                selectOption();
            });
        }else selectOption();
	}
}

function changeSelection(change){
    scroll.play();

	curSelected += change;

	if (curSelected < 0) curSelected = menuItems.length - 1;
	if (curSelected >= menuItems.length) curSelected = 0;
}