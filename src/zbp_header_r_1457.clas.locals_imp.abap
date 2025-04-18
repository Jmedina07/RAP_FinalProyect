CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Header RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Header RESULT result.

    METHODS precheck_create FOR PRECHECK
      IMPORTING entities FOR CREATE Header.

    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE Header.

    METHODS acceptSale FOR MODIFY
      IMPORTING keys FOR ACTION Header~acceptSale RESULT result.

    METHODS rejectSale FOR MODIFY
      IMPORTING keys FOR ACTION Header~rejectSale RESULT result.

    METHODS Resume FOR MODIFY
      IMPORTING keys FOR ACTION Header~Resume.

    METHODS setOrderStatusOpen FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Header~setOrderStatusOpen.

    METHODS setIdHeader FOR DETERMINE ON SAVE
      IMPORTING keys FOR Header~setIdHeader.

    METHODS validateCountry FOR VALIDATE ON SAVE
      IMPORTING keys FOR Header~validateCountry.

    METHODS validateEmail FOR VALIDATE ON SAVE
      IMPORTING keys FOR Header~validateEmail.

ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD precheck_create.
  ENDMETHOD.

  METHOD precheck_update.
  ENDMETHOD.

  METHOD acceptSale.
  ENDMETHOD.

  METHOD rejectSale.
  ENDMETHOD.

  METHOD Resume.
  ENDMETHOD.

  METHOD setOrderStatusOpen.
  ENDMETHOD.

  METHOD setIdHeader.
  ENDMETHOD.

  METHOD validateCountry.
  ENDMETHOD.

  METHOD validateEmail.
  ENDMETHOD.

ENDCLASS.
