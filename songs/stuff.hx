import hxvlc.flixel.FlxVideo;
import funkin.game.cutscenes.DialogueCutscene;
import funkin.game.cutscenes.dialogue.DialogueBox;
import flixel.addons.text.FlxTypeText;

static var camMoveOffset:Float = 24;
static var camFollowChars:Bool = true;

var curVideo = null;

function create(){
    camFollowChars = true;
    camMoveOffset = 24;
}

function postUpdate() {
    if (FlxG.save.data.camMove){
        switch(strumLines.members[curCameraTarget].characters[0].getAnimName()) {
            case "singLEFT": camFollow.x -= camMoveOffset;
            case "singDOWN": camFollow.y += camMoveOffset;
            case "singUP": camFollow.y -= camMoveOffset;
            case "singRIGHT": camFollow.x += camMoveOffset;

            case "singLEFT-alt": camFollow.x -= camMoveOffset;
            case "singDOWN-alt": camFollow.y += camMoveOffset;
            case "singUP-alt": camFollow.y -= camMoveOffset;
            case "singRIGHT-alt": camFollow.x += camMoveOffset;
        }
    }
    if (curStage == "toogus" || "chef") camMoveOffset = 14;

    // Arabic alignment
    if (subState != null && subState.curLine != null && FlxG.save.data.arabic) {
        subState.dialogueBox.text.alignment = "right";
    }
}

/* Mid-song video cutscenes event
    Todo:
    - Preloading for playVid function
    - Make the video pause when pausing the entire game
*/

public function playVid(vid:String) {
    if (FlxG.save.data.midVidCutscene){
        curVideo = new FlxVideo();
        curVideo.onEndReached.add(curVideo.dispose);
        var path = Paths.file("songs/" + PlayState.SONG.meta.name.toLowerCase() + "/" + vid + '.mp4'); // songs/current-song/vid.mp4
        curVideo.play(Assets.getPath(path));
        trace("video played!");
        if (curVideo == null) trace("video did not play! did you check if the video name is spelled correctly?");
    }
}

function update() {
    if (curVideo != null) canPause = false;
    else canPause = true; // doesn't fuckin work
}