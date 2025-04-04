@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header - Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZHEADER_C_1457
  provider contract transactional_query
  as projection on ZHEADER_R_1457
{
  key Id,
      Email,
      @Search.defaultSearchElement: true
      FirstName,
      @Search.defaultSearchElement: true
      LastName,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CountryName' ]
      @Consumption.valueHelpDefinition: [ {
        entity: {
            name: 'I_CountryVH',
            element: 'Country'
        }
        //useForValidation: true
      }]      
      Country,
      _Country.Description as CountryName,
      
      CreateOn,
      DeliveryDate,
      OrderStatus,
      ImageUrl,
      @Semantics.user.createdBy: true
      LocalCreatedBy,
      SystemDate,
      /* Associations */
      _Country,
      _Items : redirected to composition child ZITEMS_C_1457
}
