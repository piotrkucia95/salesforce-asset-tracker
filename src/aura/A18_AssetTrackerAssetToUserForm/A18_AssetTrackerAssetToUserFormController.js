/**
 * Created by Piotr Kucia on 06.08.18.
 */
({
    //checks if the form is valid and sends event if so
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
    //checks if the form is valid and sends event if so
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
    //sets confirmation flags to false
    clickCancel : function(component, event, helper) {
        component.set('v.assetUserAddedFlag', false);
        component.set('v.assetUserEditedFlag', false);
    },
    handleLookupSelect : function(component, event, helper) {

         var assetId = event.getParam("recordByEvent");
         console.log(assetId);
         component.set('v.newAssetUser.asset', assetId.Id);
    },
})