/**
 * Created by Piotr Kucia on 15.07.18.
 */

@IsTest
private class A18_AC_AssetControllerTest {

    static testMethod void testAddAsset() {
        A18_AC_AssetController assetController = new A18_AC_AssetController();
        A18_DTO.Asset testDTO = new A18_DTO.Asset();

        testDTO.description = '50';
        testDTO.dueDate = Date.today();
        testDTO.invoiceNumber = '';
        testDTO.price = 0;
        testDTO.purchaseDate = Date.today();

        assetController.addAsset(testDTO);
    }

    static testMethod void testUpdateAsset() {
        A18_AC_AssetController assetController = new A18_AC_AssetController();
        A18_DTO.Asset testDTO = new A18_DTO.Asset();

        testDTO.description = '50';
        testDTO.dueDate = Date.today();
        testDTO.invoiceNumber = '';
        testDTO.price = 0;
        testDTO.purchaseDate = Date.today();

        assetController.updateAsset(testDTO);
    }

    static testMethod void testDeleteAsset() {
        A18_AC_AssetController assetController = new A18_AC_AssetController();
        assetController.deleteAsset('5003000000D8cuI');
    }

    static testMethod void testGetAssets() {
        A18_AC_AssetController assetController = new A18_AC_AssetController();
        assetController.getAssets();
    }

    static testMethod void testGetAssetRecordTypes() {
        A18_AC_AssetController assetController = new A18_AC_AssetController();
        assetController.getAssetRecordTypes();
    }

    static testMethod void testSearchAssets() {
        A18_AC_AssetController assetController = new A18_AC_AssetController();
        assetController.searchAssets('Computer', '5003000000D8cuI');
    }
}