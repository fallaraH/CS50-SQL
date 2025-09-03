
-- *** The Lost Letter ***
-- Finds both the address and type of the package's final destination
 SELECT "address", "type" FROM "addresses"
   ...> WHERE "id" = (
   ...>     SELECT "address_id" FROM "scans" -- Finds the address id from where the package was dropped
   ...>     WHERE "action" = 'Drop'
   ...>     AND "package_id" = (
   ...>         SELECT "id" FROM "packages" -- Finds the id of the package
   ...>         WHERE "from_address_id" = (
   ...>             SELECT "id" FROM "addresses" -- Finds the id of the address from where the package was sent
   ...>             WHERE "address" = '900 Somerville Avenue'
   ...>         )
   ...>     )
   ...> );

-- *** The Devious Delivery ***
-- Finds the id and the content of the package that has not a "From" address
SELECT "id", "contents" FROM "packages"
   ...> WHERE "from_address_id" IS NULL;

-- Finds the type of the package's final destination
SELECT "type" FROM "addresses"
   ...> WHERE "id" = (
   ...>     SELECT "address_id" FROM "scans"
   ...>     WHERE "package_id" = 5098
   ...>     AND "action" = 'Drop'
   ...> );

-- *** The Forgotten Gift ***
-- Finds the id and the contents of the package
 SELECT "id", "contents" FROM "packages"
   ...> WHERE "from_address_id" = (
   ...>     SELECT "id" FROM "addresses"
   ...>     WHERE "address" = '109 Tileston Street'
   ...> )
   ...> AND "to_address_id" = (
   ...>     SELECT "id" FROM "addresses"
   ...>     WHERE "address" = '728 Maple Place'
   ...> );

-- Finds the scans of the package
SELECT * FROM "scans"
   ...> WHERE "package_id" = 9523;

-- Finds the name of the driver that is with the package
 SELECT "name" FROM "drivers"
   ...> WHERE "id" = 17;
