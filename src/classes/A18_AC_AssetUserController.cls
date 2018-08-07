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

    @AuraEnabled
    public static void addAssetUser(String dtoString) {
        try {
            A18_DTO.AssetUser dtoAssetUser = createAssetUserDTOFromJSON(dtoString);
            A18_CS_AssetUserService.addAssetUser(dtoAssetUser);
        } catch(Exception e) {
            throw new AuraHandledException('Error: ' + e.getMessage());
        }
    }

    @AuraEnabled
    public static void updateAssetUser(String dtoString) {
        try {
            A18_DTO.AssetUser dtoAssetUser = createAssetUserDTOFromJSON(dtoString);
            A18_CS_AssetUserService.updateAssetUser(dtoAssetUser);
        } catch(Exception e) {
            throw new AuraHandledException('Error: ' + e.getMessage());
        }
    }

    @AuraEnabled
    public static void deleteAssetUser(ID assetToUserId) {
        try {
            A18_CS_AssetUserService.deleteAssetUser(assetToUserId);
        } catch(Exception e) {
            throw new AuraHandledException('Error: ' + e.getMessage());
        }
    }

    @AuraEnabled
    public static List<String> searchAssetUsers(String searchPhrase, String status) {
        System.debug('searchPhrase = '+searchPhrase);
        System.debug('status = '+status);
        List<A18_DTO.AssetUser> assetUsersDTO = A18_CS_AssetUserService.searchAssetUsers(searchPhrase, status);
        List<String> DTOStrings = new List<String>();
        for(A18_DTO.AssetUser assetUserDTO : assetUsersDTO) {
            DTOStrings.add(JSON.serialize(assetUserDTO));
        }
        return DTOStrings;
    }

    public List<A18_DTO.AssetStatus> getAssetStatuses() {
        return CSAssetUserService.getAssetStatuses();
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