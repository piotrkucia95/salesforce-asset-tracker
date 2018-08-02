/**
 * Created by Polsource on 02.08.2018.
 */
({
    init : function(component, event, helper) {
        var assetObject = JSON.parse(component.get('v.assetJSON'));
        component.set('v.asset', assetObject);
    },
    markAsBroken : function(component, event, helper) {
        var asset = component.get("v.asset");
        var createEvent = component.getEvent("assetBroken");
        createEvent.setParams({ "asset": asset });
        createEvent.fire();
    }
})