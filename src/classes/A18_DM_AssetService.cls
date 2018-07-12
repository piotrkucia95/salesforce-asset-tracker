/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_DM_AssetService {

    private A18_DA_AssetService DAAssetService;

    public A18_DM_AssetService() {
        this.DAAssetService = new A18_DA_AssetService();
    }

    public void addAsset(Asset__c asset) {
        DAAssetService.addAsset(asset);
    }

    public void updateAsset(Asset__c asset) {
        DAAssetService.updateAsset(asset);
    }

    public void deleteAssets(ID assetId) {
        DAAssetService.deleteAssets(assetId);
    }

    public List<Asset__c> getAssets() {
        return DAAssetService.getAssets();
    }

    public List<Schema.RecordTypeInfo> getAssetRecordTypes() {
        return DAAssetService.getAssetRecordTypes();
    }
}