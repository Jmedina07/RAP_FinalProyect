@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZITEMS_I_1457
  as projection on ZITEMS_R_1457
{
  key Id,
  key IdHeader,
      Name,
      Description,
      ReleaseDate,
      DiscDate,
      Price,
      @Semantics.quantity.unitOfMeasure : 'Unit'
      Height,
      @Semantics.quantity.unitOfMeasure : 'Unit'
      Width,
      Depth,
      Quantity,
      Unit,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangeAt,
      /* Associations */
      _Header : redirected to parent ZHEADER_I_1457,
      _UnitOfMeasure
}
