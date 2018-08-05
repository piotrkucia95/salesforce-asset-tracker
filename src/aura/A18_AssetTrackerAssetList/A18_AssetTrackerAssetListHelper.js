/**
 * Created by Piotr Kucia on 05.08.18.
 */
({
    createAsset : function(component, newAsset) {
        var action = component.get("c.addAsset");
        var newAssetJSONString = JSON.stringify(newAsset);
        action.setParams({
            "dtoString": newAssetJSONString
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("Success");
                var assetArray = component.get('v.assets');
                assetArray.push(newAssetJSONString);
                component.set('v.assets', assetArray);
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    editAsset : function(component, newAsset) {
        var action = component.get("c.updateAsset");
        var newAssetJSONString = JSON.stringify(newAsset);
        action.setParams({
            "dtoString": newAssetJSONString
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("Success");
                var assetArray = component.get('v.assets');
                for(var i=0; i<assetArray.length; i++) {
                    var a = assetArray[i].search(newAsset.id);
                    if(a != -1) {
                        assetArray.splice(i, 1, newAssetJSONString);
                        component.set('v.assets', assetArray);
                    }
                }
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    deleteAsset : function(component, assetId) {
        var action = component.get("c.deleteAsset");
        action.setParams({
            "assetId": assetId
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("Success");
                var assetArray = component.get('v.assets');
                for(var i=0; i<assetArray.length; i++) {
                    var a = assetArray[i].search(assetId);
                    if(a != -1) {
                        assetArray.splice(i, 1);
                        component.set('v.assets', assetArray);
                    }
                }
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
})