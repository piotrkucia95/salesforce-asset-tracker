/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_ES_QRService {

    static AssetQREndpoint__c QRSettings = AssetQREndpoint__c.getInstance();
    static String endpoint = QRSettings.URL__c;

    public static String getUrl(ID assetId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint + assetId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'SOME QR DATA HERE' key as a String URL Address
            String URL = (String) results.get('SOME QR DATA HERE');
            System.debug('Succesful opperation');
            return URL;
        } else  if(response.getStatusCode() == 400) {
            System.debug('ERROR: Invalid ID supplied');
            return NULL;
        } else  if(response.getStatusCode() == 404) {
            System.debug('ERROR: QR not found');
            return NULL;
        } else {
            System.debug('ERROR: Unexpected error');
            return NULL;
        }
    }

    @future(callout=true)
    public static void create(Id assetId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint + assetId);
        request.setMethod('POST');
        HttpResponse response = http.send(request);
        System.debug('XXXXXXXXX' + endpoint);
        if(response.getStatusCode() == 200){
            Attachment attachment = new Attachment();
            attachment.Name = 'QR Code for asset: ' + assetId;
            attachment.Body = response.getBodyAsBlob();
            attachment.ParentId = assetId;
            System.debug('abc');
            insert attachment;
        }
    }

    public static void updateQRCode(ID assetId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint + assetId);
        request.setMethod('PUT');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Set the body as a JSON object
        request.setBody('QR data in JSON format');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() == 201) {
            System.debug(response.getBody());
        } else  if(response.getStatusCode() == 400) {
            System.debug('ERROR: Invalid ID supplied');
        } else  if(response.getStatusCode() == 404) {
            System.debug('ERROR: QR not found');
        } else {
            System.debug('ERROR: Unexpected error');
        }
    }
}