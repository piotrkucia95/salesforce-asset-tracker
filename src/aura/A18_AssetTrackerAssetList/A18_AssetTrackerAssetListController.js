/**
 * Created by Piotr Kucia on 03.08.2018.
 */
({
    //gets list of assets from backend (json format)
    init : function(component, event, helper) {
        var action = component.get("c.getAssets");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.assets", response.getReturnValue());
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    //displays add asset form modal
    showModal : function(component, event, handler) {
        var childComponent = component.find("assetModal");
        childComponent.toggleModal();
    },
    handleAddAsset : function(component, event, helper) {
        var newAsset = event.getParam("newAsset");
        helper.createAsset(component, newAsset);
    },
    handleEditAsset : function(component, event, helper) {
        var newAsset = event.getParam("newAsset");
        helper.editAsset(component, newAsset);
    },
    handleDeleteAsset : function(component, event, helper) {
        var assetId = event.getParam("assetId");
        helper.deleteAsset(component, assetId);
    },
    //gets list of searched assets
    assetSearch : function(component, event, helper) {
        var searchPhrase = component.get('v.assetSearchPhrase');
        var action = component.get("c.searchAssets");
        action.setParams({
            "searchPhrase" : searchPhrase,
            "recordTypeId" : null
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.assets", response.getReturnValue());
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
})