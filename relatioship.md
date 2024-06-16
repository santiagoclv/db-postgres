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



