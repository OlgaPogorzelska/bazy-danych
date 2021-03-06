-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-11-30 21:40:53.514

-- tables
-- Table: godziny
CREATE TABLE firma.godziny (
    id_godziny int  NOT NULL,
    data date  NOT NULL,
    liczba_godzin int  NOT NULL,
    id_pracownika int  NOT NULL,
    CONSTRAINT godziny_pk PRIMARY KEY (id_godziny)
);

-- Table: pensja_stanowisko
CREATE TABLE firma.pensja_stanowisko (
    id_pensji int  NOT NULL,
    stanowisko varchar(255)  NOT NULL,
    kwota double precision  NOT NULL,
    CONSTRAINT pensja_stanowisko_pk PRIMARY KEY (id_pensji)
);

-- Table: pracownicy
CREATE TABLE firma.pracownicy (
    id_pracownika int  NOT NULL,
    imie varchar(255)  NOT NULL,
    nazwisko varchar(255)  NOT NULL,
    adres varchar(255)  NOT NULL,
    telefon bigint  NOT NULL,
    CONSTRAINT pracownicy_pk PRIMARY KEY (id_pracownika)
);

-- Table: premia
CREATE TABLE firma.premia (
    id_premii int  NOT NULL,
    rodzaj varchar(255)  NOT NULL,
    kwota double precision  NOT NULL,
    CONSTRAINT premia_pk PRIMARY KEY (id_premii)
);

-- Table: producenci
CREATE TABLE sklep.producenci (
    nazwa_producenta varchar(255)  NULL,
    mail int  NULL,
    telefon bigint  NULL,
    id_producenta int  NOT NULL,
    CONSTRAINT producenci_pk PRIMARY KEY (id_producenta)
);

-- Table: produkty
CREATE TABLE sklep.produkty (
    id_produktu int  NOT NULL,
    nazwa_produktu varchar(255)  NULL,
    cena float  NULL,
    id_producenta int  NOT NULL,
    CONSTRAINT produkty_pk PRIMARY KEY (id_produktu)
);

-- Table: wynagrodzenie
CREATE TABLE firma.wynagrodzenie (
    id_wynagrodzenia int  NOT NULL,
    data date  NOT NULL,
    id_pracownika int  NOT NULL,
    id_godziny int  NOT NULL,
    id_pensji int  NOT NULL,
    id_premii int  NOT NULL,
    CONSTRAINT wynagrodzenie_pk PRIMARY KEY (id_wynagrodzenia)
);

-- Table: zamowienia
CREATE TABLE sklep.zamowienia (
    id_zamowieniaia int  NOT NULL,
    id_produktu int  NOT NULL,
    data date  NULL,
    sztuki int  NULL,
    CONSTRAINT zamowienia_pk PRIMARY KEY (id_zamowieniaia)
);

-- foreign keys
-- Reference: godziny_pracownicy (table: godziny)
ALTER TABLE firma.godziny ADD CONSTRAINT godziny_pracownicy
    FOREIGN KEY (id_pracownika)
    REFERENCES firma.pracownicy (id_pracownika)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: produkty_producenci (table: produkty)
ALTER TABLE sklep.produkty ADD CONSTRAINT produkty_producenci
    FOREIGN KEY (id_producenta)
    REFERENCES sklep.producenci (id_producenta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenie_godziny (table: wynagrodzenie)
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT wynagrodzenie_godziny
    FOREIGN KEY (id_godziny)
    REFERENCES firma.godziny (id_godziny)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenie_pensja_stanowisko (table: wynagrodzenie)
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT wynagrodzenie_pensja_stanowisko
    FOREIGN KEY (id_pensji)
    REFERENCES firma.pensja_stanowisko (id_pensji)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenie_pracownicy (table: wynagrodzenie)
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT wynagrodzenie_pracownicy
    FOREIGN KEY (id_pracownika)
    REFERENCES firma.pracownicy (id_pracownika)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenie_premia (table: wynagrodzenie)
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT wynagrodzenie_premia
    FOREIGN KEY (id_premii)
    REFERENCES firma.premia (id_premii)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: zamowienia_produkty (table: zamowienia)
ALTER TABLE sklep.zamowienia ADD CONSTRAINT zamowienia_produkty
    FOREIGN KEY (id_produktu)
    REFERENCES sklep.produkty (id_produktu)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

