@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items - Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZITEMS_C_1457
  as projection on ZITEMS_R_1457
{
  key Id,
  key IdHeader,
      Name,
      Description,
      ReleaseDate,
      DiscDate,
      Price,
      @Semantics.quantity.unitOfMeasure : 'unit'
      Height,
      @Semantics.quantity.unitOfMeasure : 'unit'
      Width,
      Depth,
      Quantity,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'UnitName' ]
      @Consumption.valueHelpDefinition: [ {
      entity: {
      name: 'I_UnitOfMeasureStdVH',
      element: 'UnitOfMeasure'
      },
      useForValidation: true
      }]
      Unit,
      _UnitOfMeasure._Text.UnitOfMeasureName as UnitName : localized,      
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _Header : redirected to parent ZHEADER_C_1457,
      _UnitOfMeasure
      
      
      
}
