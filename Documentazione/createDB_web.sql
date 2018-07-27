DROP SCHEMA IF EXISTS software_house_web;
CREATE SCHEMA software_house_web;
USE software_house_web;

CREATE TABLE ruolo(
    nome VARCHAR(20) NOT NULL PRIMARY KEY,
    descrizione VARCHAR(255)
    );

CREATE TABLE utente(
	id_utente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	email VARCHAR(100) NOT NULL UNIQUE,
    hashed_password CHAR(64) NOT NULL, #sha-256
    telefono DECIMAL(10),
    nome VARCHAR(15) NOT NULL,
    cognome VARCHAR(15) NOT NULL,
    data_nascita DATE NOT NULL
    );
    
CREATE TABLE info_spedizione(
	id_info INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    paese VARCHAR(2) NOT NULL,
    provincia VARCHAR(2) NOT NULL,
    cap DECIMAL(5) NOT NULL,
    via VARCHAR(30) NOT NULL,
	civico INT UNSIGNED NOT NULL
    );
    
CREATE TABLE info_relazione(
	id_info INT NOT NULL,
    id_utente INT NOT NULL,
    PRIMARY KEY(id_info, id_utente), 
    FOREIGN KEY(id_utente) REFERENCES utente(id_utente) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_info) REFERENCES info_spedizione(id_info) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
CREATE TABLE possiede_ruolo(
	nome VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY(email, nome), 
    FOREIGN KEY(email) REFERENCES utente(email) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(nome) REFERENCES ruolo(nome) ON UPDATE CASCADE
    );

CREATE TABLE materiale(
	id_materiale TINYINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_materiale VARCHAR(40) NOT NULL DEFAULT 'Non noto',
    costo DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 1,
    descrizione_materiale VARCHAR(255) NOT NULL DEFAULT 'Non nota'
    );

CREATE TABLE dipendente(
    id_utente INT NOT NULL PRIMARY KEY,
    cf CHAR(16) NOT NULL,
    FOREIGN KEY(id_utente) REFERENCES utente(id_utente) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE azienda(
    id_azienda INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_azienda VARCHAR(40) NOT NULL DEFAULT 'Non noto',
    indirizzo VARCHAR(50) NOT NULL DEFAULT 'Non noto'
    );
    
CREATE TABLE dipendente_interno(
	id_utente INT NOT NULL PRIMARY KEY,
    salario DECIMAL(15,2) UNSIGNED NOT NULL DEFAULT 0,
    FOREIGN KEY(id_utente) REFERENCES dipendente(id_utente) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
CREATE TABLE dipendente_esterno(
    id_utente INT NOT NULL PRIMARY KEY,
    cf CHAR(16) NOT NULL,
    parcella_oraria DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT 0,
    ore_lavorative TINYINT UNSIGNED NOT NULL DEFAULT 0,
    FOREIGN KEY(id_utente) REFERENCES dipendente(id_utente) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
CREATE TABLE fornito_da(
    id_utente INT NOT NULL UNIQUE, #cf CHAR(16) NOT NULL UNIQUE,
    id_azienda INT UNSIGNED NOT NULL,
    PRIMARY KEY(id_utente, id_azienda),
    FOREIGN KEY(id_utente) REFERENCES dipendente_esterno(id_utente) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_azienda) REFERENCES azienda(id_azienda) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE ha_recapito(
    numero_telefono DECIMAL(10) NOT NULL PRIMARY KEY,
    id_azienda INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_azienda) REFERENCES azienda(id_azienda) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
CREATE TABLE dipartimento(
    id_dipartimento TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    nome_dipartimento VARCHAR(35) NOT NULL DEFAULT 'Non noto',
    via VARCHAR(25) NOT NULL DEFAULT 'Non nota',
    civico INT UNSIGNED NOT NULL,
    cap INT UNSIGNED NOT NULL,
    spese_dipartimento DECIMAL(20,2) UNSIGNED NOT NULL DEFAULT 0,
    id_utente INT NOT NULL,
    FOREIGN KEY(id_utente) REFERENCES dipendente_interno(id_utente)
    );
    
CREATE TABLE progetto(
    ida VARCHAR(15) NOT NULL PRIMARY KEY,
    nome_progetto VARCHAR(40) NOT NULL DEFAULT 'Non noto',
    descrizione_progetto VARCHAR(255) NOT NULL DEFAULT 'Non nota',
    data_inizio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    spese_progetto DECIMAL(20,2) UNSIGNED NOT NULL DEFAULT 0,
    budget DECIMAL(20,2) UNSIGNED NOT NULL DEFAULT 0,
    id_utente INT NOT NULL,
    id_dipartimento TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(id_utente) REFERENCES dipendente(id_utente) ON DELETE CASCADE ON UPDATE CASCADE, #NON ANDAVA CON ON DELETE SET DEFAULT
    FOREIGN KEY(id_dipartimento) REFERENCES dipartimento(id_dipartimento) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
CREATE TABLE usa(
    id_materiale TINYINT UNSIGNED NOT NULL,
    ida VARCHAR(15) NOT NULL,
    quantita_usata TINYINT NOT NULL DEFAULT 1,
    FOREIGN KEY(id_materiale) REFERENCES materiale(id_materiale) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(ida) REFERENCES progetto(ida) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(id_materiale, ida)
    );


#VEDERE DIP EST ORE_LAVORATIVE FARE ALTRA PARTECIPA??
CREATE TABLE partecipa(
    id_utente INT NOT NULL,
    ida VARCHAR(15) NOT NULL,
    FOREIGN KEY(id_utente) REFERENCES dipendente(id_utente) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(ida) REFERENCES progetto(ida) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(id_utente, ida)
    );

CREATE TABLE prodotto(
	id_prodotto SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
	nome_prodotto VARCHAR(30) NOT NULL DEFAULT 'Non noto',
	versione CHAR(5) NOT NULL DEFAULT '0.0',
    descrizione TEXT,
	ida VARCHAR(15) NOT NULL,
	FOREIGN KEY(ida) REFERENCES progetto(ida) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(id_prodotto, ida)
	);
        
CREATE TABLE prodotto_in_vendita(
    id_prodotto SMALLINT UNSIGNED NOT NULL PRIMARY KEY,
	prezzo DECIMAL(10,2) NOT NULL DEFAULT 1,
	FOREIGN KEY(id_prodotto) REFERENCES prodotto(id_prodotto) ON DELETE CASCADE ON UPDATE CASCADE
	);
        
CREATE TABLE prodotto_in_sviluppo(
    id_prodotto SMALLINT UNSIGNED NOT NULL PRIMARY KEY,
	data_consegna TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(id_prodotto) REFERENCES prodotto(id_prodotto) ON DELETE CASCADE ON UPDATE CASCADE
	);
    
CREATE TABLE fattura(
    numero_fattura INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    importo DECIMAL(20,2) UNSIGNED NOT NULL DEFAULT 0,
    data_emissione TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    sconto INT UNSIGNED NOT NULL DEFAULT 0,
    id_azienda INT UNSIGNED,
    FOREIGN KEY(id_azienda) REFERENCES azienda(id_azienda) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
CREATE TABLE comprende(
    id_prodotto SMALLINT UNSIGNED NOT NULL,
    numero_fattura INT UNSIGNED NOT NULL,
    quantita SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    FOREIGN KEY(id_prodotto) REFERENCES prodotto_in_vendita(id_prodotto) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(numero_fattura) REFERENCES fattura(numero_fattura) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(numero_fattura, id_prodotto)
    );
    
CREATE TABLE recensione(
	id_recensione SMALLINT UNSIGNED DEFAULT '0',
    id_prodotto SMALLINT UNSIGNED NOT NULL,
    no_stelle DECIMAL(1) UNSIGNED NOT NULL,
    commento VARCHAR(255) DEFAULT 'non commentato',
    PRIMARY KEY(id_recensione, id_prodotto),
    FOREIGN KEY(id_prodotto) REFERENCES prodotto_in_vendita(id_prodotto)
    );
    
DELIMITER $$
CREATE TRIGGER agg_a_fattura AFTER INSERT ON comprende 
FOR EACH ROW
BEGIN
	 DECLARE prezzo INT;
     
	 SET @prezzo = (SELECT prodotto_in_vendita.prezzo
	 FROM prodotto_in_vendita
     WHERE prodotto_in_vendita.id_prodotto = NEW.id_prodotto);
     
     UPDATE fattura
     SET importo = importo + @prezzo * NEW.quantita
     WHERE fattura.numero_fattura = NEW.numero_fattura;
END;$$

CREATE TRIGGER dipartimento_check BEFORE INSERT ON partecipa
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT DISTINCT COUNT(pa.ida) AS co
				FROM partecipa pa
				WHERE NEW.id_utente = pa.id_utente
				HAVING (co > 1))
				THEN
				SET NEW.id_utente = NULL;
	END IF;
END;$$


CREATE TRIGGER agg_materiale AFTER INSERT ON usa
FOR EACH ROW
BEGIN
	DECLARE unit INT;
    SET @unit = (SELECT m.costo FROM materiale m WHERE m.id_materiale = NEW.id_materiale);
    UPDATE progetto SET spese_progetto = spese_progetto + @unit * NEW.quantita_usata WHERE ida = NEW.ida;
END;$$

CREATE TRIGGER rem_materiale AFTER DELETE ON usa
FOR EACH ROW
BEGIN
	DECLARE unit INT;
    SET @unit = (SELECT m.costo FROM materiale m WHERE m.id_materiale = OLD.id_materiale);
    UPDATE progetto SET spese_progetto = spese_progetto - @unit * OLD.quantita_usata WHERE ida = OLD.ida;
END;$$


CREATE TRIGGER agg_par_est AFTER INSERT ON partecipa
FOR EACH ROW
BEGIN
	DECLARE ore INT;	
	IF EXISTS(SELECT d.id_utente
				FROM dipendente_esterno d
                WHERE d.id_utente = NEW.id_utente) THEN
		UPDATE dipendente_esterno d2
        SET d2.ore_lavorative = d2.ore_lavorative + 12
        WHERE d2.id_utente = NEW.id_utente;
	END IF;
END;$$


CREATE TRIGGER mod_val_est AFTER UPDATE ON dipendente_esterno
FOR EACH ROW
BEGIN
	IF OLD.parcella_oraria <=> NEW.parcella_oraria OR OLD.ore_lavorative <=> NEW.ore_lavorative THEN
    UPDATE dipartimento d, partecipa
    SET d.spese_dipartimento = d.spese_dipartimento - (OLD.parcella_oraria * OLD.ore_lavorative) + (NEW.parcella_oraria * NEW.ore_lavorative);
    END IF;
END;$$

CREATE TRIGGER del_par_est BEFORE DELETE ON partecipa
FOR EACH ROW
BEGIN
	DECLARE ore INT;	
	IF EXISTS(SELECT d.id_utente
				FROM dipendente_esterno d
                WHERE d.is_utente = OLD.id_utente) THEN
		UPDATE dipendente_esterno d2
        SET d2.ore_lavorative = d2.ore_lavorative - 12
        WHERE d2.id_utente = OLD.id_utente;
	END IF;
END;$$


CREATE TRIGGER add_recensione BEFORE INSERT ON recensione
FOR EACH ROW
BEGIN
	DECLARE progressivo SMALLINT UNSIGNED;
	IF EXISTS (SELECT r.id_recensione
		FROM recensione r
		WHERE r.id_prodotto = NEW.id_prodotto
		ORDER BY id_recensione DESC LIMIT 1) THEN
		
        SET NEW.id_recensione = (SELECT r.id_recensione
			FROM recensione r
			WHERE r.id_prodotto = NEW.id_prodotto
			ORDER BY id_recensione DESC LIMIT 1) + 1;
    
		ELSE
			SET NEW.id_recensione = 1;
	END IF;
    
END;$$

CREATE TRIGGER add_user AFTER INSERT ON utente
FOR EACH ROW
BEGIN
	INSERT possiede_ruolo(email, nome) VALUES(NEW.email, "registered");
END;$$

INSERT ruolo VALUES("registered", "Utente base registrato"),
("management", "Utente di tipo manageriale");
$$
/*
INSERT possiede_ruolo(nome,email) VALUES("registered", "abcde@ab.c"),("managment","abcde@abw.w");$$
/*
 username VARCHAR(50) NOT NULL UNIQUE,
    hashed_password CHAR(64), #sha-256
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono DECIMAL(10),
    nome VARCHAR(15) NOT NULL,
    cognome VARCHAR(15) NOT NULL,
    data_nascita TIMESTAMP NOT NULL

*/

DELIMITER $$
LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\utente.sql' INTO TABLE utente
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(email,hashed_password,nome,cognome,data_nascita);
$$

LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\dipendente.sql' INTO TABLE dipendente
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(cf,id_utente);
$$


LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\dipendente_interno.sql' INTO TABLE dipendente_interno
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(id_utente,salario);
$$


LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\dipendente_esterno.sql' INTO TABLE dipendente_esterno
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(id_utente, parcella_oraria);
$$

LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\dipartimento.sql' INTO TABLE dipartimento
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(nome_dipartimento,via,civico,cap,id_utente);
$$

LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\progetto.sql' INTO TABLE progetto
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(ida,nome_progetto,descrizione_progetto,budget,id_utente,id_dipartimento);
$$

LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\azienda.sql' INTO TABLE azienda
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(nome_azienda,indirizzo);
$$

LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\ha_recapito.sql' INTO TABLE ha_recapito
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(id_azienda,numero_telefono);
$$

LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\materiale.sql' INTO TABLE materiale
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(nome_materiale,descrizione_materiale,costo);
$$


INSERT prodotto(id_prodotto, ida, nome_prodotto, descrizione, versione) VALUES
(1, "gamma", "WebGear", "Negli ultimi anni la realtà virtuale si sta affermando sempre più sul mercato videoludico. La proposta di SoftwareHouseWeb è il WebGear, un visore di realtà virtuale che può competere con i top di gamma del settore", "1.11"), 
(2, "pi", "VisualTool", "Tool di visualizzazione di dati scientifici. Permette la realizzazione anche dei grafici più complessi. Sono disponibili i pulg in per l'analisi statistica ed il supporto a formati non propietari", "2.45c"),
(3, "beta", "EasyAds", "Gestione e monitorizzazione dei propri annuncio personalizzati in maniera semplice e veloce. Con EasyAds avrai a disposizione uno strumento di tageting ads di livello professionale con un'elevata facilità d'utilizzo", "13.01");$$

INSERT prodotto_in_vendita(id_prodotto, prezzo) VALUES
(1, 10),
(2, 170),
(3, 455);$$


LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\prodotto.sql' INTO TABLE prodotto
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(ida,nome_prodotto);
$$

LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\prodotto_in_vendita.sql' INTO TABLE prodotto_in_vendita
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(id_prodotto,prezzo);
$$


LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\prodotto_in_sviluppo.sql' INTO TABLE prodotto_in_sviluppo
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(id_prodotto);
$$

LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\usa.sql' INTO TABLE usa
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(ida,id_materiale,quantita_usata);
$$ 

LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\partecipa-web.sql' INTO TABLE partecipa
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(id_utente,ida);
$$ 

LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\fattura.sql' INTO TABLE fattura
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(id_azienda);
$$ 

LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\comprende.sql' INTO TABLE comprende
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(numero_fattura,id_prodotto,quantita);
$$ 

LOAD DATA LOCAL INFILE 'C:\\Users\\vitto\\Desktop\\AIELLO_SANSONE\\Script_mysql\\fornito_da.sql' INTO TABLE fornito_da
FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES
(id_azienda,id_azienda);
$$ 

INSERT possiede_ruolo(nome,email) VALUES("management","v.a@b.c");$$
