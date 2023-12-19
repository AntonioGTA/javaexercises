CREATE TABLE CompagnieAeree (
		idcompagnia INT PRIMARY KEY,
		nomeCompagnia VARCHAR(255),
		sede VARCHAR(255)
	);
	
	CREATE TABLE Aeroporti (
		idaeroporto INT PRIMARY KEY,
		citta VARCHAR(255),
		nazione VARCHAR(255),
		numpiste INT,
		nomeAeroporto VARCHAR(255)
		);
		
		CREATE TABLE Aerei (
		CodiceAereo VARCHAR(255) PRIMARY KEY,
		codiceCompagnia INT,
		modello VARCHAR(255),
		stato VARCHAR(20),
		note VARCHAR(255),
		FOREIGN KEY (codiceCompagnia) REFERENCES CompagnieAeree(idcompagnia)
	);
	
	CREATE TABLE Clienti (
		idcliente INT PRIMARY KEY,
		nome VARCHAR(255),
		indirizzo VARCHAR(255),
		numeroTelefono VARCHAR(20),
		eta INT
	)
	
	CREATE TABLE Voli (
    idvolo VARCHAR(5) PRIMARY KEY,
    codiceCompagnia INT,
    codiceaereo VARCHAR(255),
    terminaleOrigine VARCHAR(255),
    terminaleDestinazione VARCHAR(255),
    postiPrenotati INT,
    postiDisponibili INT,
    costoBase DECIMAL(10, 2),
    FOREIGN KEY (codiceCompagnia) REFERENCES CompagnieAeree(idcompagnia),
    FOREIGN KEY (codiceaereo) REFERENCES Aerei(CodiceAereo)
);

CREATE TABLE Prenotazioni (
    idprenotazione INT PRIMARY KEY,
    codiceCliente INT,
    numeroVolo VARCHAR(5),
    dataPrenotazione DATE,
    dataViaggio DATE,
    internazionale BOOLEAN,
    costoFatturato DECIMAL(10, 2),
    FOREIGN KEY (numeroVolo) REFERENCES Voli(idvolo),
    FOREIGN KEY (codiceCliente) REFERENCES Clienti(idcliente)
);

CREATE TABLE Statistiche (
    idStatistiche VARCHAR PRIMARY KEY,
    numeroPrenotazioni INT,
    etaMediaPasseggeri DECIMAL(5, 2),
    numeroAdulti INT,
    numeroBambini INT,
    totaleEuroFatturato DECIMAL(10, 2),
    FOREIGN KEY (idStatistiche) REFERENCES Voli(idvolo)
);

CREATE TABLE Passeggeri (
    idpasseggero INT PRIMARY KEY,
    nome VARCHAR(255),
    cognome VARCHAR(255),
    codicevolo VARCHAR(10),
    FOREIGN KEY (codicevolo) REFERENCES Voli(idvolo)
);

CREATE TABLE Merce (
    idmerce INT PRIMARY KEY,
    Descrizione VARCHAR(255),
    idvolo VARCHAR(10),
    FOREIGN KEY (idvolo) REFERENCES Voli(idvolo)
);

-----------------------------------------------------------------------------------

INSERT INTO CompagnieAeree (idcompagnia, nomeCompagnia, sede) VALUES
    (1, 'AirFrance', 'Parigi'),
    (2, 'Lufthansa', 'Berlino'),
    (3, 'Iberia', 'Madrid'),
    (4, 'British Airways', 'Londra'),
    (5, 'Alitalia', 'Roma'),
    (6, 'Delta Airlines', 'Atlanta');
	
INSERT INTO Aeroporti (idaeroporto, citta, nazione, numpiste, nomeAeroporto) VALUES
    (1, 'Parigi', 'Francia', 3, 'Aeroporto di Parigi'),
    (2, 'Berlino', 'Germania', 4, 'Aeroporto di Berlino'),
    (3, 'Madrid', 'Spagna', 2, 'Aeroporto di Madrid'),
    (4, 'Londra', 'Regno Unito', 0, 'Heathrow Airport'),
    (5, 'Roma', 'Italia', 4, 'Leonardo da Vinci Airport'),
    (6, 'Atlanta', 'Stati Uniti', 5, 'Hartsfield-Jackson Atlanta International Airport'),
    (7, 'Marsiglia', 'Francia', 0, 'Aeroporto di Marsiglia');
	
INSERT INTO Aerei (CodiceAereo, codiceCompagnia, modello, stato, note) VALUES
    ('AZ278', 1, 'Airbus A320', 'Operativo', 'Note1'),
    ('BY389', 2, 'Boeing 737', 'In manutenzione', 'Note2'),
    ('CX490', 3, 'Embraer E190', 'Operativo', 'Note3'),
    ('DW501', 4, 'Airbus A380', 'Operativo', 'Note4'),
    ('EV612', 5, 'Boeing 747', 'In manutenzione', 'Note5'),
    ('FT723', 6, 'Airbus A350', 'Operativo', 'Note6');
	
INSERT INTO Clienti (idcliente, nome, indirizzo, numeroTelefono, eta) VALUES
    (1, 'Alice', 'Indirizzo1', '3234567890', 14),
    (2, 'Bob', 'Indirizzo2', '3876543210', 20),
    (3, 'Charlie', 'Indirizzo3', '3678901234', 25),
    (4, 'Elena', 'Indirizzo4', '3345678901', 32),
    (5, 'Marco', 'Indirizzo5', '3456789012', 45),
    (6, 'Isabella', 'Indirizzo6', '3567890123', 12);

INSERT INTO Voli (idvolo, codiceCompagnia, codiceaereo, terminaleOrigine, terminaleDestinazione, postiPrenotati, postiDisponibili, costoBase) VALUES
    ('1', 1, 'AZ278', 'Roma', 'Berlino', 100, 50, 500.00),
    ('2', 2, 'BY389', 'Parigi', 'Francoforte', 150, 75, 600.00),
    ('3', 3, 'CX490', 'Marsiglia', 'Amburgo', 120, 60, 550.00),
    ('4', 4, 'DW501', 'Barcellona', 'Düsseldorf', 110, 40, 480.00),
    ('5', 5, 'EV612', 'Madrid', 'Stoccarda', 130, 70, 550.00),
    ('6', 6, 'FT723', 'Lisbona', 'Praga', 90, 50, 600.00);

INSERT INTO Prenotazioni (idprenotazione, codiceCliente, numerovolo, dataPrenotazione, dataViaggio, costoFatturato) VALUES
    (1, 1, 1, '2023-01-01', '2023-01-10', 550.00),
    (2, 2, 2, '2023-02-01', '2023-02-15', 650.00),
    (3, 3, 3, '2023-03-01', '2023-03-20', 600.00),
    (4, 4, 4, '2023-04-01', '2023-04-15', 500.00),
    (5, 5, 5, '2023-05-01', '2023-05-10', 600.00),
    (6, 6, 6, '2023-06-01', '2023-06-20', 700.00);

INSERT INTO Statistiche (idStatistiche, numeroPrenotazioni, etaMediaPasseggeri, numeroAdulti, numeroBambini, totaleEuroFatturato) VALUES
    (1, 100, 28.5, 80, 20, 50000.00),
    (2, 150, 32.0, 120, 30, 75000.00),
    (3, 120, 29.5, 90, 30, 60000.00),
    (4, 110, 35.0, 90, 20, 52800.00),
    (5, 130, 40.5, 100, 30, 71500.00),
    (6, 90, 28.0, 60, 30, 63000.00);

INSERT INTO Passeggeri (idpasseggero, nome, cognome, codicevolo) VALUES
    (1, 'Emma', 'Smith', 1),
    (2, 'David', 'Johnson', 2),
    (3, 'Sophia', 'Williams', 3),
    (4, 'Liam', 'Miller', 1),
    (5, 'Olivia', 'Davis', 2),
    (6, 'Noah', 'Taylor', 3);

INSERT INTO Merce (idmerce, Descrizione, idvolo) VALUES
    (1, 'Elettronica', 1),
    (2, 'Libri', 2),
    (3, 'Quaderni', 3),
    (4, 'Gioielli', 4),
    (5, 'Elettronica', 5),
    (6, 'Abbigliamento', 6);
	
-----------------------------------------------------------------------------------

--esercizio 1	
SELECT DISTINCT A.citta
FROM Aeroporti A
JOIN Voli V ON A.idaeroporto = V.codiceCompagnia
WHERE V.terminaleDestinazione = 'Madrid'
ORDER BY A.citta;

--esercizio 2
SELECT citta
FROM Aeroporti
WHERE numpiste = 0;

--esercizio 3
SELECT V.idvolo, P.nome AS nome_passeggero, P.cognome AS cognome_passeggero, M.Descrizione AS descrizione_merce
FROM Voli V
LEFT JOIN Passeggeri P ON V.idvolo = P.codicevolo
LEFT JOIN Merce M ON V.idvolo = M.idvolo;

--esercizio 4
Select A1.citta,A2.citta
from (aeroporti A1 join voli on A1.nazione = terminaleorigine)
join aeroporti A2 on terminaledestinazione = A2.nazione
where CodiceAereo='AZ278'

--esercizio 5
SELECT nomeAeroporto
FROM Aeroporti
WHERE nazione = 'Spagna'
ORDER BY numpiste DESC
LIMIT 1;

--esercizio 6
SELECT nazione, MAX(numpiste) AS massime_piste
FROM Aeroporti
GROUP BY nazione;

--esercizio 7
SELECT nazione, MAX(numpiste) AS massime_piste
FROM Aeroporti
WHERE numpiste >= 3
GROUP BY nazione;

--esercizio 8
WITH MassimePistePerNazione AS (
    SELECT nazione, MAX(numpiste) AS massime_piste
    FROM Aeroporti
    GROUP BY nazione
)
SELECT A.citta
FROM Aeroporti A
JOIN MassimePistePerNazione M ON A.nazione = M.nazione AND A.numpiste = M.massime_piste;

--esercizio 9
SELECT DISTINCT A.nomeaeroporto, A.citta, A.nazione
FROM Aeroporti A
JOIN Voli V ON A.idaeroporto = V.codiceCompagnia
WHERE A.nazione <> V.terminaleDestinazione;

--esercizio 10
SELECT COUNT(*) AS NumeroTotalePartenzeInternazionali
FROM Prenotazioni
WHERE EXTRACT(DOW FROM dataViaggio) = 5
  AND internazionale = true;
  
 --esercizio 11
SELECT A.citta
FROM Aeroporti A
JOIN Voli V ON A.idaeroporto = V.codiceCompagnia
WHERE A.nazione = 'Francia'
  AND V.terminaleDestinazione = 'Germania'
GROUP BY A.citta
HAVING COUNT(*) > 20;