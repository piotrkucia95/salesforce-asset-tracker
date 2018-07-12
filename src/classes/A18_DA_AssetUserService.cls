/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_DA_AssetUserService {

    public void addAssetToUser(Asset_To_User__c assetToUser) {
        insert assetToUser;
    }

    public void updateAssetToUser(Asset_To_User__c assetToUser) {
        upsert assetToUser;
    }

    public void deleteAssetsToUser(ID assetToUserId) {
        delete [SELECT Id FROM Asset_To_User__c WHERE Id = :assetToUserId];
    }

    public List<Asset_To_User__c> getAssetsToUsers() {
        return [SELECT Name, Status__c FROM Asset_To_User__c];
    }

    public List<Schema.PicklistEntry> getAssetStatuses() {
        return Asset_To_User__c.Status__c.getDescribe().getPicklistValues();
    }

}