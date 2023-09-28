function beatHit(){
    if (curBeat % 2 == 0){
        boyfriend.animation.play("idle");
        dad.animation.play("idle");
    }
}