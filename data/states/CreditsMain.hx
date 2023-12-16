import funkin.backend.system.framerate.Framerate;
import flixel.addons.display.FlxBackdrop;

function postCreate(){
    starBG = new FlxBackdrop(Paths.image('menus/starBG'));
	starBG.antialiasing = true;
	starBG.updateHitbox();
	starBG.scrollFactor.set();
    add(starBG);

    starFG = new FlxBackdrop(Paths.image('menus/starFG'));
	starFG.updateHitbox();
	starFG.antialiasing = true;
	starFG.scrollFactor.set();
	add(starFG);
}

function update(){
    Framerate.offset.y = pathBG.height;

    // moves the stars to the left
    starFG.x -= 0.06;
    starBG.x -= 0.03;
}