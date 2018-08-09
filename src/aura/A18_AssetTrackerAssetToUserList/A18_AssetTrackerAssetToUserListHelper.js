/**
 * Created by Piotr Kucia on 06.08.18.
 */
({
    //sends request to add asset to user and adds one to local list
    createAssetUser : function(component, newAssetUser) {
        var action = component.get("c.addAssetUser");
        var newAssetUserJSON = JSON.stringify(newAssetUser);
        action.setParams({
            "dtoString": newAssetUserJSON
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var assetUserArray = component.get('v.assetUsers');
                assetUserArray.push(newAssetUserJSON);
                component.set('v.assetUsers', assetUserArray);
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    //sends request to edit asset to user and updates one in local list
    editAssetUser : function(component, newAssetUser) {
        var action = component.get("c.updateAssetUser");
        var newAssetUserJSON = JSON.stringify(newAssetUser);
        action.setParams({
            "dtoString": newAssetUserJSON
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var assetUserArray = component.get('v.assetUsers');
                for(var i=0; i<assetUserArray.length; i++) {
                    var a = assetUserArray[i].search(newAssetUser.id);
                    if(a != -1) {
                        assetUserArray.splice(i, 1, newAssetUserJSON);
                        component.set('v.assetUsers', assetUserArray);
                    }
                }
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    //sends request to delete asset to user and removes one from local list
    deleteAssetUser : function(component, assetUserId) {
        var action = component.get("c.deleteAssetUser");
        action.setParams({
            "assetToUserId": assetUserId
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var assetUserArray = component.get('v.assetUsers');
                for(var i=0; i<assetUserArray.length; i++) {
                    var a = assetUserArray[i].search(assetUserId);
                    if(a != -1) {
                        assetUserArray.splice(i, 1);
                        component.set('v.assetUsers', assetUserArray);
                    }
                }
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
})