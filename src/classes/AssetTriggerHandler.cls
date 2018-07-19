/**
 * Created by Piotr Kucia on 18.07.2018.
 */

public with sharing class AssetTriggerHandler {

    public void afterInsert(List<Asset__c> newAssets){
        A18_ES_QRService QRService = new A18_ES_QRService();
        for (Asset__c asset : newAssets) {
            QRService.create(asset.Id);
            asset.QR_Code_URL__c = QRService.getURL(asset.Id);
        }
    }

    public void afterUpdate(List<Asset__c> newAssets) {
        A18_ES_QRService QRService = new A18_ES_QRService();
        for (Asset__c asset : newAssets) {
            QRService.updateQRCode(asset.Id);
            asset.QR_Code_URL__c = QRService.getURL(asset.Id);
        }
    }
}