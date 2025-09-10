SELECT "name", "needs_improvement" FROM "schools"
JOIN "staff_evaluations" ON "schools"."district_id" = "staff_evaluations"."district_id"
ORDER BY "needs_improvement" DESC, "name" ASC
LIMIT 10;
