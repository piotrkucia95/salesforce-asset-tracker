/**
 * Created by Piotr Kucia on 06.08.18.
 */
({
    //gets asset to user list fromm backend (json)
    init : function(component, event, helper) {
        var action = component.get("c.getAssetUsers");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.assetUsers", response.getReturnValue());
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    //displays add asset to user modal
    showModal : function(component, event, handler) {
        var childComponent = component.find("assetUserModal");
        childComponent.toggleModal();
    },
    handleAddAssetUser : function(component, event, helper) {
        var newAssetUser = event.getParam("newAssetUser");
        helper.createAssetUser(component, newAssetUser);
    },
    handleEditAssetUser : function(component, event, helper) {
        var newAssetUser = event.getParam("newAssetUser");
        helper.editAssetUser(component, newAssetUser);
    },
    handleDeleteAssetUser : function(component, event, helper) {
        var assetUserId = event.getParam("assetUserId");
        helper.deleteAssetUser(component, assetUserId);
    },
    //gets searched assets to users from backend (json)
    assetUserSearch : function(component, event, helper) {
        var searchPhrase = component.get('v.assetUserSearchPhrase');
        var action = component.get("c.searchAssetUsers");
        action.setParams({
            "searchPhrase" : searchPhrase,
            "status" : null
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.assetUsers", response.getReturnValue());
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
})