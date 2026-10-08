## Scope

This database is designed to support the management of food donations from donors to charities through volunteers and deliveries. It holds data on the involved stakeholders such as donors, charities, volunteers, food items, donations, requests and deliveries. Information such as the contact details of the donors, food categories, the quantity donated, expiry date, request status and delivery status are among those that the database stores.

Some of the functions that fall outside the scope of this database include payments, salaries, GPS tracking, delivery routing and inventory management.

## Functional Requirements

The database should allow a user to add donors, charities, food items, volunteers, donations, requests and deliveries. It should also allow a user to search for donations that are available, those that are near expiry, the details of donations including the donor and the food, the available donations in Kuala Lumpur, the requests made by a particular charity, the approved requests, the deliveries that a volunteer is handling, the total number of donations that a donor has made, and a search for food items.

In the case of the functions that fall outside the scope of this database, the user cannot make payments, track deliveries using GPS technology, plan delivery routes, send out notifications or manage salaries and have a full inventory management system.

## Representation

### Entities

There are seven main entities in this database, which are donors, charities, food_items, volunteers, donations, requests and deliveries. The donors table contains the id, name, type, phone, email and city of a donor. I have used INTEGER as the data type for the id since it is the unique identifier of a donor in the database. All the other fields have TEXT as their data type since they contain textual information about the donor. I have also set the phone and email fields to be UNIQUE to avoid having the same contact information for different donors. The fields that have the NOT NULL constraint are the important fields that should have values.

The charities table consists of the id, name, phone, city and email of a charity. The id column is the primary key while the rest of the columns have TEXT as their data type. The phone and email fields are UNIQUE to avoid having the same contact information for different charities.

The food_items table is made up of id, name and category of a food item. The id field is an INTEGER data type and is used as the primary key for this table. The text fields have TEXT as their data type since they hold textual information about a specific food category.

The volunteers table consists of id, first_name, last_name, phone, email and city of a volunteer. The id field has INTEGER as its data type and it is the primary key of this table. The rest of the fields have TEXT as their data type and the phone and email fields are set to UNIQUE to avoid having the same contact information for different volunteers.

The donations table holds the id, donor_id, food_id, quantity, unit, expiry_date, created_at, and status of a donation. The donor_id and food_id fields are foreign keys that link a donation to a specific donor or food item respectively. I have used REAL as the data type for the quantity column since some donations may have decimal values as their quantities. A CHECK constraint has also been set to ensure that the quantity column has values greater than zero. I have set the status column to only accept the following values: available, reserved, collected and expired. Lastly, the created_at column has been set to use the CURRENT_TIMESTAMP function.

The requests table consists of the id, charity_id, donation_id, requested_at and status of a request. The charity_id, donation_id, and foreign keys that link a charity to a specific donation. The requested_at column is set to use the CURRENT_TIMESTAMP function while the status column has been set to only accept the following values: pending, approved, rejected, and cancelled.

The deliveries table consists of id, donation_id, charity_id, volunteer_id, pickup_time, delivery_time, and the status of a delivery. The charity_id, donation_id and volunteer_id fields are foreign keys that link a delivery to the appropriate donation, charity and volunteer respectively. The id field of the donation is set to UNIQUE since this database design will ensure that each donation has only one delivery. The status column has also been set to only accept the following values: scheduled, picked_up, delivered, and cancelled.

### Relationships

One donor can make many donations but one donation can only be made by one donor.

One food item can be donated many times but one donation can only involve one food item.

One charity can make many requests but one request can only be made by one charity.

One donation can receive many requests from different charities.

One charity can receive many deliveries and one volunteer can deliver many donations but one delivery can only involve one charity, one donation and one volunteer.

## Optimizations

Views and indexes have been created to speed up the querying processes for particular database operations. The kuala_lumpur_available_donations view will store the query that gets available donations in Kuala Lumpur by joining the donors, donations and food_items tables.

This query will not be done every time a user wants to get this information and the NOT NULL constraint has been set on several fields in all tables to ensure data integrity.

The donor_totals view allows the user to easily get the total number of donations that a donor has made.

The donation_status_search index speeds up the process of querying donations based on their status.

The available_donation_search partial index only stores expiry dates for donations that are currently available and is therefore useful when searching for available donations that are about to expire.

The donor_city_search index helps to speed up the process of querying donors based on the city that they are in.

The request_charity_search index helps to speed up the process of querying requests that have been made by a particular charity.

The delivery_volunteer_search index helps to speed up the process of querying deliveries that a particular volunteer is handling.


## Limitations

One of the limitations of this database is that each donation can only involve one food item and one delivery. This means that it would not be efficient in a situation where a donor donates different food items at the same time or when a delivery has to involve multiple vehicles.

This database design does not also account for addresses, GPS tracking or delivery routing. Another limitation is that the status of a donation, request or delivery can only be changed manually and the statuses of the donations, requests and deliveries are handled separately.
