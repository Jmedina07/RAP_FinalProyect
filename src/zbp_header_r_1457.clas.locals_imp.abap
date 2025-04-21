CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF sales_status,
        open     TYPE c LENGTH 1 VALUE 'O',
        accepted TYPE c LENGTH 1 VALUE 'A',
        rejected TYPE c LENGTH 1 VALUE 'X',
      END OF sales_status.

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
    METHODS validateFirstName FOR VALIDATE ON SAVE
      IMPORTING keys FOR Header~validateFirstName.

    METHODS validate_email
      IMPORTING
        i_email        TYPE string
      RETURNING
        VALUE(r_valid) TYPE abap_bool.

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

    MODIFY ENTITIES OF zheader_r_1457 IN LOCAL MODE
           ENTITY Header
           UPDATE FIELDS ( OrderStatus )
           WITH VALUE #( FOR key IN keys ( %tky          = key-%tky
                                           OrderStatus = sales_status-accepted ) ).

    READ ENTITIES OF zheader_r_1457 IN LOCAL MODE
         ENTITY Header
         ALL FIELDS WITH
         CORRESPONDING #( keys )
         RESULT DATA(headers).

    result = VALUE #( FOR header IN headers ( %tky = header-%tky
                                              %param = header  ) ).

  ENDMETHOD.

  METHOD rejectSale.

    MODIFY ENTITIES OF zheader_r_1457 IN LOCAL MODE
         ENTITY Header
         UPDATE FIELDS ( OrderStatus )
         WITH VALUE #( FOR key IN keys ( %tky          = key-%tky
                                         OrderStatus = sales_status-rejected ) ).

    READ ENTITIES OF zheader_r_1457 IN LOCAL MODE
         ENTITY Header
         ALL FIELDS WITH
         CORRESPONDING #( keys )
         RESULT DATA(headers).

    result = VALUE #( FOR header IN headers ( %tky = header-%tky
                                              %param = header  ) ).

  ENDMETHOD.

  METHOD Resume.
  ENDMETHOD.

  METHOD setOrderStatusOpen.

    READ ENTITIES OF zheader_r_1457 IN LOCAL MODE
         ENTITY Header
         FIELDS ( OrderStatus )
         WITH CORRESPONDING #( keys )
         RESULT DATA(headers).

    DELETE headers WHERE OrderStatus IS NOT INITIAL.

    CHECK headers IS NOT INITIAL.

    MODIFY ENTITIES OF zheader_r_1457 IN LOCAL MODE
         ENTITY Header
         UPDATE FIELDS ( OrderStatus )
         WITH VALUE #( FOR header IN headers INDEX INTO i ( %tky = header-%tky
                                                            OrderStatus = sales_status-open ) ).

  ENDMETHOD.

  METHOD setIdHeader.
  ENDMETHOD.

  METHOD validateCountry.




    DATA countries TYPE SORTED TABLE OF I_CountryVH WITH UNIQUE KEY country.

    READ ENTITIES OF zheader_r_1457 IN LOCAL MODE
       ENTITY Header
       FIELDS ( Country )
       WITH CORRESPONDING #( keys )
       RESULT DATA(headers).

    countries = CORRESPONDING #( headers DISCARDING DUPLICATES MAPPING country = Country EXCEPT * ).

    DELETE countries WHERE country IS INITIAL.

    IF countries IS NOT INITIAL.

      SELECT FROM I_CountryVH AS db
             INNER JOIN @countries AS it ON db~Country = it~Country
             FIELDS
                  db~Country
             INTO TABLE @DATA(valid_country).

    ENDIF.

    LOOP AT headers INTO DATA(header).

      APPEND VALUE #( %tky          = header-%tky
                       %state_area = 'VALIDATE_COUNTRY' ) TO reported-header.

      IF header-Country IS INITIAL.

        APPEND VALUE #( %tky          = header-%tky ) TO failed-header.

        APPEND VALUE #( %tky            = header-%tky
                         %state_area    = 'VALIDATE_COUNTRY'
                        %msg = new_message_with_text( severity =
                                if_abap_behv_message=>severity-error
                                text = 'Enter Country ' && ' ' && header-Country
                                )
                      ) TO reported-header.



      ELSEIF NOT line_exists( valid_country[ Country = header-Country ] ).

        APPEND VALUE #( %tky          = header-%tky ) TO failed-header.

        APPEND VALUE #( %tky            = header-%tky
                         %state_area    = 'VALIDATE_COUNTRY'
                        %msg = new_message_with_text( severity =
                                if_abap_behv_message=>severity-error
                                text = 'Country desconocida ' && ' ' && header-Country
                                )
                      ) TO reported-header.


      ENDIF.

    ENDLOOP.


  ENDMETHOD.

  METHOD validateEmail.

    DATA:
      lv_email    TYPE string,
      lv_is_valid TYPE boolean.



    READ ENTITIES OF zheader_r_1457 IN LOCAL MODE
     ENTITY Header
     FIELDS ( Email )
     WITH CORRESPONDING #( keys )
     RESULT DATA(headers).


    IF headers IS NOT INITIAL.

      LOOP AT headers INTO DATA(header).

        IF header-Email IS NOT INITIAL.

          lv_email = header-Email.

          lv_is_valid = validate_email( i_email = lv_email ).

        ELSE.

          APPEND VALUE #( %tky          = header-%tky ) TO failed-header.

          APPEND VALUE #( %tky            = header-%tky
                           %state_area    = 'VALIDATE_EMAIL'
                          %msg = new_message_with_text( severity =
                                  if_abap_behv_message=>severity-error
                                  text = 'Campo Email Obligatorio '
                                  )
                        ) TO reported-header.

        ENDIF.

      ENDLOOP.

    ENDIF.

  ENDMETHOD.

  METHOD validate_email.

*    DATA:
*      ls_email_data TYPE cl_email_validator=>ty_email_data,
*      ls_error_data TYPE cl_email_validator=>ty_error_data.
*
*    " Define el formato del correo electrónico
*    ls_email_data-email = i_email.
*    ls_email_data-format = 'email_address'.
*
*    " Valida el correo electrónico
*
*    cl_abap_math
*
*    cl_email_validator=>validate_email(
*        EXPORTING
*            data    = ls_email_data
*        IMPORTING
*            error_data = ls_error_data
*        raising EXCEPTIONS
*                cl_email_validator=>ex_invalid_format
*                cl_email_validator=>ex_invalid_domain
*                cl_email_validator=>ex_invalid_email_syntax
*        ).
*
*    IF ls_error_data IS NOT INITIAL.
*      r_valid = abap_false.
*    ELSE.
*      r_valid = abap_true.
*    ENDIF.

  ENDMETHOD.

  METHOD validateFirstName.

    READ ENTITIES OF zheader_r_1457 IN LOCAL MODE
     ENTITY Header
     FIELDS ( FirstName )
     WITH CORRESPONDING #( keys )
     RESULT DATA(headers).

    DATA(header) = VALUE #( headers[ 1 ] OPTIONAL ).

    IF header-FirstName IS  INITIAL.

          APPEND VALUE #( %tky          = header-%tky ) TO failed-header.

          APPEND VALUE #( %tky            = header-%tky
                           %state_area    = 'VALIDATE_FIRSTNAME'
                          %msg = new_message_with_text( severity =
                                  if_abap_behv_message=>severity-error
                                  text = 'Campo First Name Obligatorio '
                                  )
                        ) TO reported-header.

    ENDIF.


  ENDMETHOD.

ENDCLASS.
