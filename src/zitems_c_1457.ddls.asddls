@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items - Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

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
      @Semantics.quantity.unitOfMeasure : 'Unit'
      Height,
      @Semantics.quantity.unitOfMeasure : 'Unit'
      Width,
      Depth,
      Quantity,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'UnitName' ]
      @Consumption.valueHelpDefinition: [ {
      entity: {
      name: 'I_UnitOfMeasureStdVH',
      element: 'Unit'
      },
      useForValidation: true
      }]
      Unit,
      _UnitOfMeasure._Text[ 1: Language = $session.system_language ].UnitOfMeasureName as UnitName,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangeAt,
      /* Associations */
      _Header : redirected to parent ZHEADER_C_1457,
      _UnitOfMeasure
}
