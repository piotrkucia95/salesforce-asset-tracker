/**
 * Created by Piotr Kucia on 01.08.2018.
 */
({
    toggleModal : function(component, event, helper){
        var modalVisible = component.get('v.modalVisible');
        modalVisible = !modalVisible;
        component.set("v.modalVisible", modalVisible);
        if(!modalVisible) {
            var childComponent = component.find("requestForm");
            childComponent.handleCancel();
        }
    },
    saveRequest : function(component, event, helper) {
        var childComponent = component.find("requestForm");
        childComponent.handleSaveRequest();
    }
})