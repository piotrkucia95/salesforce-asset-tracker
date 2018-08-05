/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_AC_AssetUserController {

    private A18_CS_AssetUserService CSAssetUserService;

    public A18_AC_AssetUserController() {
        this.CSAssetUserService = new A18_CS_AssetUserService();
    }

    public static A18_DTO.AssetUser createAssetUserDTOFromJSON(String JSONString) {
        Map<String,String> dtoMap = new Map<String,String>();
        dtoMap = (Map<String,String>)System.JSON.deserialize(JSONString,Map<String,String>.class);
        A18_DTO.AssetUser dtoAssetUser = new A18_DTO.AssetUser();

        if(dtoMap.get('name') != NULL) dtoAssetUser.name = dtoMap.get('name');
        if(dtoMap.get('id') != NULL) dtoAssetUser.id = dtoMap.get('id');
        if(dtoMap.get('assetId') != NULL) dtoAssetUser.assetId = dtoMap.get('assetId');
        if(dtoMap.get('userId') != NULL) dtoAssetUser.userId = dtoMap.get('userId');
        if(dtoMap.get('startDate') != NULL) dtoAssetUser.startDate = Date.valueOf(dtoMap.get('startDate'));
        if(dtoMap.get('endDate') != NULL) dtoAssetUser.endDate = Date.valueOf(dtoMap.get('endDate'));
        if(dtoMap.get('status') != NULL) dtoAssetUser.status = dtoMap.get('status');

        return dtoAssetUser;
    }

    public static void addAssetUser(A18_DTO.AssetUser assetUserDTO) {
        //A18_CS_AssetUserService.addAssetUser(assetUserDTO);
    }

    public void updateAssetUser(A18_DTO.AssetUser assetUserDTO) {
        CSAssetUserService.updateAssetUser(assetUserDTO);
    }

    public void deleteAssetUser(ID assetToUserId) {
        CSAssetUserService.deleteAssetUser(assetToUserId);
    }

    public List<A18_DTO.AssetStatus> getAssetStatuses() {
        return CSAssetUserService.getAssetStatuses();
    }

    public List<A18_DTO.AssetUser> searchAssetUsers(String searchPhrase, String status) {
        return CSAssetUserService.searchAssetUsers(searchPhrase, status);
    }

    @AuraEnabled
    public static List<String> getAssetUsers() {
        List<A18_DTO.AssetUser> assetUsersDTO = A18_CS_AssetUserService.getAssetUsers();
        List<String> DTOStrings = new List<String>();
        for(A18_DTO.AssetUser assetUserDTO : assetUsersDTO) {
            DTOStrings.add(JSON.serialize(assetUserDTO));
        }
        return DTOStrings;
    }
}