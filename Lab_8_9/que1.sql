CREATE TABLE Gene (
    Gene_id INT PRIMARY KEY,
    Gene_name VARCHAR(50),
    chr VARCHAR(10),
    start_pos INT,
    end_pos INT
);

CREATE TABLE Protein (
    Protein_id INT PRIMARY KEY,
    Protein_name VARCHAR(50),
    Gene_id INT,
    FOREIGN KEY (Gene_id) REFERENCES Gene(Gene_id)
);

INSERT INTO Gene VALUES (1, 'TP53', '17', 7565097, 7590856);
INSERT INTO Gene VALUES (2, 'BRCA1', '17', 43044295, 43125482);
INSERT INTO Gene VALUES (3, 'EGFR', '7', 55086714, 55279321);
INSERT INTO Gene VALUES (4, 'MYC', '8', 127735434, 127742951);
INSERT INTO Gene VALUES (5, 'PTEN', '10', 87863126, 87971930);

INSERT INTO Protein VALUES (101, 'p53alpha', 1);
INSERT INTO Protein VALUES (102, 'p53beta', 1);
INSERT INTO Protein VALUES (103, 'p53gamma', 1);
INSERT INTO Protein VALUES (104, 'BRCA1_protein', 2);
INSERT INTO Protein VALUES (105, 'EGFR_protein', 3);


# we do not need a relation table because:
# Relationship tables are only needed for many-to-many (M:N) relationships.
# Here it is 1:N, so we simply add Gene_id as a foreign key in Protein.