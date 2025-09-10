CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = 0;

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = '';

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = '';

DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';

CREATE TABLE "meteorites" (
    "name" TEXT,
    "id" INTEGER,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

INSERT INTO "meteorites" ("name", "id", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name",  ROW_NUMBER() OVER (ORDER BY "year" ASC, "name" ASC) AS "id",
"class", ROUND("mass", 2) AS "mass", "discovery", "year", ROUND("lat", 2) AS "lat", ROUND("long", 2) AS "long" FROM "meteorites_temp"
ORDER BY "year" ASC, "name" ASC;

DROP TABLE IF EXISTS "meteorites_temp";
