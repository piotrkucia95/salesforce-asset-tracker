/**
 * Created by Piotr Kucia on 04.08.18.
 */
({
    //TODO Responsiveness
    //TODO Implement search methods
    //TODO Remove hardcoding in URL addresses, labels etc.
    //TODO Remove Console logs and System debugs
    //TODO Add comments!
    //TODO Create records for all objects, implement approval process

    handleAddAsset : function(component, event, helper) {
        var validAsset = component.find('assetform').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);

        if(validAsset) {
            var newAsset = component.get("v.newAsset");
            var createEvent = component.getEvent("addAsset");
            createEvent.setParams({ "newAsset": newAsset });
            createEvent.fire();
            component.set('v.assetAddedFlag', true);
        }
    },
    handleEditAsset : function(component, event, helper) {
        var validRequest = component.find('assetform').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);

        if(validRequest) {
            var newAsset = component.get("v.newAsset");
            var createEvent = component.getEvent("editAsset");
            createEvent.setParams({ "newAsset": newAsset });
            createEvent.fire();
            component.set('v.assetEditedFlag', true);
        }
    },
    checkIsBroken : function(component, event, handler) {
        var isBroken = !component.get('v.newAsset.isBroken');
        component.set('v.newAsset.isBroken', isBroken);
    },
    clickCancel : function(component, event, helper) {
        component.set('v.assetAddedFlag', false);
        component.set('v.assetEditedFlag', false);
    },
})