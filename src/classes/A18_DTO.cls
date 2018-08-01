/**
 * Created by Piotr Kucia on 12.07.2018.
 */

public with sharing class A18_DTO {

    public class Asset {
        public String name{get; set;}
        //public Id id{get; set;}
        public String description{get; set;}
        public Date dueDate{get; set;}
        public String invoiceNumber{get; set;}
        public Decimal price{get; set;}
        public Date purchaseDate{get; set;}
        public Boolean isBroken{get; set;}
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
        public String name;
        public ID assetId;
        public Date startDate;
        public Date endDate;
        public String status;
        public ID userId;
    }

}