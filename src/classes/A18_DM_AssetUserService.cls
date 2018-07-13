/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_DM_AssetUserService {

    private A18_DA_AssetUserService DAAssetUserService;

    public A18_DM_AssetUserService() {
        this.DAAssetUserService = new A18_DA_AssetUserService();
    }

    public void addAssetUser(Asset_To_User__c assetToUser) {
        DAAssetUserService.addAssetUser(assetToUser);
    }
    public void updateAssetUser(Asset_To_User__c assetToUser){
        DAAssetUserService.updateAssetUser(assetToUser);
    }

    public void deleteAssetUser(Id assetToUserId) {
        DAAssetUserService.deleteAssetUser(assetToUserId);
    }

    public List<Schema.PicklistEntry> getAssetStatuses() {
        return DAAssetUserService.getAssetStatuses();
    }

    public List<Asset_To_User__c > searchAssetUsers(String searchPhrase, String status) {
        return DAAssetUserService.searchAssetUsers(searchPhrase, status);
    }
}