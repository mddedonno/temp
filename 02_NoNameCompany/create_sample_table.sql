-- replace stefan_koch mit deinem namen
CREATE SCHEMA stefan_koch;
GO

CREATE TABLE stefan_koch.Person (
    PersonID INT IDENTITY(1,1) PRIMARY KEY,
    Vorname NVARCHAR(50),
    Nachname NVARCHAR(50),
    Geburtsdatum DATE,
    Email NVARCHAR(100),
    Aktiv BIT
);
GO


INSERT INTO stefan_koch.Person (Vorname, Nachname, Geburtsdatum, Email, Aktiv)
VALUES 
('Max', 'Mustermann', '1985-06-15', 'max.mustermann@example.com', 1),
('Erika', 'Musterfrau', '1990-11-03', 'erika.musterfrau@example.com', 1),
('Hans', 'Müller', '1978-02-20', 'hans.mueller@example.com', 0),
('Julia', 'Schmidt', '1995-09-09', 'julia.schmidt@example.com', 1),
('Peter', 'Petersen', '1982-04-01', 'peter.p@example.com', 0);
GO

SELECT * FROM stefan_koch.Person;