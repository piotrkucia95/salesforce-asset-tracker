/**
 * Created by Piotr Kucia on 03.08.2018.
 */
({
    init : function(component, event, helper) {
        var assetObject = JSON.parse(component.get('v.assetJSON'));
        component.set('v.asset', assetObject);
    },
    getQR : function(component, event, helper) {
        var action = component.get('c.getAssetQRCode');
        console.log(assetId);
        action.setParams({
            "assetId": assetId
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                window.open('https://pkucia-dev-ed--c.eu10.content.force.com/servlet/servlet.FileDownload?file='+response.getReturnValue()+'&operationContext=S1' , '_blank');
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    showEditModal : function(component, event, helper) {
        var modalVisible = !component.get('v.editModalVisible');
        component.set('v.editModalVisible', modalVisible);
    },
    showDeleteModal : function(component, event, helper) {
        var modalVisible = !component.get('v.deleteModalVisible');
        component.set('v.deleteModalVisible', modalVisible);
        component.set('v.assetDeletedFlag', false);
    },
    deleteAsset : function(component, event, helper) {
        var asset = component.get('v.asset');
        component.set('v.assetDeletedFlag', true);
        var createEvent = component.getEvent("deleteAsset");
        createEvent.setParams({ "assetId": asset.id });
        createEvent.fire();
    },
})