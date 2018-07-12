/**
 * Created by Piotr Kucia on 12.07.2018.
 */

public with sharing class A18_DTO {

    public class Asset {
        public String description;
        public Date dueDate;
        public String invoiceNumber;
        public Decimal price;
        public Date purchaseDate;
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