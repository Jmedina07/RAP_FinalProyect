@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZHEADER_I_1457
  provider contract transactional_interface
  as projection on ZHEADER_R_1457
{
  key Id,
      Email,
      FirstName,
      LastName,
      Country,
      CreateOn,
      DeliveryDate,
      OrderStatus,
      ImageUrl,
      @Semantics.user.createdBy: true
      LocalCreatedBy,
      SystemDate,
      /* Associations */
      _Items : redirected to composition child ZITEMS_I_1457,
      _Country
}
