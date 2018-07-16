/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_VFC_AssetController {

    private A18_CS_AssetService CSAssetService;

    public A18_VFC_AssetController(){
        this.CSAssetService = new A18_CS_AssetService();
    }

    public void addAsset(A18_DTO.Asset assetDTO){
        CSAssetService.addAsset(assetDTO);
    }

    public void updateAsset(A18_DTO.Asset assetDTO){

    }

    public void deleteAsset(ID assetId){
        CSAssetService.deleteAssets(assetId);
    }

    public List<A18_DTO.Asset> getAssets(){
        return CSAssetService.getAssets();
    }

    public List<A18_DTO.AssetRecordType> getAssetRecordTypes(){

        //temporarily
        return NULL;

    }

    public List<A18_DTO.Asset> searchAssets(String searchPhrase, ID recordTypeId){

        //temporarily
        return NULL;

    }

}