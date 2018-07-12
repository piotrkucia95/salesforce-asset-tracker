/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_DA_AssetService {

    public void addAsset(Asset__c asset) {
        insert asset;
    }

    public void updateAsset(Asset__c asset) {
        upsert asset;
    }

    public void deleteAssets(ID assetId) {
        delete [SELECT Id FROM Asset__c WHERE Id = :assetId];
    }

    public List<Asset__c> getAssets() {
        return [SELECT Description__c, Due_Date__c, Purchase_Date__c, Price__c, Invoice_Number__c FROM Asset__c];
    }

    public List<Schema.RecordTypeInfo> getAssetRecordTypes() {
        return Asset__c.SObjectType.getDescribe().getRecordTypeInfos();
    }

}