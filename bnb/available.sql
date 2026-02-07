CREATE VIEW "available" AS
SELECT "listings"."id" AS "id", "property_type", "host_name", "date"
FROM "listings"
INNER JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
WHERE "available" = 'TRUE';
