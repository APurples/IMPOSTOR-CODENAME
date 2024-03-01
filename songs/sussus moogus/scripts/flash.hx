function stepHit(curStep:Int){
    switch (curStep){
        case 375, 1271:
            redFlashBeat = 1;
        case 383, 1729:
            redFlashBeat = 2;
        case 634:
            redFlashBeat = null;
        case 1151, 1530:
            redFlashBeat = 16;
    }
}