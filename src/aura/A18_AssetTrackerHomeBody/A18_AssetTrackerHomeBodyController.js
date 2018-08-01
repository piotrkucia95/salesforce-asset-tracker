/**
 * Created by Piotr Kucia on 31.07.2018.
 */
({
    handleUserInfoEvent : function(component, event, handler) {
        var user = event.getParam("user");
        var userType = event.getParam("userType");

        component.set("v.user", user);
        component.set("v.userType", userType);
    },
    showModal : function(component, event, handler) {
        var childComponent = component.find("requestModal");
        childComponent.toggleModal();
    }
})