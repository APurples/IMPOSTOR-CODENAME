function postCreate(){
    if (Options.colorHealthBar){
        if (curStage == "polus") healthBar.createFilledBar(0xFFBB2D30,0xFF31B0D1);
        if (curStage == "monochrome") healthBar.createFilledBar(0xFFFFFFFF,0xFF31B0D1);
        if (curStage == "cargobay") healthBar.createFilledBar(0xFF6C5887,0xFF31B0D1);
        if (curStage == "chef") healthBar.createFilledBar(0xFFC75E52,0xFF31B0D1);
        if (curStage == "dlowingt") healthBar.createFilledBar(0xFFFDCC37,0xFF31B0D1);
    }
}