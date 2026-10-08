-- Represent businesses and organizations that donate surplus food
CREATE TABLE "donors" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "phone" TEXT NOT NULL UNIQUE,
    "email" TEXT NOT NULL UNIQUE,
    "city" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

-- Represent charities and organizations that receive food donations
CREATE TABLE "charities" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL UNIQUE,
    "city" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

-- Represent the different food items and food categories available for donation
CREATE TABLE "food_items" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

-- Represent volunteers who help transport food donations
CREATE TABLE "volunteers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "phone" TEXT NOT NULL UNIQUE,
    "email" TEXT NOT NULL UNIQUE,
    "city" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

-- Represent individual food donations made by donors
CREATE TABLE "donations" (
    "id" INTEGER,
    "donor_id" INTEGER NOT NULL,
    "food_id" INTEGER NOT NULL,
    "quantity" REAL NOT NULL CHECK ("quantity" > 0),
    "unit" TEXT NOT NULL,
    "expiry_date" NUMERIC NOT NULL,
    "created_at" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL CHECK ("status" IN ('available', 'reserved', 'collected', 'expired')),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("donor_id") REFERENCES "donors" ("id"),
    FOREIGN KEY ("food_id") REFERENCES "food_items" ("id")
);

-- Represent requests made by charities for specific donations
CREATE TABLE "requests" (
    "id" INTEGER,
    "charity_id" INTEGER NOT NULL,
    "donation_id" INTEGER NOT NULL,
    "requested_at" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL CHECK ("status" IN ('pending', 'approved', 'rejected', 'cancelled')),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("charity_id") REFERENCES "charities" ("id"),
    FOREIGN KEY ("donation_id") REFERENCES "donations" ("id")
);

-- Represent the pickup and delivery of food donations
CREATE TABLE "deliveries" (
    "id" INTEGER,
    "donation_id" INTEGER NOT NULL UNIQUE,
    "charity_id" INTEGER NOT NULL,
    "volunteer_id" INTEGER NOT NULL,
    "pickup_time" NUMERIC,
    "delivery_time" NUMERIC,
    "status" TEXT NOT NULL CHECK ("status" IN ('scheduled', 'picked_up', 'delivered', 'cancelled')),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("donation_id") REFERENCES "donations" ("id"),
    FOREIGN KEY ("charity_id") REFERENCES "charities" ("id"),
    FOREIGN KEY ("volunteer_id") REFERENCES "volunteers" ("id")
);


-- Show available donations from donors located in Kuala Lumpur
CREATE VIEW "kuala_lumpur_available_donations" AS
SELECT "donations"."id", "donors"."name" AS "donor", "donors"."city", "food_items"."name" AS "food",
"donations"."quantity", "donations"."unit" FROM "donations"
JOIN "donors" ON "donations"."donor_id" = "donors"."id"
JOIN "food_items" ON "donations"."food_id" = "food_items"."id"
WHERE "donors"."city" = 'Kuala Lumpur'
AND "donations"."status" = 'available';


-- Show the total number of donations made by each donor
CREATE VIEW "donor_totals" AS
SELECT "donors"."name", COUNT("donations"."id") AS "total_donations" FROM "donors"
JOIN "donations" ON "donors"."id" = "donations"."donor_id"
GROUP BY "donors"."id", "donors"."name";



-- Speed up searches for donations by status
CREATE INDEX "donation_status_search" ON "donations" ("status");


-- Speed up searches for expiry dates among available donations
CREATE INDEX "available_donation_search" ON "donations" ("expiry_date")
WHERE "status" = 'available';


-- Speed up searches for donors by city
CREATE INDEX "donor_city_search" ON "donors" ("city");


-- Speed up searches for requests made by a specific charity
CREATE INDEX "request_charity_search" ON "requests" ("charity_id");


-- Speed up searches for deliveries assigned to a specific volunteer
CREATE INDEX "delivery_volunteer_search" ON "deliveries" ("volunteer_id");
