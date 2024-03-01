function onSongStart()
    redFlashBeat = 8;

function stepHit(curStep:Int){
    switch(curStep){
        case 127, 767:
            redFlashBeat = 4;
        case 511, 1023:
            redFlashBeat = 8;
        case 1121:
            redFlashBeat = null;
    }
}