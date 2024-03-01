function stepHit(curStep:Int)
    switch(curStep){
        case 63, 639, 831:
            redFlashBeat = 8;
        case 481, 737, 1473:
            redFlashBeat = null;
        case 511:
            redFlashBeat = 16;
    }