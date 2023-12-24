/* 
    skip song option by maz
*/

function create(event) if (game.isStoryMode && game.inst != null && game.vocals != null && FlxG.save.data.devMode) menuItems.insert(1, 'Skip Song');

function update() if (controls.ACCEPT) if (menuItems[curSelected] == "Skip Song") game.endSong();