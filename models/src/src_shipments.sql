{{ config(materialized='table') }}
WITH shipments AS (select * from SHIPMENT_DATAMART.SHIPMENT_DATAMART.shipments )
SELECT shipment_id,
  kn_com_ref,
  is_dang_good,
  packages,
  gross_weight,
  volume,
  from_location,
  to_location,
  shipment_type_code,
  shipment_type_name,
  transport_type,
  last_update,
  is_active
  from shipments