@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZHEADER_R_1457
  as select from zheader_1457
  
  composition [0..*] of ZITEMS_R_1457      as _Items
  
{
  key id           as Id,
      email        as Email,
      firstname    as FirstName,
      lastname     as LastName,
      country      as Country,
      createon     as CreateOn,
      deliverydate as DeliveryDate,
      orderstatus  as OrderStatus,
      imageurl     as ImageUrl,
      
      
      _Items
}
