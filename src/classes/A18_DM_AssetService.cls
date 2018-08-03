/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_DM_AssetService {

    private A18_DA_AssetService DAAssetService;

    public A18_DM_AssetService() {
        this.DAAssetService = new A18_DA_AssetService();
    }

    public static void addAsset(Asset__c asset) {
        A18_DA_AssetService.addAsset(asset);
    }

    public static void updateAsset(Asset__c asset) {
        A18_DA_AssetService.updateAsset(asset);
    }

    public static void deleteAssets(ID assetId) {
        A18_DA_AssetService.deleteAssets(assetId);
    }

    public static List<Asset__c> getAssets() {
        return A18_DA_AssetService.getAssets();
    }

    public List<Schema.RecordTypeInfo> getAssetRecordTypes() {
        return DAAssetService.getAssetRecordTypes();
    }

    public  List<Asset__c> searchAssets(String searchPhrase, Id recordTypeId) {
        return  DAAssetService.searchAssets(searchPhrase, recordTypeId);
    }

    public static List<Asset__c> getAssetsAssignedToUser(Id userId) {
        return A18_DA_AssetService.getAssetsAssignedToUser(userId);
    }
}