/**
 * Created by Piotr Kucia on 30.07.2018.
 */
({
    init : function(component, event, helper) {
        var action1 = component.get("c.getCurrentUser");
        var action2 = component.get("c.checkUserGroup");
        action1.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.user", response.getReturnValue());
                console.log(component.get("v.user"));
            } else {
                console.log("Failed with state: " + state);
            }
        });
        action2.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.userType", response.getReturnValue());
                console.log(component.get("v.userType"));
            } else {
                console.log("Failed with state: " + state);
            }
        });

        $A.enqueueAction(action1);
        $A.enqueueAction(action2);
    },
})