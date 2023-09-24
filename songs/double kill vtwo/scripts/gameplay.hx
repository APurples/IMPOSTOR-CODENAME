camGame.alpha = 0;
camHUD.alpha = 0;

function postCreate(){
    strumLines.members[2].characters[1].visible = false; // thanks maz
    for (i in 0...3){
        strumLines.members.members[0].alpha = 0.25;
    }
}