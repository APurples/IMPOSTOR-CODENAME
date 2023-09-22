static var camMoveOffset:Float = 24;
static var camFollowChars:Bool = true;

function create() {camFollowChars = true; camMoveOffset = 24;}

function onCameraMove(camMoveEvent) {
    if (!FlxG.save.data.camMove){
        if (camFollowChars) {
            if (camMoveEvent.strumLine != null && camMoveEvent.strumLine?.characters[0] != null) {
                var poseMovement:FlxPoint = switch (camMoveEvent.strumLine.characters[0].animation.name) {
                    case "singLEFT": FlxPoint.get(-camMoveOffset, 0);
                    case "singDOWN": FlxPoint.get(0, camMoveOffset);
                    case "singUP": FlxPoint.get(0, -camMoveOffset);
                    case "singRIGHT": FlxPoint.get(camMoveOffset, 0);
                    case "singUP-alt": FlxPoint.get(0, -camMoveOffset);
                    default: FlxPoint.get(0,0);
                };
                camMoveEvent.position.x += poseMovement.x; camMoveEvent.position.y += poseMovement.y;
                poseMovement.put();
            }
        } else camMoveEvent.cancel();
    }
}

function update(){
    if(curStage == "toogus"){
        camMoveOffset = 18;
    }
}

function destroy() {camFollowChars = true; camMoveOffset = 24;}