/**
 * Created by Piotr Kucia on 06.08.18.
 */
({
    handleAddAssetUser : function(component, event, helper) {
        var validAssetUser = component.find('assetuserform').reduce(function (validSoFar, inputCmp) {
          inputCmp.showHelpMessageIfInvalid();
          return validSoFar && inputCmp.get('v.validity').valid;
        }, true);

        if(validAssetUser) {
          var newAssetUser = component.get("v.newAssetUser");
          var createEvent = component.getEvent("addAssetUser");
          createEvent.setParams({ "newAssetUser": newAssetUser });
          createEvent.fire();
          component.set('v.assetUserAddedFlag', true);
        }
    },
    handleEditAssetUser : function(component, event, helper) {
        var validAssetUser = component.find('assetuserform').reduce(function (validSoFar, inputCmp) {
          inputCmp.showHelpMessageIfInvalid();
          return validSoFar && inputCmp.get('v.validity').valid;
        }, true);

        if(validAssetUser) {
          var newAssetUser = component.get("v.newAssetUser");
          var createEvent = component.getEvent("editAssetUser");
          createEvent.setParams({ "newAssetUser": newAssetUser });
          createEvent.fire();
          component.set('v.assetUserEditedFlag', true);
        }
    },
    clickCancel : function(component, event, helper) {
        component.set('v.assetUserAddedFlag', false);
        component.set('v.assetUserEditedFlag', false);
    },
})