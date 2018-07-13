/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_DA_AssetUserService {

    public void addAssetUser(Asset_To_User__c assetToUser) {
        insert assetToUser;
    }

    public void updateAssetUser(Asset_To_User__c assetToUser) {
        upsert assetToUser;
    }

    public void deleteAssetUser(ID assetToUserId) {
        delete [SELECT Id FROM Asset_To_User__c WHERE Id = :assetToUserId];
    }

    public List<Schema.PicklistEntry> getAssetStatuses() {
        return Asset_To_User__c.Status__c.getDescribe().getPicklistValues();
    }

    //TO FINISH
    public List<Asset_To_User__c> searchAssetUsers(String searchPhrase, String status) {
        List<Schema.PicklistEntry> statusValues = Asset_To_User__c.Status__c.getDescribe().getPicklistValues();
        List<String> validStatuses = new List<String>();

        for (Schema.PicklistEntry statusValue : statusValues) {
            validStatuses.add(statusValue.getValue());
        }

        Asset_User_Search_Settings__c searchSetting = Asset_User_Search_Settings__c.getInstance();
        String searchFields = validateOrderFields(searchSetting.Search_Fields__c.split(';'));
        //String orderFields = validateSearchFields(searchSetting.Order_Fields__c.split(';'));
        String orderDirection = validateOrderDirection(searchSetting.Order_Direction__c);

        //Compose the query
        /*String query = 'select Id, Name, Description, User__c, Asset__c, Status__c from Asset_To_User__c where (';
        query += searchFields.get(0) + 'like \'%' + searchPhrase + '%\'';
        searchFields.remove(0);
        for(String field : searchFields){
            query += 'or ' + field + 'like \'%' + searchPhrase + '%\'';
        }

        query += 'and Status__c = \'' + status + '\' ';

        query += 'order by '+ orderFields.get(0);
        orderFields.remove(0);

        if(status == NULL || !validStatuses.contains(status) ){
            List<Asset_To_User__c> myQuery = Database.query(query);
            return myQuery;
        } else {
            List<Asset_To_User__c> myQuery = Database.query(query);
            return myQuery;
        }*/
        return null;
    }

    //TODO
    //public String validateSearchFields(List<String> searchFields) {
    //}


    public String validateOrderFields(List<String> orderFields){
        List<String> extraOrderFieldsList = orderFields;
        Set<String> objectFields = Schema.getGlobalDescribe().get('Asset__c')
                .getDescribe().fields.getMap().keySet();

        List<String> orderFieldsList = new List<String>();

        for(String field : extraOrderFieldsList){
            if(objectFields.contains(field)){
                orderFieldsList.add(field);
            }
        }
        if(orderFieldsList.isEmpty()) {
            orderFieldsList.add('Name');
            orderFieldsList.add('Description__c');
        }
        String orderFieldsString = orderFieldsList[0];
        for(Integer i = 1; i<orderFieldsList.size(); i++){
            orderFieldsString += (', ' + orderFieldsList[i]);
        }
        return orderFieldsString;
    }


    public String validateOrderDirection(String orderDirection){
        String direction = orderDirection;
        if(orderDirection == null || (orderDirection!='ASC' && orderDirection!='DESC')) {
            direction = 'ASC';
        }
        return direction;
    }
}
