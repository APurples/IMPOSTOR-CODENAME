/* 
    Skips the current song for the purpose of testing cutscenes 
    for the next song quickly (useless for freeplay)

    Original script by MAZ
*/

function create(){
    if (game.isStoryMode && game.inst != null && game.vocals != null && FlxG.save.data.devMode) menuItems.insert(1, 'Skip Song');

    if (game.curStage == "pixelSkeld") pauseMusic = FlxG.sound.load(Paths.music('pause/tomongus'), 0, true);
}

function postCreate() game.menuItems.screenCenter();

function update() if (controls.ACCEPT) if (menuItems[curSelected] == "Skip Song") game.endSong();