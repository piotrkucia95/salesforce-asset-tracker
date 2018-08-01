/**
 * Created by Piotr Kucia on 01.08.2018.
 */
({
    handleUserChange : function(component, event, helper) {
        var action = component.get("c.getAssetsAssignedToUser");
        var userId = component.get('v.user.Id');
        action.setParams({
            "userId": userId
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var assetStrings = response.getReturnValue();
                var assetObjects = new Array();
                for(var i=0; i<assetStrings.length; i++) {
                    assetObjects.push(JSON.parse(assetStrings[i]));
                    console.log(assetObjects[i]);
                }
                component.set("v.myAssets", assetObjects);
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    handleUserInfoEvent : function(component, event, handler) {
        var user = event.getParam("user");
        component.set("v.user", user);
    },
})