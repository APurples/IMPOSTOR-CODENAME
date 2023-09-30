function onEvent(eventEvent){
    if (eventEvent.event.name == "Zoom"){
        var types = switch(eventEvent.event.params[1]){
            case 'Add': defaultCamZoom += eventEvent.event.params[0];
            case 'Minus': defaultCamZoom -= eventEvent.event.params[0];
            case 'Equals': defaultCamZoom = eventEvent.event.params[0];
        };
    }
}