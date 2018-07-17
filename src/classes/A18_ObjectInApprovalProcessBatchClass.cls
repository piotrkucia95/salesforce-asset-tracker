/**
 * Created by Piotr Kucia on 17.07.2018.
 */

global class A18_ObjectInApprovalProcessBatchClass implements Database.Batchable<sObject> {
    String query;

    public A18_ObjectInApprovalProcessBatchClass() {
        Approval_Process_Settings__c APSettings = Approval_Process_Settings__c.getInstance();
        Integer daysLimit = (Integer)APSettings.Maximum_Days_In_AP__c;
        this.query = 'SELECT ActorId FROM ProcessInstanceWorkItem WHERE ElapsedTimeInDays > ' +daysLimit;
    }

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext bc, List<sObject> scope) {
        List<ProcessInstanceWorkItem> APList = (List<ProcessInstanceWorkItem>)scope;
        List<Id> approverList = new List<Id>();

        for(ProcessInstanceWorkItem APItem : APList) {
            approverList.add(APItem.ActorId);
        }

        List<User> mailToUserList = [SELECT email FROM User WHERE Id IN :approverList];
        List<String> mailToAddressList = new List<String>();
        //creation of a list of approvers' emails
        for(User u : mailToUserList){
            mailToAddressList.add(u.email);
        }

        if(mailToAddressList.isEmpty()) return;
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(mailToAddressList);
        mail.setCcAddresses(mailToAddressList);
        mail.setReplyTo('p.kucia@polource.com');
        mail.setSenderDisplayName('Salesforce Support');
        mail.setSubject('Object In Approval Process For Too Long');
        mail.setPlainTextBody('You have object pending in approval process for too long');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

    global void finish(Database.BatchableContext bc) {}
}