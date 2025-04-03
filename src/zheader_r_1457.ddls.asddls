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

  composition [0..*] of ZITEMS_R_1457 as _Items

{
  key id               as Id,
      email            as Email,
      first_name       as FirstName,
      last_name        as LastName,
      country          as Country,
      create_on        as CreateOn,
      delivery_date    as DeliveryDate,
      order_status     as OrderStatus,
      image_url        as ImageUrl,
      @Semantics.user.createdBy: true
      local_created_by as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at as LocalCreatedAt,
      _Items
}
