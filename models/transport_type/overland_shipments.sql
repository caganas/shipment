{% if is_incremental() %}
  -- Incremental query
  SELECT *
  FROM {{ ref('src_shipments') }}
  WHERE transport_type = 'O'
    AND last_update > (SELECT MAX(last_update) FROM {{ this }})
{% else %}
  -- Full-refresh query
  SELECT *
  FROM {{ ref('src_shipments') }}
  WHERE transport_type = 'O'
{% endif %}