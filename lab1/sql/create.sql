DROP TABLE IF EXISTS test;
CREATE TABLE IF NOT EXISTS
    test(
        """name" serial PRIMARY KEY,
        "name'1" varchar(25),
        "name2" varchar(25),
        "'name3'" varchar(25),
        "'name4'" varchar(25),
        "'name5'" varchar(25),
        name6 varchar(25)

    );

INSERT INTO test VALUES (1,2,3,4,5,6,7);
INSERT INTO test VALUES (2,2,3,4,5,6,7);
INSERT INTO test VALUES (3,2,3,4,5,6,7);
INSERT INTO test VALUES (4,2,3,4,5,6,7);
INSERT INTO test VALUES (5,2,3,4,5,6,7);