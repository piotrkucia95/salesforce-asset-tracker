/**
 * Created by Piotr Kucia on 23.07.2018.
 */
({
    doInit: function(component, event, helper) {
        var action = component.get("c.getCurrentUser");

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.user", response.getReturnValue());
                console.log(component.get("v.user"));
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    handleAddAsset : function(component, event, helper) {
        var newAsset = event.getParam("newAsset");
        helper.createAsset(component, newAsset);
        component.set("v.newAsset",{
                                'name': '',
                                'description': '',
                                'dueDate': '',
                                'invoiceNumber': '',
                                'price': '',
                                'purchaseDate': ''});
    },
})