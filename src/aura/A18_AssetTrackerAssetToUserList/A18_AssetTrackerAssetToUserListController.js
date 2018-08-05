/**
 * Created by Piotr Kucia on 06.08.18.
 */
({
    init : function(component, event, helper) {
        var action = component.get("c.getAssetUsers");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                component.set("v.assetUsers", response.getReturnValue());
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
})