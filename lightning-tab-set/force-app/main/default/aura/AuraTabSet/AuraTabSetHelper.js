({
    fireComponentEvent : function(cmp, event, messageContent) {
        // Get the component event by using the
        // name value from aura:registerEvent
        var cmpEvent = cmp.getEvent("cmpEvent");
        cmpEvent.setParams({ "message" : messageContent });
        cmpEvent.fire();
    }
})