/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_AC_AssetUserController {

    private A18_CS_AssetUserService CSAssetUserService;

    public A18_AC_AssetUserController() {
        this.CSAssetUserService = new A18_CS_AssetUserService();
    }

    public void assignAssetToUser(ID assetId, ID userId) {

    }

    public void updateAssetToUser(ID assetToUserId, ID assetId, ID userId) {

    }

    public void removeAssetToUser(ID assetToUserId) {

    }

    public List<A18_DTO.AssetStatus> getAssetStatuses() {
        return CSAssetUserService.getAssetStatuses();
    }

    public List<A18_DTO.AssetUser> searchAssetUsers(String searchPhrase, String status) {

        //temporarily
        return NULL;

    }

}