@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define  view entity ZITEMS_R_1457
  as select from zitems_1457
  
  association to parent ZHEADER_R_1457 as _Header on $projection.IdHeader = _Header.Id
  
{
  key id          as Id,
  key id_header   as IdHeader,
      name        as Name,
      description as Description,
      release_date as ReleaseDate,
      disc_date    as DiscDate,
      price       as Price,
      @Semantics.quantity.unitOfMeasure : 'unit'
      height      as Height,
      @Semantics.quantity.unitOfMeasure : 'unit'
      width       as Width,
      depth       as Depth,
      quantity    as Quantity,
      unit        as Unit,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_change_at as LocalLastChangeAt,      
      _Header
}
