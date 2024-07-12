# Postgres Notes

# Relationships

### One-To-Many and Many-To-One

They are the same type of relationship but they depend on the perspective that we take to read the data relashionship.

### One-To-One

One record has only one corresponding record, at all time.

Persona <-> Driver's Licence
Boats <-> Captains

### Many-To-Many

Many records are related to Many other records, it is related to time sometimes.

Movies <-> Actors
Students <-> Classes


## Foreign Key

Relationship between two tables are usually made through **foreign keys**

The **Foreign Key** is located in the table in the **many** side of the relationship in a **One-To-Many**

### *Constraints:* 
It is not possible to insert a **value key that does not exist** on the table referenced by the foreign key, but it is possible to insert the foreign key as **NULL** if the foreign key definition allows it.

### *On Deletion*:
Options when a entity refered by a foreign key is tryied to delete

* **ON DELETE RESTRICT** -> Throw an error (defaults)
* **ON DELETE NO ACTION** -> Throw an error
* **ON DELETE CASCADE** -> Delete references too
* **ON DELETE SET NULL** -> Set foreign key to null
* **ON DELETE SET DEFAULT** -> Set foreign key to a default value, if one is provided.

## Join types

### INNER JOIN 

* Only keeps rows that are part of the intersection (through join on condition) of both tables part of the join.

### LEFT JOIN 

* It will keep rows that are part of the intersection (through join on condition) of both groups-tables, plus all rows that are left in the left group-table (without matching row on the right group-table).

### RIGHT JOIN 

* It will keep rows that are part of the intersection (through join on condition) of both groups-tables, plus all rows that are left in the right group-table (without matching row on the left group-table).

### FULLL JOIN 

* It will keep all rows that are part of both groups-tables.

#  Aggregating and Grouping

* Grouping: group many rows under groups by using **GROUP BY** based on selected columns
    Only columns used to group can be selected and aggregation functions over the groups.
* Aggregating: reduce all values from a column/group down to one by using aggregate functions.
    Examples: **SUM**, **COUNT**, **AVG**, **MIN**, **MAX**, and more...

## Filtering over groups - HAVING

* When it is important to filter over set of groups
