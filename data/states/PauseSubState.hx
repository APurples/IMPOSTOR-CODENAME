/* 
    Skips the current song for the purpose of testing cutscenes 
    for the next song quickly (useless for freeplay)

    Original script by MAZ
*/
var isDebugEnabled:Bool = false;

function create()
    if (game.isStoryMode && game.inst != null && game.vocals != null) menuItems.insert(1, 'Skip Song');

function update(){
    if (controls.ACCEPT){
        if (menuItems[curSelected] == "Skip Song") game.endSong();
    }
    
    if (FlxG.save.data.devMode){
        isDebugEnabled = true;
    }
}