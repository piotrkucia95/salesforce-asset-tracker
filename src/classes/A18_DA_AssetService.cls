/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_DA_AssetService {

    //public Asset_Search_Settings__c setti;

    public static void addAsset(Asset__c asset) {
        insert asset;
    }

    public void updateAsset(Asset__c asset) {
        upsert asset;
    }

    public void deleteAssets(ID assetId) {
        delete [SELECT Id FROM Asset__c WHERE Id = :assetId];
    }

    public List<Asset__c> getAssets() {
        return [SELECT Name, Description__c, Due_Date__c, Purchase_Date__c, Price__c, Invoice_Number__c FROM Asset__c];
    }

    public List<Schema.RecordTypeInfo> getAssetRecordTypes() {
        return Asset__c.SObjectType.getDescribe().getRecordTypeInfos();
    }
    
    public List<Asset__c> searchAssets(String searchPhrase, Id recordTypeId){
        List<Schema.RecordTypeInfo> recordTypeInfos = Asset__c.SObjectType.getDescribe().getRecordTypeInfos();
        List<Id> validId = new List<Id>();

        for(Schema.RecordTypeInfo recordTypeInfo : recordTypeInfos){
            validId.add(recordTypeInfo.getRecordTypeId());
        }

        //obtaining the data of Asset's order
        Asset_Search_Settings__c searchSetting = Asset_Search_Settings__c.getInstance();
        String orderField = A18_CustomSettingsValidation.validateQueryFields(searchSetting.Order_Field__c.split(';'), 'Asset');
        String orderDirection = A18_CustomSettingsValidation.validateQueryDirection(searchSetting.Order_Direction__c);

        if(recordTypeId == NULL || !validId.contains(recordTypeId) ){
            List<List<Asset__c>> myQuery = search.query('FIND\'%'+searchPhrase+'%\' IN ALL FIELDS RETURNING Asset__c(Name, Description__c, Due_Date__c, Invoice_Number__c, Price__c, Purchase_Date__c ORDER BY '+orderField +' '+orderDirection +')');
            return myQuery[0];
        } else {
            List<List<Asset__c>> myQuery = search.query('FIND\'%'+searchPhrase+'%\'IN ALL FIELDS RETURNING Asset__c(Name, Description__c, Due_Date__c, Invoice_Number__c, Price__c, Purchase_Date__c ORDER BY '+orderField +' '+orderDirection +') WITH RecordTypeId= ' +recordTypeId);
            return myQuery[0];
        }
    }
}