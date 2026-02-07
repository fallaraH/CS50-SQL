CREATE TABLE "users" (
    "id" INTEGER
    "username" TEXT NOT NULL UNIQUE
    "age" INTEGER NOT NULL
    "height" REAL NOT NULL
    "weight" REAL NOT NULL
    "goal_calories" INTEGER NOT NULL
    PRIMARY KEY("id")
);

CREATE TABLE "foods" (
    "id" INTEGER
    "name" TEXT NOT NULL UNIQUE
    "calories" INTEGER NOT NULL
    "carbs" REAL
    "protein" REAL
    "fat" REAL
    "fiber" REAL
    PRIMARY KEY("id")
);

CREATE TABLE "meals" (
    "id" INTEGER
    "user_id" INTEGER
    "meal_type" TEXT NOT NULL CHECK("meal_type" IN ('breakfast', 'lunch', 'snack', 'dinner'))
    "date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP
    FOREIGN KEY("user_id") REFERENCES "users"("id")
    PRIMARY KEY("id")
);

CREATE TABLE "meals_items" (
    "food_id" INTEGER
    "meal_id" INTEGER
    "quantity" INTEGER NOT NULL
    FOREIGN KEY("food_id") REFERENCES "foods"("id")
    FOREIGN KEY("meal_id") REFERENCES "meals"("id")
    PRIMARY KEY("food_id", "meal_id")
);

CREATE TABLE "workouts" (
    "id" INTEGER
    "user_id" INTEGER
    "date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP
    "activity" TEXT NOT NULL CHECK("activity" IN ('weightlifting', 'cardio', 'sports', 'yoga'))
    "duration" NUMERIC NOT NULL
    FOREIGN KEY("user_id") REFERENCES "users"("id")
    PRIMARY KEY("id")
);

CREATE TABLE "workout_details" (
    "id" INTEGER,
    "workout_id" INTEGER,
    "exercise_name" TEXT NOT NULL,
    "sets" INTEGER NOT NULL,
    "reps" INTEGER,
    "weight_kg" REAL,
    FOREIGN KEY("workout_id") REFERENCES "workouts"("id"),
    PRIMARY KEY("id")
);

CREATE VIEW "weightlift_workout" AS
SELECT "username", "exercise_name", "sets", "reps", "weight_kg", "date"
FROM "workouts"
JOIN "workout_details" ON "workouts"."id" = "workout_details"."workout_id"
JOIN "users" ON "workouts"."user_id" = "users"."id"
WHERE "activity" = 'weightlifting';


CREATE INDEX "username_search" ON "users" ("username");
CREATE INDEX "food_search" ON "foods" ("name");
CREATE INDEX "meal_items_lookup" ON "meals_items" ("meal_id", "food_id");
