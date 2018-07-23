/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_AC_AssetController {

    static A18_CS_AssetService CSAssetService;

    public A18_AC_AssetController(){
        CSAssetService = new A18_CS_AssetService();
    }

    public static void addAsset(A18_DTO.Asset assetDTO){
        CSAssetService.addAsset(assetDTO);
    }

    public void updateAsset(A18_DTO.Asset assetDTO){
        CSAssetService.updateAsset(assetDTO);
    }

    public void deleteAsset(ID assetId){
        CSAssetService.deleteAssets(assetId);
    }

    public List<A18_DTO.Asset> getAssets(){
        return CSAssetService.getAssets();
    }

    public List<A18_DTO.AssetRecordType> getAssetRecordTypes(){
        return CSAssetService.getAssetRecordTypes();
    }

    public List<A18_DTO.Asset> searchAssets(String searchPhrase, ID recordTypeId){
        return CSAssetService.searchAssets(searchPhrase, recordTypeId);
    }

    @AuraEnabled
    public static User getCurrentUser(){
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
            dtoMap = (Map<String,String>)JSON.deserializeUntyped(dtoString);

            A18_DTO.Asset dtoAsset = new A18_DTO.Asset();

            dtoAsset.name = dtoMap.get('name');
            dtoAsset.description = dtoMap.get('description');
            dtoAsset.dueDate = Date.valueOf(dtoMap.get('dueDate'));
            dtoAsset.invoiceNumber = dtoMap.get('invoiceNumber');
            dtoAsset.price = Decimal.valueOf(dtoMap.get('price'));
            dtoAsset.purchaseDate = Date.valueOf(dtoMap.get('purchaseDate'));

            System.debug(dtoAsset);

            addAsset(dtoAsset);
        } catch(Exception e) {
            throw new AuraHandledException('Error: ' + e.getMessage());
        }
    }

}