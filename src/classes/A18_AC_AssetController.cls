/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_AC_AssetController {

    private A18_CS_AssetService CSAssetService;

    public A18_AC_AssetController() {
        CSAssetService = new A18_CS_AssetService();
    }

    public static void addAsset(A18_DTO.Asset assetDTO) {
        A18_CS_AssetService.addAsset(assetDTO);
    }

    public void updateAsset(A18_DTO.Asset assetDTO) {
        CSAssetService.updateAsset(assetDTO);
    }

    public void deleteAsset(ID assetId) {
        CSAssetService.deleteAssets(assetId);
    }

    public List<A18_DTO.Asset> getAssets() {
        return CSAssetService.getAssets();
    }

    public List<A18_DTO.AssetRecordType> getAssetRecordTypes() {
        return CSAssetService.getAssetRecordTypes();
    }

    public List<A18_DTO.Asset> searchAssets(String searchPhrase, ID recordTypeId) {
        return CSAssetService.searchAssets(searchPhrase, recordTypeId);
    }

    @AuraEnabled
    public static User getCurrentUser() {
        try {
            User newUser = new User();
            newUser.FirstName = UserInfo.getFirstName();
            newUser.LastName = UserInfo.getLastName();
            newUser.Id = UserInfo.getUserId();
            newUser.Email = UserInfo.getUserEmail();
            return newUser;
        } catch(Exception e) {
            throw new AuraHandledException('Error: ' + e.getMessage());
        }
    }

    @AuraEnabled
    public static void createAssetFromJSONString(String dtoString) {
        try {
            Map<String,String> dtoMap = new Map<String,String>();
            dtoMap = (Map<String,String>)System.JSON.deserialize(dtoString,Map<String,String>.class);
            A18_DTO.Asset dtoAsset = new A18_DTO.Asset();

            if(dtoMap.get('name') != NULL) dtoAsset.name = dtoMap.get('name');
            if(dtoMap.get('description') != NULL) dtoAsset.description = dtoMap.get('description');
            if(dtoMap.get('dueDate') != NULL) dtoAsset.dueDate = Date.valueOf(dtoMap.get('dueDate'));
            if(dtoMap.get('invoiceNumber') != NULL) dtoAsset.invoiceNumber = dtoMap.get('invoiceNumber');
            if(dtoMap.get('price') != NULL) dtoAsset.price = Decimal.valueOf(dtoMap.get('price'));
            if(dtoMap.get('purchaseDate') != NULL) dtoAsset.purchaseDate = Date.valueOf(dtoMap.get('purchaseDate'));

            addAsset(dtoAsset);

        } catch(Exception e) {
            throw new AuraHandledException('Error: ' + e.getMessage());
        }
    }

    @AuraEnabled
    public static String checkUserGroup(){
        Id currentUserId = (Id)UserInfo.getUserId();
        List<GroupMember> assetCoordinators = [SELECT UserOrGroupId FROM GroupMember WHERE GroupId IN
                                                            (SELECT Id FROM Group WHERE DeveloperName = 'Fixed_asset_coordinators')];
        List<GroupMember> assetAdmins = [SELECT UserOrGroupId FROM GroupMember WHERE GroupId IN
                                                            (SELECT Id FROM Group WHERE DeveloperName = 'Fixed_asset_admins')];
        for(GroupMember member : assetAdmins) {
            if(member.UserOrGroupId == currentUserId){
                return 'Asset Admin';
            }
        }
        for(GroupMember member : assetCoordinators) {
            if(member.UserOrGroupId == currentUserId){
                return 'Asset Coordinator';
            }
        }
        return 'Employee';
    }

    @AuraEnabled
    public static List<String> getAssetsAssignedToUser(String userId) {
        List<A18_DTO.Asset> assetsDTO = A18_CS_AssetService.getAssetsAssignedToUser((Id)userId);
        List<String> DTOStrings = new List<String>();

        for(A18_DTO.Asset assetDTO : assetsDTO) {
            DTOStrings.add(JSON.serialize(assetDTO));
        }
        System.debug(DTOStrings);
        return DTOStrings;
    }

}