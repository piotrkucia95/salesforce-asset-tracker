/**
 * Created by Piotr Kucia on 23.07.2018.
 */
({
    clickAdd: function(component, event, helper) {
//        var validAsset = component.find('assetform').reduce(function (validSoFar, inputCmp) {
//            inputCmp.showHelpMessageIfInvalid();
//            return validSoFar && inputCmp.get('v.validity').valid;
//        }, true);
//
//        if(validAsset){
                var newAsset = component.get("v.newAsset");
                helper.createAsset(component, newAsset);
//        }
    },
    clickCancel : function(component, event, helper) {
        component.set("v.newAsset.name", "");
    },
})