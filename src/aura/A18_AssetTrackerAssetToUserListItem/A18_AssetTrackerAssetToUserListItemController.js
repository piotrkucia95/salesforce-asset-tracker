/**
 * Created by Piotr Kucia on 06.08.18.
 */
({
    init : function(component, event, helper) {
        var assetUserObject = JSON.parse(component.get('v.assetUserJSON'));
        component.set('v.assetUser', assetUserObject);
    },
    showEditModal : function(component, event, helper) {
        var modalVisible = !component.get('v.editModalVisible');
        component.set('v.editModalVisible', modalVisible);
    },
    showDeleteModal : function(component, event, helper) {
        var modalVisible = !component.get('v.deleteModalVisible');
        component.set('v.deleteModalVisible', modalVisible);
        component.set('v.assetUserDeletedFlag', false);
    },
    deleteAssetUser : function(component, event, helper) {
        var assetUser = component.get('v.assetUser');
        component.set('v.assetUserDeletedFlag', true);
        var createEvent = component.getEvent("deleteAssetUser");
        createEvent.setParams({ "assetUserId": assetUser.id });
        createEvent.fire();
    },
})