function postCreate(){
    if (Options.colorHealthBar){
        if (curStage == "polus"){
            healthBar.createFilledBar(0xFFBB2D30,0xFF31B0D1);
        }
        if (curStage == "monochrome"){
            healthBar.createFilledBar(0xFFFFFFFF,0xFF31B0D1);
        }
    }
}