import hxvlc.flixel.FlxVideo;
static var camMoveOffset:Float = 24;
static var camFollowChars:Bool = true;
var curVideo = null;

function create() {camFollowChars = true; camMoveOffset = 24;}

function postUpdate() {
    if (!FlxG.save.data.camMove){
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

    if (curStage == "chef") camMoveOffset = 14;
}

/** Video sprite to be placed in mid-game **/

public function playVid(vid:String) {
    curVideo = new FlxVideo();
    curVideo.onEndReached.add(curVideo.dispose);
    var path = Paths.file("songs/" + PlayState.SONG.meta.name.toLowerCase() + "/" + vid + '.mp4'); // songs/current-song/vid.mp4
    curVideo.play(Assets.getPath(path));
    trace("video played!");
    if (curVideo == null) trace("video did not play! did you check if the video name is spelled correctly?");
}

function update() {
    if (curVideo != null) canPause = false;
    else canPause = true; // doesn't fuckin work
}

function onDestroy() curVideo.destroy();