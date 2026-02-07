-- This query gets the total values of each main macronutrients in a specific date
SELECT SUM(calories * quantity) AS total_calories,
       SUM(protein * quantity) AS total_protein,
       SUM(fat * quantity) AS total_fat
FROM meals
JOIN meal_items ON meals.id = meal_items.meal_id
JOIN foods ON meal_items.food_id = foods.id
WHERE meals.user_id = 1 AND meals.date = '2023-11-20';

-- Using the weightlift_workout view, this query finds the maximum weight ever lifted for a specific exercise by a specific user.
SELECT
    exercise_name,
    MAX(weight_kg) AS personal_record_kg,
    date
FROM weightlift_workout
WHERE username = 'hector01' AND exercise_name = 'Bench Press'
GROUP BY exercise_name;

-- "Volume" (sets × reps × weight) is a key metric in bodybuilding. This query joins workouts and workout_details to calculate the total work done in a single session.
SELECT
    w.id AS workout_id,
    w.date,
    SUM(wd.sets * wd.reps * wd.weight_kg) AS total_volume_kg
FROM workouts AS w
JOIN workout_details AS wd ON w.id = wd.workout_id
WHERE w.activity = 'weightlifting'
GROUP BY w.id
ORDER BY w.date DESC;

-- This query compares a user's actual daily intake against the goal_calories set in the users table.
WITH DailyIntake AS (
    SELECT user_id, SUM(f.calories * mi.quantity) AS actual_calories
    FROM meals AS m
    JOIN meals_items AS mi ON m.id = mi.meal_id
    JOIN foods AS f ON mi.food_id = f.id
    WHERE DATE(m.date) = DATE('now')
    GROUP BY user_id
)
SELECT
    u.username,
    u.goal_calories,
    di.actual_calories,
    (u.goal_calories - di.actual_calories) AS calories_remaining
FROM users AS u
LEFT JOIN DailyIntake AS di ON u.id = di.user_id;
