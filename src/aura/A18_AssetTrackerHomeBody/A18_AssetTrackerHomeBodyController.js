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
    handleShowModal : function (component, event, helper) {
            var modalBody;
            var modalFooter;
            $A.createComponents([
                ["c:modalContent",{}],
                ["c:modalFooter",{}]
            ],
                                function(components, status){
                                    if (status === "SUCCESS") {
                                        modalBody = components[0];
                                        modalFooter = components[1];
                                        component.find('overlayLib').showCustomModal({
                                            header: "Paginaniton In Lightning",
                                            body: modalBody,
                                            footer: modalFooter,
                                            showCloseButton: true,
                                            cssClass: "my-modal,my-custom-class,my-other-class",
                                            closeCallback: function() {

                                            }
                                        });
                                    }
                                }
                               );
        }
})