/**
 * Created by Piotr Kucia on 12.07.2018.
 */

public with sharing class A18_DTO {

    public class Asset {
        @AuraEnabled public String name{get; set;}
        @AuraEnabled public Id id{get; set;}
        @AuraEnabled public String description{get; set;}
        @AuraEnabled public Date dueDate{get; set;}
        @AuraEnabled public String invoiceNumber{get; set;}
        @AuraEnabled public Decimal price{get; set;}
        @AuraEnabled public Date purchaseDate{get; set;}
    }

    public class AssetRecordType {
        public ID id;
        public String label;
    }

    public class AssetFilter {

    }

    public class AssetStatus {
        public String value;
        public String label;
    }


    public class AssetUser {
        public ID assetId;
        public Date startDate;
        public Date endDate;
        public String status;
        public ID userId;
    }

}