WITH customers AS (select * from SHIPMENT_DATAMART.SHIPMENT_DATAMART.customers )
SELECT
shipment_id ,
  status_type_code ,
  status_type_name ,
  status_timestamp ,
  sender AS logical_sender,
  status_location ,
  transport_type ,
  is_active 
FROM customers

