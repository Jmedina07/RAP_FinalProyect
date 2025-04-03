CLASS zcl_1457_data_sales DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_1457_data_sales IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_header_1457 TYPE TABLE OF zheader_1457,
          lt_items_1457  TYPE TABLE OF zitems_1457.
    DATA(fecha) = cl_abap_context_info=>get_system_date(   ).
    lt_header_1457 = VALUE #(
        ( id = '0000000001' email  = 'joel@example.com' first_name = 'Joel' last_name = 'Medina' country  = 'Mexico'
          create_on  = '20240228' delivery_date = '20240310' order_status = '1' image_url  = 'Joel'
          local_created_by = cl_abap_context_info=>get_user_technical_name(  )
          local_created_at = cl_abap_context_info=>get_system_date(   )
           )
        ( id = '0000000002' email  = 'juan@example.com' first_name = 'Juan' last_name = 'Molina' country  = 'Mexico'
          create_on  = '20240228' delivery_date = '20240310' order_status = '1' image_url  = 'Juan'
          local_created_by = cl_abap_context_info=>get_user_technical_name(  )
          local_created_at = cl_abap_context_info=>get_system_date(   )
          )
        ( id = '0000000003' email  = 'ana@example.com' first_name = 'Ana' last_name = 'Sanchez' country  = 'Mexico'
          create_on  = '20240228' delivery_date = '20240310' order_status = '1' image_url  = 'Ana'
          local_created_by = cl_abap_context_info=>get_user_technical_name(  )
          local_created_at = cl_abap_context_info=>get_system_date(   )
          )
     ).
    lt_items_1457 = VALUE #(
       ( id = '0000000001' id_header = '0000000001' name = 'Item 1' description = 'Description Item 1'
       release_date  = '20230101' disc_date = '20240101' price = '100.00' height = '10.00' width = '5.00'
       depth = '2.00' quantity = '100' unit = 'EA' )
      ( id = '0000000002' id_header = '0000000001' name = 'Item 2' description = 'Description Item 2'
       release_date  = '20230101' disc_date = '20240101' price = '110.00' height = '11.00' width = '5.00'
       depth = '2.00' quantity = '101' unit = 'EA' )
      ( id = '0000000003' id_header = '0000000001' name = 'Item 3' description = 'Description Item 3'
       release_date  = '20230101' disc_date = '20240101' price = '110.00' height = '13.00' width = '5.00'
       depth = '2.00' quantity = '110' unit = 'EA' )
      ( id = '0000000001' id_header = '0000000002' name = 'Item 2' description = 'Description Item 1'
       release_date  = '20230101' disc_date = '20240101' price = '110.00' height = '11.00' width = '5.00'
       depth = '2.00' quantity = '101' unit = 'EA' )
       ( id = '0000000001' id_header = '0000000003' name = 'Item 3' description = 'Description Item 1'
       release_date  = '20230101' disc_date = '20240101' price = '110.00' height = '13.00' width = '5.00'
       depth = '2.00' quantity = '110' unit = 'EA'  )
    ).
    DELETE FROM zheader_1457.
    DELETE FROM zitems_1457.
    INSERT zheader_1457 FROM TABLE @lt_header_1457.
    INSERT zitems_1457 FROM TABLE @lt_items_1457.

  ENDMETHOD.
ENDCLASS.
