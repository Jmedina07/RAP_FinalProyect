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

    lt_header_1457 = VALUE #(
        ( id = '0000000001' email  = 'joel@example.com' firstname = 'Joel' lastname = 'Medina' country  = 'Mexico'
          createon  = '20240228' deliverydate = '20240310' orderstatus = '1' imageurl  = 'Joel' )
        ( id = '0000000002' email  = 'juan@example.com' firstname = 'Juan' lastname = 'Molina' country  = 'Mexico'
          createon  = '20240228' deliverydate = '20240310' orderstatus = '1' imageurl  = 'Juan' )
        ( id = '0000000003' email  = 'ana@example.com' firstname = 'Ana' lastname = 'Sanchez' country  = 'Mexico'
          createon  = '20240228' deliverydate = '20240310' orderstatus = '1' imageurl  = 'Ana' )
     ).
    lt_items_1457 = VALUE #(
       ( id = '0000000001' id_header = '0000000001' name = 'Item 1' description = 'Description Item 1'
       releasedate  = '20230101' discdate = '20240101' price = '100.00' height = '10.00' width = '5.00'
       depth = '2.00' quantity = '100' unit = 'EA' )
      ( id = '0000000002' id_header = '0000000001' name = 'Item 2' description = 'Description Item 2'
       releasedate  = '20230101' discdate = '20240101' price = '110.00' height = '11.00' width = '5.00'
       depth = '2.00' quantity = '101' unit = 'EA' )
      ( id = '0000000003' id_header = '0000000001' name = 'Item 3' description = 'Description Item 3'
       releasedate  = '20230101' discdate = '20240101' price = '110.00' height = '13.00' width = '5.00'
       depth = '2.00' quantity = '110' unit = 'EA' )
      ( id = '0000000001' id_header = '0000000002' name = 'Item 2' description = 'Description Item 1'
       releasedate  = '20230101' discdate = '20240101' price = '110.00' height = '11.00' width = '5.00'
       depth = '2.00' quantity = '101' unit = 'EA' )
       ( id = '0000000001' id_header = '0000000003' name = 'Item 3' description = 'Description Item 1'
       releasedate  = '20230101' discdate = '20240101' price = '110.00' height = '13.00' width = '5.00'
       depth = '2.00' quantity = '110' unit = 'EA' )
    ).
    DELETE FROM zheader_1457.
    DELETE FROM zitems_1457.
    INSERT zheader_1457 FROM TABLE @lt_header_1457.
    INSERT zitems_1457 FROM TABLE @lt_items_1457.

  ENDMETHOD.
ENDCLASS.
