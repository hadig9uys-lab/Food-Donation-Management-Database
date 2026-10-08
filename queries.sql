INSERT INTO "donors" ("name", "type", "phone", "email", "city")
VALUES
('Sunrise Bakery', 'Bakery', '0123456789', 'sunrise@example.com', 'Kuala Lumpur'),
('Fresh Market', 'Supermarket', '0134567890', 'freshmarket@example.com', 'Selangor'),
('Golden Spoon Restaurant', 'Restaurant', '0145678901', 'goldenspoon@example.com', 'Kuala Lumpur'),
('Green Valley Grocers', 'Supermarket', '0156789012', 'greenvalley@example.com', 'Shah Alam'),
('City Hotel Kitchen', 'Hotel', '0167890123', 'cityhotel@example.com', 'Petaling Jaya'),
('Daily Bread House', 'Bakery', '0178901234', 'dailybread@example.com', 'Kuala Lumpur'),
('Family Catering', 'Catering Company', '0189012345', 'familycatering@example.com', 'Subang Jaya'),
('Healthy Harvest', 'Grocery Store', '0190123456', 'healthyharvest@example.com', 'Putrajaya'),
('Ocean View Restaurant', 'Restaurant', '0111234567', 'oceanview@example.com', 'Klang'),
('Metro Food Hall', 'Food Court', '0112345678', 'metrofood@example.com', 'Cyberjaya');


INSERT INTO "charities" ("name", "phone", "city", "email")
VALUES
('Hope Food Centre', '0121111111', 'Kuala Lumpur', 'hope@example.com'),
('Helping Hands', '0122222222', 'Selangor', 'helpinghands@example.com'),
('Care Community', '0123333333', 'Shah Alam', 'carecommunity@example.com'),
('Bright Future Shelter', '0124444444', 'Petaling Jaya', 'brightfuture@example.com'),
('Unity Food Bank', '0125555555', 'Kuala Lumpur', 'unityfood@example.com'),
('Safe Home Centre', '0126666666', 'Subang Jaya', 'safehome@example.com'),
('Children Hope Foundation', '0127777777', 'Putrajaya', 'childrenhope@example.com'),
('Community Relief Centre', '0128888888', 'Klang', 'relief@example.com');


INSERT INTO "food_items" ("name", "category")
VALUES
('White Bread', 'Bakery'),
('Wholemeal Bread', 'Bakery'),
('Rice', 'Grain'),
('Apples', 'Fruit'),
('Bananas', 'Fruit'),
('Milk', 'Dairy'),
('Yogurt', 'Dairy'),
('Chicken Rice', 'Cooked Meal'),
('Vegetable Soup', 'Cooked Meal'),
('Pasta', 'Grain'),
('Potatoes', 'Vegetable'),
('Carrots', 'Vegetable'),
('Tomatoes', 'Vegetable'),
('Chicken', 'Meat'),
('Eggs', 'Protein');


INSERT INTO "volunteers" ("first_name", "last_name", "phone", "email", "city")
VALUES
('Ahmed', 'Ali', '0131111111', 'ahmed@example.com', 'Kuala Lumpur'),
('Sara', 'Omar', '0132222222', 'sara@example.com', 'Selangor'),
('Daniel', 'Lim', '0133333333', 'daniel@example.com', 'Shah Alam'),
('Aisha', 'Rahman', '0134444444', 'aisha@example.com', 'Petaling Jaya'),
('Mohammed', 'Hassan', '0135555555', 'mohammed@example.com', 'Kuala Lumpur'),
('Nur', 'Aziz', '0136666666', 'nur@example.com', 'Subang Jaya'),
('Adam', 'Lee', '0137777777', 'adam@example.com', 'Putrajaya'),
('Fatima', 'Yusuf', '0138888888', 'fatima@example.com', 'Klang');


INSERT INTO "donations" ("donor_id", "food_id", "quantity", "unit", "expiry_date", "status")
VALUES
(1, 1, 20, 'kg', '2026-08-30', 'available'),
(1, 2, 12, 'kg', '2026-08-31', 'reserved'),
(2, 4, 25, 'kg', '2026-09-02', 'available'),
(2, 5, 30, 'kg', '2026-08-29', 'collected'),
(3, 8, 40, 'meals', '2026-08-28', 'available'),
(3, 9, 25, 'liters', '2026-08-28', 'reserved'),
(4, 11, 35, 'kg', '2026-09-05', 'available'),
(4, 12, 18, 'kg', '2026-09-03', 'available'),
(5, 6, 20, 'liters', '2026-08-29', 'collected'),
(5, 7, 15, 'kg', '2026-08-30', 'available'),
(6, 1, 25, 'kg', '2026-08-29', 'available'),
(6, 2, 18, 'kg', '2026-08-30', 'reserved'),
(7, 8, 60, 'meals', '2026-08-28', 'collected'),
(7, 10, 22, 'kg', '2026-09-01', 'available'),
(8, 13, 28, 'kg', '2026-09-04', 'available'),
(8, 4, 16, 'kg', '2026-09-02', 'available'),
(9, 14, 20, 'kg', '2026-08-30', 'reserved'),
(9, 15, 100, 'pieces', '2026-09-03', 'available'),
(10, 3, 50, 'kg', '2026-10-01', 'available'),
(1, 3, 10, 'kg', '2026-09-05', 'available'),
(10, 11, 20, 'kg', '2026-09-06', 'expired');


INSERT INTO "requests" ("charity_id", "donation_id", "status")
VALUES
(1, 1, 'pending'),
(2, 2, 'approved'),
(3, 3, 'pending'),
(4, 4, 'approved'),
(5, 5, 'pending'),
(6, 6, 'rejected'),
(7, 7, 'pending'),
(8, 8, 'approved'),
(1, 9, 'approved'),
(2, 10, 'pending'),
(3, 11, 'cancelled'),
(4, 12, 'approved'),
(5, 13, 'approved'),
(6, 14, 'pending'),
(7, 15, 'pending'),
(8, 16, 'rejected'),
(1, 17, 'approved'),
(2, 18, 'pending'),
(3, 19, 'pending'),
(4, 21, 'cancelled');


INSERT INTO "deliveries" ("donation_id", "charity_id", "volunteer_id", "pickup_time", "delivery_time", "status")
VALUES
(2, 2, 1, '2026-08-28 09:00:00', '2026-08-28 10:15:00', 'delivered'),
(4, 4, 2, '2026-08-28 11:00:00', '2026-08-28 12:00:00', 'delivered'),
(8, 8, 3, '2026-08-29 08:30:00', NULL, 'picked_up'),
(9, 1, 4, '2026-08-29 10:00:00', '2026-08-29 11:10:00', 'delivered'),
(12, 4, 5, NULL, NULL, 'scheduled'),
(13, 5, 6, '2026-08-28 14:00:00', '2026-08-28 15:00:00', 'delivered'),
(17, 1, 7, NULL, NULL, 'scheduled');




-- Find all donations that are currently available
SELECT * FROM "donations"
WHERE "status" = 'available';

-- Find available donations that expire on or before September 1, 2026
SELECT * FROM "donations"
WHERE "expiry_date" <= '2026-09-01'
AND "status" = 'available'
ORDER BY "expiry_date";

-- Show each donation with its food name, donor name, quantity, unit, expiry date, and status
SELECT "food_items"."name" AS "food", "donors"."name" AS "donor", "donations"."id", "donations"."quantity",
"donations"."unit", "donations"."expiry_date", "donations"."status" FROM "donations"
JOIN "food_items" ON "donations"."food_id" = "food_items"."id"
JOIN "donors" ON "donations"."donor_id" = "donors"."id";

-- Find available donations from donors located in Kuala Lumpur
SELECT "donations"."id", "donors"."name" AS "donor", "donors"."city", "food_items"."name" AS "food",
"donations"."quantity", "donations"."unit" FROM "donations"
JOIN "donors" ON "donations"."donor_id" = "donors"."id"
JOIN "food_items" ON "donations"."food_id" = "food_items"."id"
WHERE "donors"."city" = 'Kuala Lumpur'
AND "donations"."status" = 'available';

-- Find all requests made by charity number 1
SELECT * FROM "requests"
WHERE "charity_id" = 1;

-- Find the IDs of all approved requests
SELECT "id" FROM "requests"
WHERE "status" = 'approved';

-- Find the IDs of deliveries assigned to volunteer number 1
SELECT "id" FROM "deliveries"
WHERE "volunteer_id" = 1;

-- Show each donor and the total number of donations they made, from highest to lowest
SELECT "donors"."name", COUNT("donations"."id") AS "total_donations" FROM "donors"
JOIN "donations" ON "donors"."id" = "donations"."donor_id"
GROUP BY "donors"."id", "donors"."name"
ORDER BY "total_donations" DESC;

-- Find the names of food items included in donations requested by charity number 1
SELECT "name" FROM "food_items"
WHERE "id" IN (
    SELECT "food_id" FROM "donations"
    WHERE "id" IN (
        SELECT "donation_id" FROM "requests"
        WHERE "charity_id" = 1
    )
);

-- Find cities that have both at least one donor and at least one charity
SELECT "city" FROM "donors"

INTERSECT

SELECT "city" FROM "charities";

-- Find donors who made more donations than the average number of donations made by all donors
SELECT "donors"."name", COUNT("donations"."id") AS "total_donations" FROM "donors"
JOIN "donations" ON "donors"."id" = "donations"."donor_id"
GROUP BY "donors"."id", "donors"."name" HAVING COUNT("donations"."id") > (
    SELECT AVG("donation_count")
    FROM (
        SELECT COUNT("id") AS "donation_count"
        FROM "donations"
        GROUP BY "donor_id"
    )
);

-- Find food items whose names contain the word Bread
SELECT "id", "name"
FROM "food_items"
WHERE "name" LIKE '%Bread%';
