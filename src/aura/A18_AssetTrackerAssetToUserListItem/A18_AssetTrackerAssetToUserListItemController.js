/**
 * Created by Piotr Kucia on 06.08.18.
 */
({
    init : function(component, event, helper) {
        var assetUserObject = JSON.parse(component.get('v.assetUserJSON'));
        component.set('v.assetUser', assetUserObject);
    },
})