static var camMoveOffset:Float = 24;
static var camFollowChars:Bool = true;

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

    if(curStage == "chef"){
        camMoveOffset = 14;
    }
}