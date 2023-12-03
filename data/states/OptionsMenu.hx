import funkin.backend.system.framerate.Framerate;

function postCreate(){
    for (option in main.members)
		if (option.desc == "Modify mod options here") main.members.remove(option);

    starsBG = new FlxBackdrop(Paths.image('menus/starBG'));
	starsBG.antialiasing = true;
	starsBG.updateHitbox();
	starsBG.scrollFactor.set();
    add(starsBG);

    starFG = new FlxBackdrop(Paths.image('menus/starFG'));
	starFG.updateHitbox();
	starFG.antialiasing = true;
	starFG.scrollFactor.set();
	add(starsFG);
}

function update(){
    Framerate.offset.y = pathBG.height;

    // moves the stars to the left
    starsFG.x -= 0.06;
    starsBG.x -= 0.03;
}