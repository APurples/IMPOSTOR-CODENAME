function postCreate() gf.alpha = 0;

function stepHit()
    switch(curStep){
        case 816:
            gf.alpha = 1;
            gf.playAnim("fadein", true);
        case 820: dad.playAnim("look", true);
    }