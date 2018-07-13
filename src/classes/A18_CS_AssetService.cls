/**
 * Created by Piotr Kucia on 12.07.2018.
 */

public with sharing class A18_CS_AssetService {

    private A18_DM_AssetService DMAssetService;

    public A18_CS_AssetService() {
        this.DMAssetService = new A18_DM_AssetService();
    }

    public void addAsset(A18_DTO.Asset assetDTO) {
        Asset__c asset = A18_AssetAssembler.convertToDomain(assetDTO);
        DMAssetService.addAsset(asset);
    }

    public void updateAsset(A18_DTO.Asset assetDTO) {
        Asset__c asset = A18_AssetAssembler.convertToDomain(assetDTO);
        DMAssetService.updateAsset(asset);
    }

    public void deleteAssets(ID assetId) {
        DMAssetService.deleteAssets(assetId);
    }

    public List<A18_DTO.Asset> getAssets() {
        List<Asset__c> assets = DMAssetService.getAssets();
        List<A18_DTO.Asset> DTOAssets = new List<A18_DTO.Asset>();

        for(Asset__c asset : assets){
            DTOAssets.add(A18_AssetAssembler.convertToDTO(asset));

        }
        return DTOAssets;
    }

    public List<A18_DTO.AssetRecordType> getAssetRecordTypes() {
        List<Schema.RecordTypeInfo> recordTypeList = DMAssetService.getAssetRecordTypes();
        List<A18_DTO.AssetRecordType> DTOAssetRecordTypes = new List<A18_DTO.AssetRecordType>();

        for(Schema.recordTypeInfo recordType : recordTypeList){
            DTOAssetRecordTypes.add(A18_AssetAssembler.convertRecordTypeToDTO(recordType));
        }

        return DTOAssetRecordTypes;
    }

    public List<A18_DTO.Asset> searchAssets(String searchPhrase, ID recordTypeId){
        List<Asset__c> searchResults = DMAssetService.searchAssets(searchPhrase, recordTypeId);
        List<A18_DTO.Asset> DTOFoundAssets = new List<A18_DTO.Asset>();

        for(Asset__c searchResult : searchResults){
            DTOFoundAssets.add(A18_AssetAssembler.convertToDTO(searchResult));
        }
        return DTOFoundAssets;
    }
}