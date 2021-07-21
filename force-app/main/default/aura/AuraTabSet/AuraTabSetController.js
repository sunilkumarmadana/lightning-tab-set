({
    handleActive: function (cmp, event, helper) {
        let tab = event.getSource();
        let formData = new Object();
        formData["searchText"] = cmp.find("searchText").get("v.value");
        formData["searchCheckBox"] = cmp.find("searchCheckBox").get("v.checked");
        formData["searchDate"] = cmp.find("searchDate").get("v.value");
        let messageText = JSON.stringify(formData);
        helper.fireComponentEvent(cmp, event, messageText);
    },
    handleComponentEvent : function(cmp, event) {
        var message = event.getParam("message");
        // set the handler attributes based on event data
        cmp.set("v.messageFromEvent", message);
    }
})