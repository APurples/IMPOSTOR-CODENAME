import flixel.addons.display.FlxBackdrop;
import lime.app.Application;
import lime.graphics.Image;

function create(){
	window.title = "Vs Impostor: V4";

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
}

function postCreate(){
    titleAlphabet.y = disclaimer.y - 120;
    disclaimer.screenCenter();
    disclaimer.text = "This engine is still in a alpha state. That means majority of the features are either buggy or unfinished. If you find any bugs, please report them to the Codename Engine GitHub.\n\nAlso, this port has some stuff that can be sensitive to some people. This includes:\n\nFlashing Lights, Screen Shaking, Jumpscares, etc.\nYou can always disable these in the settings.\n\n\nPress ENTER to continue.";
}