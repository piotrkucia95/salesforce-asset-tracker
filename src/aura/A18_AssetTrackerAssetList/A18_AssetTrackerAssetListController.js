/**
 * Created by Piotr Kucia on 03.08.2018.
 */
({
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
    showModal : function(component, event, handler) {
        console.log('sdafdsfas');
        var childComponent = component.find("assetModal");
        childComponent.toggleModal();
    },
    handleAddAsset : function(component, event, helper) {
        var newAsset = event.getParam("newAsset");
        helper.createAsset(component, newAsset);
        component.set("v.newAsset",{
                        'name': '',
                        'description': '',
                        'dueDate': '',
                        'invoiceNumber': '',
                        'price': '',
                        'purchaseDate': '',
                        'isBroken': ''});
    },
    handleEditAsset : function(component, event, helper) {
        var newAsset = event.getParam("newAsset");
        helper.editAsset(component, newAsset);
        component.set("v.newAsset",{
                        'name': '',
                        'description': '',
                        'dueDate': '',
                        'invoiceNumber': '',
                        'price': '',
                        'purchaseDate': '',
                        'isBroken': ''});
    },
    handleDeleteAsset : function(component, event, helper) {
        var assetId = event.getParam("assetId");
        helper.deleteAsset(component, assetId);
    },
})