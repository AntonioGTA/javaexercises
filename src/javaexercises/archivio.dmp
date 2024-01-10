--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10
-- Dumped by pg_dump version 14.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: cambiostatoaereo(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.cambiostatoaereo() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
	  IF OLD.Stato = 'funzionante' AND NEW.Stato = 'non funzionante' THEN
		UPDATE voli
		SET codiceAereo = NEW.codiceAereo
		WHERE codiceAereo = OLD.codiceAereo;
	  END IF;
	  RETURN NEW;
	END;
	$$;


ALTER FUNCTION public.cambiostatoaereo() OWNER TO postgres;

--
-- Name: inserimentonuovovolo(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.inserimentonuovovolo() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	DECLARE
		countFirstFlight INT;
	BEGIN
		SELECT COUNT(*) INTO countFirstFlight
		FROM Voli
		WHERE codiceCompagnia = NEW.codiceCompagnia AND terminaleOrigine = NEW.terminaleOrigine
		AND terminaleDestinazione = NEW.terminaleDestinazione;

		IF countFirstFlight = 1 THEN
			UPDATE Aerei
			SET note = 'Volo inaugurale in data ' || TO_CHAR(NEW.dataViaggio, 'DD-MM-YYYY')
			WHERE idaeroporto = NEW.idaeroporto;
		END IF;

		RETURN NEW;
	END;
	$$;


ALTER FUNCTION public.inserimentonuovovolo() OWNER TO postgres;

--
-- Name: inserimentoprenotazione(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.inserimentoprenotazione() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
		UPDATE Statistiche
		SET 
			numeroPrenotazioni = numeroPrenotazioni + 1,
			etaMediaPasseggeri = ((etaMediaPasseggeri * (numeroPrenotazioni - 1)) + NEW.eta) / numeroPrenotazioni,
			numeroAdulti = CASE WHEN NEW.eta > 18 THEN numeroAdulti + 1 ELSE numeroAdulti END,
			numeroBambini = CASE WHEN NEW.eta <= 18 THEN numeroBambini + 1 ELSE numeroBambini END,
			totaleEuroFatturato = totaleEuroFatturato + NEW.costoFatturato
		WHERE idVolo = NEW.numeroVolo;

		RETURN NEW;
	END;
	$$;


ALTER FUNCTION public.inserimentoprenotazione() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aerei; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aerei (
    codiceaereo character varying(255) NOT NULL,
    codicecompagnia integer,
    modello character varying(255),
    stato character varying(20),
    note character varying(255)
);


ALTER TABLE public.aerei OWNER TO postgres;

--
-- Name: aeroporti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aeroporti (
    idaeroporto integer NOT NULL,
    citta character varying(255),
    nazione character varying(255),
    numpiste integer,
    nomeaeroporto character varying(255)
);


ALTER TABLE public.aeroporti OWNER TO postgres;

--
-- Name: clienti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clienti (
    idcliente integer NOT NULL,
    nome character varying(255),
    indirizzo character varying(255),
    numerotelefono character varying(20),
    eta integer
);


ALTER TABLE public.clienti OWNER TO postgres;

--
-- Name: compagnieaeree; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compagnieaeree (
    idcompagnia integer NOT NULL,
    nomecompagnia character varying(255),
    sede character varying(255)
);


ALTER TABLE public.compagnieaeree OWNER TO postgres;

--
-- Name: merce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merce (
    idmerce integer NOT NULL,
    descrizione character varying(255),
    idvolo character varying(10)
);


ALTER TABLE public.merce OWNER TO postgres;

--
-- Name: passeggeri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passeggeri (
    idpasseggero integer NOT NULL,
    nome character varying(255),
    cognome character varying(255),
    codicevolo character varying(10)
);


ALTER TABLE public.passeggeri OWNER TO postgres;

--
-- Name: prenotazioni; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prenotazioni (
    idprenotazione integer NOT NULL,
    codicecliente integer,
    numerovolo character varying(5),
    dataprenotazione date,
    dataviaggio date,
    internazionale boolean,
    costofatturato numeric(10,2)
);


ALTER TABLE public.prenotazioni OWNER TO postgres;

--
-- Name: statistiche; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statistiche (
    idstatistiche character varying NOT NULL,
    numeroprenotazioni integer,
    etamediapasseggeri numeric(5,2),
    numeroadulti integer,
    numerobambini integer,
    totaleeurofatturato numeric(10,2)
);


ALTER TABLE public.statistiche OWNER TO postgres;

--
-- Name: voli; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voli (
    idvolo character varying(5) NOT NULL,
    codicecompagnia integer,
    codiceaereo character varying(255),
    terminaleorigine character varying(255),
    terminaledestinazione character varying(255),
    postiprenotati integer,
    postidisponibili integer,
    costobase numeric(10,2)
);


ALTER TABLE public.voli OWNER TO postgres;

--
-- Data for Name: aerei; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aerei (codiceaereo, codicecompagnia, modello, stato, note) FROM stdin;
AZ278	1	Airbus A320	Operativo	Note1
BY389	2	Boeing 737	In manutenzione	Note2
CX490	3	Embraer E190	Operativo	Note3
DW501	4	Airbus A380	Operativo	Note4
EV612	5	Boeing 747	In manutenzione	Note5
FT723	6	Airbus A350	Operativo	Note6
\.


--
-- Data for Name: aeroporti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aeroporti (idaeroporto, citta, nazione, numpiste, nomeaeroporto) FROM stdin;
1	Parigi	Francia	3	Aeroporto di Parigi
2	Berlino	Germania	4	Aeroporto di Berlino
3	Madrid	Spagna	2	Aeroporto di Madrid
4	Londra	Regno Unito	0	Heathrow Airport
5	Roma	Italia	4	Leonardo da Vinci Airport
6	Atlanta	Stati Uniti	5	Hartsfield-Jackson Atlanta International Airport
7	Marsiglia	Francia	0	Aeroporto di Marsiglia
\.


--
-- Data for Name: clienti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clienti (idcliente, nome, indirizzo, numerotelefono, eta) FROM stdin;
1	Alice	Indirizzo1	3234567890	14
2	Bob	Indirizzo2	3876543210	20
3	Charlie	Indirizzo3	3678901234	25
4	Elena	Indirizzo4	3345678901	32
5	Marco	Indirizzo5	3456789012	45
6	Isabella	Indirizzo6	3567890123	12
\.


--
-- Data for Name: compagnieaeree; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compagnieaeree (idcompagnia, nomecompagnia, sede) FROM stdin;
1	AirFrance	Parigi
2	Lufthansa	Berlino
3	Iberia	Madrid
4	British Airways	Londra
5	Alitalia	Roma
6	Delta Airlines	Atlanta
\.


--
-- Data for Name: merce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merce (idmerce, descrizione, idvolo) FROM stdin;
1	Elettronica	1
2	Libri	2
3	Quaderni	3
4	Gioielli	4
5	Elettronica	5
6	Abbigliamento	6
\.


--
-- Data for Name: passeggeri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passeggeri (idpasseggero, nome, cognome, codicevolo) FROM stdin;
1	Emma	Smith	1
2	David	Johnson	2
3	Sophia	Williams	3
4	Liam	Miller	1
5	Olivia	Davis	2
6	Noah	Taylor	3
\.


--
-- Data for Name: prenotazioni; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prenotazioni (idprenotazione, codicecliente, numerovolo, dataprenotazione, dataviaggio, internazionale, costofatturato) FROM stdin;
1	1	1	2023-01-01	2023-01-10	t	550.00
2	2	2	2023-02-01	2023-02-15	f	650.00
3	3	3	2023-03-01	2023-03-20	t	600.00
4	4	4	2023-04-01	2023-04-15	f	500.00
5	5	5	2023-05-01	2023-05-10	f	600.00
6	6	6	2023-06-01	2023-06-20	t	700.00
\.


--
-- Data for Name: statistiche; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statistiche (idstatistiche, numeroprenotazioni, etamediapasseggeri, numeroadulti, numerobambini, totaleeurofatturato) FROM stdin;
1	100	28.50	80	20	50000.00
2	150	32.00	120	30	75000.00
3	120	29.50	90	30	60000.00
4	110	35.00	90	20	52800.00
5	130	40.50	100	30	71500.00
6	90	28.00	60	30	63000.00
\.


--
-- Data for Name: voli; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voli (idvolo, codicecompagnia, codiceaereo, terminaleorigine, terminaledestinazione, postiprenotati, postidisponibili, costobase) FROM stdin;
1	1	AZ278	Roma	Berlino	100	50	500.00
2	2	BY389	Parigi	Francoforte	150	75	600.00
3	3	CX490	Marsiglia	Amburgo	120	60	550.00
4	4	DW501	Barcellona	Düsseldorf	110	40	480.00
5	5	EV612	Madrid	Stoccarda	130	70	550.00
6	6	FT723	Lisbona	Praga	90	50	600.00
\.


--
-- Name: aerei aerei_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aerei
    ADD CONSTRAINT aerei_pkey PRIMARY KEY (codiceaereo);


--
-- Name: aeroporti aeroporti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aeroporti
    ADD CONSTRAINT aeroporti_pkey PRIMARY KEY (idaeroporto);


--
-- Name: clienti clienti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clienti
    ADD CONSTRAINT clienti_pkey PRIMARY KEY (idcliente);


--
-- Name: compagnieaeree compagnieaeree_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compagnieaeree
    ADD CONSTRAINT compagnieaeree_pkey PRIMARY KEY (idcompagnia);


--
-- Name: merce merce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merce
    ADD CONSTRAINT merce_pkey PRIMARY KEY (idmerce);


--
-- Name: passeggeri passeggeri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggeri
    ADD CONSTRAINT passeggeri_pkey PRIMARY KEY (idpasseggero);


--
-- Name: prenotazioni prenotazioni_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazioni
    ADD CONSTRAINT prenotazioni_pkey PRIMARY KEY (idprenotazione);


--
-- Name: statistiche statistiche_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistiche
    ADD CONSTRAINT statistiche_pkey PRIMARY KEY (idstatistiche);


--
-- Name: voli voli_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voli
    ADD CONSTRAINT voli_pkey PRIMARY KEY (idvolo);


--
-- Name: aerei cambiostatoaereo; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER cambiostatoaereo AFTER UPDATE ON public.aerei FOR EACH ROW EXECUTE FUNCTION public.cambiostatoaereo();


--
-- Name: voli inserimentonuovovolo; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER inserimentonuovovolo AFTER INSERT ON public.voli FOR EACH ROW EXECUTE FUNCTION public.inserimentonuovovolo();


--
-- Name: prenotazioni inserimentoprenotazione; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER inserimentoprenotazione AFTER INSERT ON public.prenotazioni FOR EACH ROW EXECUTE FUNCTION public.inserimentoprenotazione();


--
-- Name: aerei aerei_codicecompagnia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aerei
    ADD CONSTRAINT aerei_codicecompagnia_fkey FOREIGN KEY (codicecompagnia) REFERENCES public.compagnieaeree(idcompagnia);


--
-- Name: merce merce_idvolo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merce
    ADD CONSTRAINT merce_idvolo_fkey FOREIGN KEY (idvolo) REFERENCES public.voli(idvolo);


--
-- Name: passeggeri passeggeri_codicevolo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggeri
    ADD CONSTRAINT passeggeri_codicevolo_fkey FOREIGN KEY (codicevolo) REFERENCES public.voli(idvolo);


--
-- Name: prenotazioni prenotazioni_codicecliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazioni
    ADD CONSTRAINT prenotazioni_codicecliente_fkey FOREIGN KEY (codicecliente) REFERENCES public.clienti(idcliente);


--
-- Name: prenotazioni prenotazioni_numerovolo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazioni
    ADD CONSTRAINT prenotazioni_numerovolo_fkey FOREIGN KEY (numerovolo) REFERENCES public.voli(idvolo);


--
-- Name: statistiche statistiche_idstatistiche_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistiche
    ADD CONSTRAINT statistiche_idstatistiche_fkey FOREIGN KEY (idstatistiche) REFERENCES public.voli(idvolo);


--
-- Name: voli voli_codiceaereo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voli
    ADD CONSTRAINT voli_codiceaereo_fkey FOREIGN KEY (codiceaereo) REFERENCES public.aerei(codiceaereo);


--
-- Name: voli voli_codicecompagnia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voli
    ADD CONSTRAINT voli_codicecompagnia_fkey FOREIGN KEY (codicecompagnia) REFERENCES public.compagnieaeree(idcompagnia);


--
-- PostgreSQL database dump complete
--

