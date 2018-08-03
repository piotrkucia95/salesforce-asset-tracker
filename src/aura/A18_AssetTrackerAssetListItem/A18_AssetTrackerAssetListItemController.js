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
        var assetId = component.get('v.asset.id');
        console.log(assetId);
        action.setParams({
            "assetId": assetId
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                window.open('https://pkucia-dev-ed--c.eu10.content.force.com/servlet/servlet.FileDownload?file='+response.getReturnValue()+'&operationContext=S1' , '_blank');
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
})