function onNoteHit(e)
    if (e.noteType == "Shake Note"){
        camGame.shake(0.01, 0.1);
        camHUD.shake(0.0075, 0.1);
    }