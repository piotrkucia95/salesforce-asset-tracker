/**
 * Created by Piotr Kucia on 12.07.2018.
 */

public with sharing class A18_AssetAssembler {

    public static A18_DTO.Asset convertToDTO(Asset__c asset){
        A18_DTO.Asset DTOAsset = new A18_DTO.Asset();

        DTOAsset.description = asset.Description__c;
        DTOAsset.dueDate = asset.Due_Date__c;
        DTOAsset.invoiceNumber = asset.Invoice_Number__c;
        DTOAsset.price = asset.Price__c;
        DTOAsset.purchaseDate = asset.Purchase_Date__c;

        return DTOAsset;
    }

    public static Asset__c convertToDomain(A18_DTO.Asset asset){
        Asset__c CAsset = new Asset__c();

        CAsset.Description__c = asset.description;
        CAsset.Due_Date__c = asset.dueDate;
        CAsset.Purchase_Date__c = asset.purchaseDate;
        CAsset.Price__c = asset.price;
        CAsset.Invoice_Number__c = asset.invoiceNumber;

        return CAsset;
    }

    public static A18_DTO.AssetRecordType convertRecordTypeToDTO(Schema.RecordTypeInfo recordTypeInfo){
        A18_DTO.AssetRecordType DTOAssetRecordType = new A18_DTO.AssetRecordType();

        DTOAssetRecordType.id = recordTypeInfo.getRecordTypeId();
        DTOAssetRecordType.label = recordTypeInfo.getName();

        return DTOAssetRecordType;
    }
}