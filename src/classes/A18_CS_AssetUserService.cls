/**
 * Created by Piotr Kucia on 10.07.2018.
 */

public with sharing class A18_CS_AssetUserService {

    private A18_DM_AssetUserService DMAssetUserService;

    public A18_CS_AssetUserService() {
        this.DMAssetUserService = new A18_DM_AssetUserService();
    }

    public List<A18_DTO.AssetStatus> getAssetStatuses() {
        List<Schema.PicklistEntry> statusPicklistEntryList = DMAssetUserService.getAssetStatuses();
        List<A18_DTO.AssetStatus> DTOAssetStatuses = new List<A18_DTO.AssetStatus>();

        for(Schema.PicklistEntry status : statusPicklistEntryList){
            DTOAssetStatuses.add(A18_AssetUserAssembler.convertAssetStatusToDTO(status));
        }

        return DTOAssetStatuses;
    }
}