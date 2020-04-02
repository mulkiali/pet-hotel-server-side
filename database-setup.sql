--create database "pet_hotel"

--create owners table
CREATE TABLE "owners" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR NOT NULL
);

--create pets table second because it references owners
CREATE TABLE "pets" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR NOT NULL,
	"breed" VARCHAR NOT NULL,
	"color" VARCHAR NOT NULL,
	"checked_in" BOOLEAN DEFAULT FALSE,
	"owner_id" INT REFERENCES "owners"
);

	--I think later we might want to add "check_in_date" and "check_out_date" or maybe even have a different table "stays" that contains those in pairs.
	--But it seems like for base mode we don't actually need to mess with dates.


--insert starter data:
INSERT INTO "owners" ("name") 
VALUES ('Chris'), ('Ally'), ('Dane');

INSERT INTO "pets" 
("name", "breed", "color", "owner_id", "checked_in")
VALUES 
('Charlie', 'Shih-tzu', 'Black', 1, false),
('Thorin', 'Rabbit', 'White', 1, false),
('Gatsby', 'Cat', 'White', 2, true),
('Juniper', 'Cat', 'Tabby', 3, false)
;


--------------------------
--queries we might need:--
--------------------------

--return pet info with name of owner (image 1 in readme)
SELECT "owners"."name" AS "owner_name", "pets"."name" AS "pet_name", "breed", "color", "checked_in" 
FROM "pets" JOIN "owners" ON
"owners"."id"="pets"."owner_id";

--return count of pets per owner (image 2 in readme)
SELECT "owners"."name", count(*) AS "number_pets"
FROM "pets" JOIN "owners" ON
"owners"."id"="pets"."owner_id"
GROUP BY "owners"."name";

--check in pet
UPDATE "pets" SET "checked_in"=true WHERE "pets"."id"=('--id-from-dom--');

--check out pet
UPDATE "pets" SET "checked_in"=false WHERE "pets"."id"=('--id-from-dom--');

--add pet
INSERT INTO "pets" 
("name", "breed", "color", "owner_id") 
VALUES 
('--pet-name-from-dom--', 
 '--pet-breed-from-dom--',
 '--pet-color-from-dom--',
 '--owner-id-reference-owners-table--');
 
--add owner
INSERT INTO "owners" ("name") VALUES  ('--owner-name-from-dom--');

--delete pet
DELETE FROM "pets" WHERE "id"=('--id-from-dom--');

--delete owner
DELETE FROM "owners" WHERE "id"=('--id-from-dom--');
	--i think this only works/should be done if they have no pets, because of references


