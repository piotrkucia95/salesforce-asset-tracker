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
                component.set("v.userWrapper.user", response.getReturnValue());
            } else {
                console.log("Failed with state: " + state);
            }
        });
        action2.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.userWrapper.userType", response.getReturnValue());
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action1);
        $A.enqueueAction(action2);
    },
    handleUserWrapperChange : function(component, event, helper) {
        var userWrapper = component.get('v.userWrapper');
        if(!$A.util.isUndefinedOrNull(userWrapper.user) && !$A.util.isEmpty(userWrapper.userType)){
            var userEvent = $A.get("e.c:A18_AssetTrackerUserInfoEvent");
            var user = component.get("v.userWrapper.user");
            var userType = component.get("v.userWrapper.userType");
            userEvent.setParam("userType", userType);
            userEvent.setParam("user", user);
            userEvent.fire();
        }
    },
    toggleDropdown : function(component, event, helper) {
        var dropdownVisible = component.get('v.dropdownVisible');
        component.set('v.dropdownVisible', !dropdownVisible);
    }
})