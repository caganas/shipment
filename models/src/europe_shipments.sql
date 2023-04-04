
WITH source AS (
    SELECT *
    FROM {{ 'SHIPMENT_DATAMART.SHIPMENT_DATAMART.shipments'}}
),

european_country_codes AS (
    SELECT * FROM (VALUES
        ('AL'), ('AD'), ('AM'), ('AT'), ('AZ'),
        ('BY'), ('BE'), ('BA'), ('BG'), ('HR'),
        ('CY'), ('CZ'), ('DK'), ('EE'), ('FI'),
        ('FR'), ('GE'), ('DE'), ('GR'), ('HU'),
        ('IS'), ('IE'), ('IT'), ('KZ'), ('XK'),
        ('LV'), ('LI'), ('LT'), ('LU'), ('MT'),
        ('MD'), ('MC'), ('ME'), ('NL'), ('MK'),
        ('NO'), ('PL'), ('PT'), ('RO'), ('RU'),
        ('SM'), ('RS'), ('SK'), ('SI'), ('ES'),
        ('SE'), ('CH'), ('TR'), ('UA'), ('GB'),
        ('VA')
    ) AS t(country_code)
),

filtered_shipments AS (
    SELECT *
    FROM source
    WHERE
        LEFT(FROM_LOCATION, 2) IN (SELECT country_code FROM european_country_codes)
        AND LEFT(TO_LOCATION, 2) IN (SELECT country_code FROM european_country_codes)
)

SELECT *
FROM filtered_shipments
