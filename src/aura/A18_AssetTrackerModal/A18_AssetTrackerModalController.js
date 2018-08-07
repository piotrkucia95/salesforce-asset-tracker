/**
 * Created by Piotr Kucia on 01.08.2018.
 */
({
    toggleModal : function(component, event, helper){
        var modalVisible = component.get('v.modalVisible');
        modalVisible = !modalVisible;
        component.set("v.modalVisible", modalVisible);
        if(!modalVisible ) {
            if(component.get('v.objectType') == 'Request') var childComponent = component.find("requestForm");
            else if(component.get('v.objectType') == 'Asset') var childComponent = component.find("assetForm");
            else if(component.get('v.objectType') == 'Asset To User') var childComponent = component.find("assetToUserForm");
            childComponent.handleCancel();
        }
    },
    saveRequest : function(component, event, helper) {
        var childComponent = component.find("requestForm");
        childComponent.handleSaveRequest();
    },
    addAsset : function(component, event, helper) {
        var childComponent = component.find("assetForm");
        childComponent.handleAddAsset();
    },
    editAsset : function(component, event, helper) {
        var childComponent = component.find("assetForm");
        childComponent.handleEditAsset();
        component.set('v.editFlag', false);
    },
    addAssetUser : function(component, event, helper) {
        var childComponent = component.find("assetToUserForm");
        childComponent.handleAddAssetUser();
    },
    editAssetUser : function(component, event, helper) {
        var childComponent = component.find("assetToUserForm");
        childComponent.handleEditAssetUser();
        component.set('v.editFlag', false);
    },
})