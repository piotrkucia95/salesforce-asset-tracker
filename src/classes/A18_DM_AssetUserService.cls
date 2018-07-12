/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_DM_AssetUserService {

    private A18_DA_AssetUserService DAAssetUserService;

    public A18_DM_AssetUserService() {
        this.DAAssetUserService = new A18_DA_AssetUserService();
    }

    public List<Schema.PicklistEntry> getAssetStatuses() {
        return DAAssetUserService.getAssetStatuses();
    }
}