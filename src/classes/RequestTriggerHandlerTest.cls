/**
 * Created by Piotr Kucia on 16.07.18.
 */

@IsTest
private class RequestTriggerHandlerTest {

    static testMethod void shouldCreateApprovalProcess() {
        //Prepare test data
        Request__c req  = new Request__c(
                Name = 'New Request',
                What__c = 'Something',
                Priority__c = 'Low',
                Status__c = 'New'
        );
        Trigger_Switch__c triggerSwitch = new Trigger_Switch__c(
                RequestTrigger__c = true
        );
        insert triggerSwitch;

        //Perform test
        Test.startTest();
        insert req;
        Test.stopTest();
    }

    //TODO check how to create test for beforeInsert and beforeUpdate triggers
    @IsTest(seeAllData=true) static void shouldCheckRequestLimitForUserRole() {
        //Prepare test data
        Request__c req1  = new Request__c(
                Name = 'New Request',
                What__c = 'Something',
                Priority__c = 'Low',
                Status__c = 'Accepted',
                Value__c = 223400000
        );
        insert req1;

        Trigger_Switch__c triggerSwitch = new Trigger_Switch__c(
                RequestTrigger__c = true
        );
        insert triggerSwitch;

        //Perform test
        req1 = req2;
        Test.startTest();
        update req1;
        Test.stopTest();
    }
}