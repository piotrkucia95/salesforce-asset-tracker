/**
 * Created by Piotr Kucia on 04.08.18.
 */
({
    //TODO AssetToUserList
    //TODO Implement search methods
    //TODO Responsiveness and stylization
    //TODO Pagination and List Sorting
    //TODO remove hardcoding - URL adresses, labels etc.
    //TODO Add comments!
    handleAddAsset : function(component, event, helper) {
        var validRequest = component.find('assetform').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);

        if(validRequest) {
            var newAsset = component.get("v.newAsset");
            var createEvent = component.getEvent("addAsset");
            console.log(newAsset);
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
        component.set("v.newAsset",{
                                'name': '',
                                'description': '',
                                'dueDate': '',
                                'invoiceNumber': '',
                                'price': '',
                                'purchaseDate': '',
                                'isBroken': ''});
    },
})