CREATE TABLE EigeneSchule (
  ID bigint NOT NULL, 
  SchulformNr varchar(3), 
  SchulformKrz varchar(3), 
  SchulformBez varchar(50), 
  SchultraegerArt varchar(2), 
  SchultraegerNr varchar(6), 
  Schulgliederung varchar(3), 
  SchulNr varchar(6), 
  Bezeichnung1 varchar(50), 
  Bezeichnung2 varchar(50), 
  Bezeichnung3 varchar(50), 
  Strasse varchar(50), 
  PLZ varchar(10), 
  Ort varchar(50), 
  Telefon varchar(20), 
  Fax varchar(20), 
  Email varchar(100), 
  Ganztags varchar(1) DEFAULT '+', 
  Schuljahr smallint, 
  SchuljahrAbschnitt smallint, 
  AnzahlAbschnitte smallint DEFAULT 2, 
  Fremdsprachen varchar(1) DEFAULT '+', 
  UpdateSprachenfolge varchar(1) DEFAULT '+', 
  JVAZeigen varchar(1) DEFAULT '-', 
  RefPaedagogikZeigen varchar(1) DEFAULT '-', 
  AnzJGS_Jahr smallint DEFAULT 1, 
  AbschnittBez varchar(20) DEFAULT 'Halbjahr', 
  BezAbschnitt1 varchar(10) DEFAULT '1. Hj', 
  BezAbschnitt2 varchar(10) DEFAULT '2. Hj', 
  IstHauptsitz varchar(1) DEFAULT '+', 
  NotenGesperrt varchar(1) DEFAULT '-', 
  BezAbschnitt3 varchar(10), 
  BezAbschnitt4 varchar(10), 
  ZurueckgestelltAnzahl int, 
  ZurueckgestelltWeibl int, 
  ZurueckgestelltAuslaender int, 
  ZurueckgestelltAuslaenderWeibl int, 
  ZurueckgestelltAussiedler int, 
  ZurueckgestelltAussiedlerWeibl int, 
  TeamTeaching varchar(1) DEFAULT '+', 
  AbiGruppenprozess varchar(1) DEFAULT '+', 
  DauerUnterrichtseinheit int, 
  Gruppen8Bis1 int, 
  Gruppen13Plus int, 
  InternatsplaetzeM int, 
  InternatsplaetzeW int, 
  InternatsplaetzeNeutral int, 
  SchulLogo longblob, 
  SchulnrEigner int, 
  SchulleiterName varchar(50), 
  SchulleiterVorname varchar(30), 
  SchulleiterAmtsbez varchar(30), 
  SchulleiterGeschlecht int, 
  StvSchulleiterName varchar(50), 
  StvSchulleiterVorname varchar(30), 
  StvSchulleiterAmtsbez varchar(30), 
  StvSchulleiterGeschlecht int, 
  Einstellungen text, 
  Fehlstundenmodell_PrS1 varchar(1) DEFAULT 'G', 
  Fehlstundenmodell_S2 varchar(1) DEFAULT 'F', 
  Tendenznoten_S1 varchar(1) DEFAULT '-', 
  WebKL_Modus varchar(1) DEFAULT 'A', 
  WebMahnungenGesperrt varchar(1) DEFAULT '-', 
  WebNotenGesperrt varchar(1) DEFAULT '-', 
  LogoFormat varchar(3), 
  SchILDweb_Config text, 
  WebTeilLeistungenAnlegen varchar(1) DEFAULT '-', 
  WebInfoMail varchar(1) DEFAULT '-', 
  WebAdresse varchar(100), 
  Land varchar(50), 
  Einstellungen2 text, 
  SchulleiterTitel varchar(10), 
  StvSchulleiterTitel varchar(10),
  CONSTRAINT PK_EigeneSchule PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Fachklassen (
  ID bigint DEFAULT -1 NOT NULL, 
  BKIndex smallint, 
  FKS varchar(3), 
  AP varchar(2), 
  Bezeichnung varchar(100), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  Kennung varchar(10), 
  FKS_AP_SIM varchar(5), 
  BKIndexTyp varchar(3), 
  Beschreibung_W varchar(100), 
  Status varchar(20), 
  SchulnrEigner int, 
  Lernfelder text, 
  DQR_Niveau int, 
  Ebene1Klartext varchar(255), 
  Ebene2Klartext varchar(255), 
  Ebene3Klartext varchar(255),
  CONSTRAINT PK_EigeneSchule_Fachklassen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Fachklassen_UC1 UNIQUE (AP, BKIndexTyp, FKS)
);


CREATE TABLE EigeneSchule_Faecher (
  ID bigint DEFAULT -1 NOT NULL, 
  FachKrz varchar(20), 
  Bezeichnung varchar(255), 
  ZeugnisBez varchar(255), 
  UeZeugnisBez varchar(255), 
  StatistikKrz varchar(2), 
  BasisFach varchar(2), 
  IstSprache varchar(1) DEFAULT '-', 
  Sortierung int DEFAULT 32000, 
  SortierungS2 int DEFAULT 32000, 
  NachprErlaubt varchar(1) DEFAULT '+', 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  Gewichtung smallint DEFAULT 1, 
  Fachgruppe_ID bigint, 
  Unterichtssprache varchar(1), 
  IstSchriftlich varchar(1), 
  IstSchriftlichBA varchar(1), 
  AufZeugnis varchar(1) DEFAULT '+', 
  Lernfelder text, 
  SchulnrEigner int, 
  LK_Moegl varchar(1), 
  Abi_Moegl varchar(1), 
  E1 varchar(1), 
  E2 varchar(1), 
  Q1 varchar(1), 
  Q2 varchar(1), 
  Q3 varchar(1), 
  Q4 varchar(1), 
  AlsNeueFSinSII varchar(1), 
  Leitfach_ID bigint, 
  Leitfach2_ID bigint, 
  E1_WZE int, 
  E2_WZE int, 
  Q_WZE int, 
  E1_S varchar(1) DEFAULT '-', 
  E2_S varchar(1) DEFAULT '-', 
  NurMuendlich varchar(1) DEFAULT '-', 
  Aufgabenfeld varchar(2), 
  AbgeschlFaecherHolen varchar(1) DEFAULT '+', 
  GewichtungFHR int, 
  MaxBemZeichen int,
  CONSTRAINT PK_EigeneSchule_Faecher PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Faecher_UC1 UNIQUE (FachKrz)
);


CREATE TABLE EigeneSchule_FachTeilleistungen (
  SchulnrEigner int NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Teilleistung_ID bigint NOT NULL, 
  Kursart varchar(5),
  CONSTRAINT PK_EigeneSchule_FachTeilleistungen PRIMARY KEY (Fach_ID, Kursart, SchulnrEigner, Teilleistung_ID),
  CONSTRAINT EigeneSchule_FachTeilleistungen_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE EigeneSchule_Jahrgaenge (
  ID bigint DEFAULT -1 NOT NULL, 
  InternKrz varchar(20), 
  ASDJahrgang varchar(2), 
  ASDBezeichnung varchar(100), 
  Sichtbar varchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  IstChronologisch varchar(1) DEFAULT '+', 
  Spaltentitel varchar(2), 
  SekStufe varchar(6), 
  SGL varchar(3), 
  JahrgangNum smallint, 
  Restabschnitte int, 
  SchulnrEigner int, 
  Folgejahrgang_ID bigint,
  CONSTRAINT PK_EigeneSchule_Jahrgaenge PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Jahrgaenge_UC1 UNIQUE (InternKrz)
);


CREATE TABLE EigeneSchule_KAoADaten (
  SchulnrEigner int NOT NULL, 
  Curriculum varchar(1) DEFAULT '+' NOT NULL, 
  Koordinator varchar(1) DEFAULT '+' NOT NULL, 
  Berufsorientierungsbuero varchar(1) DEFAULT '+' NOT NULL, 
  KooperationsvereinbarungAA varchar(1) DEFAULT '+' NOT NULL, 
  NutzungReflexionsworkshop varchar(1) DEFAULT '+' NOT NULL, 
  NutzungEntscheidungskompetenzI varchar(1) DEFAULT '+' NOT NULL, 
  NutzungEntscheidungskompetenzII varchar(1) DEFAULT '+' NOT NULL,
  CONSTRAINT PK_EigeneSchule_KAoADaten PRIMARY KEY (SchulnrEigner)
);


CREATE TABLE EigeneSchule_Kursart (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(120), 
  InternBez varchar(20), 
  Kursart varchar(5), 
  KursartAllg varchar(5), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_EigeneSchule_Kursart PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Kursart_UC1 UNIQUE (Kursart, KursartAllg)
);


CREATE TABLE EigeneSchule_KursartAllg (
  ID bigint DEFAULT -1 NOT NULL, 
  KursartAllg varchar(5), 
  InternBez varchar(20), 
  KursartASD varchar(2), 
  Bezeichnung varchar(120), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_EigeneSchule_KursartAllg PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_KursartAllg_UC1 UNIQUE (KursartAllg)
);


CREATE TABLE EigeneSchule_Merkmale (
  ID bigint DEFAULT -1 NOT NULL, 
  Schule varchar(1), 
  Schueler varchar(1), 
  Kurztext varchar(10), 
  Langtext varchar(100), 
  SchulnrEigner int,
  CONSTRAINT PK_EigeneSchule_Merkmale PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Schulformen (
  ID bigint DEFAULT -1 NOT NULL, 
  SGL varchar(3), 
  SF_SGL varchar(5), 
  Schulform varchar(100), 
  DoppelQualifikation varchar(1), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  BKIndex int, 
  SchulnrEigner int, 
  Schulform2 varchar(100),
  CONSTRAINT PK_EigeneSchule_Schulformen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Schulformen_UC1 UNIQUE (SGL)
);


CREATE TABLE EigeneSchule_Teilstandorte (
  SchulnrEigner int NOT NULL, 
  AdrMerkmal varchar(1) NOT NULL, 
  PLZ varchar(10), 
  Ort varchar(50), 
  Strasse varchar(50), 
  Hausnr varchar(10), 
  Bemerkung varchar(50), 
  Kuerzel varchar(30),
  CONSTRAINT PK_EigeneSchule_Teilstandorte PRIMARY KEY (AdrMerkmal)
);


CREATE TABLE EigeneSchule_Texte (
  ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Kuerzel varchar(50), 
  Inhalt varchar(255), 
  Beschreibung varchar(100), 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_EigeneSchule_Texte PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Zertifikate (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Kuerzel varchar(20) NOT NULL, 
  Bezeichnung varchar(100), 
  Fach varchar(100), 
  Formatvorlage varchar(255),
  CONSTRAINT PK_EigeneSchule_Zertifikate PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Zertifikate_UC1 UNIQUE (Kuerzel, SchulnrEigner)
);


CREATE TABLE EigeneSchule_Zertifikatsfaecher (
  Zertifikat_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Kuerzel varchar(20) NOT NULL, 
  Klartext varchar(100), 
  Lernfelder text, 
  MaxPunkte int, 
  Sortierung int,
  CONSTRAINT PK_EigeneSchule_Zertifikatsfaecher PRIMARY KEY (Kuerzel, SchulnrEigner)
);


CREATE TABLE Fach_Gliederungen (
  Fach_ID bigint NOT NULL, 
  Gliederung varchar(3) NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Faechergruppe int, 
  GewichtungAB int, 
  GewichtungBB int, 
  SchriftlichAB varchar(1), 
  SchriftlichBB varchar(1), 
  GymOSFach varchar(1), 
  ZeugnisBez varchar(130), 
  Lernfelder text, 
  Fachklasse_ID bigint DEFAULT 0 NOT NULL, 
  Sortierung int DEFAULT 32000,
  CONSTRAINT PK_Fach_Gliederungen PRIMARY KEY (Fach_ID, Fachklasse_ID)
);


CREATE TABLE Floskelgruppen (
  SchulnrEigner int NOT NULL, 
  Kuerzel varchar(4) NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Hauptgruppe varchar(4), 
  Farbe int,
  CONSTRAINT PK_Floskelgruppen PRIMARY KEY (Kuerzel, SchulnrEigner)
);


CREATE TABLE Floskeln (
  SchulnrEigner int NOT NULL, 
  Kuerzel varchar(10) NOT NULL, 
  Floskeltext text NOT NULL, 
  Floskelgruppe varchar(10), 
  Floskelfach varchar(20), 
  Floskelniveau varchar(2), 
  Floskeljahrgang varchar(2),
  CONSTRAINT PK_Floskeln PRIMARY KEY (Kuerzel)
);


CREATE TABLE K_Adressart (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_Adressart PRIMARY KEY (ID),
  CONSTRAINT K_Adressart_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Ankreuzdaten (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  TextStufe1 varchar(100), 
  TextStufe2 varchar(100), 
  TextStufe3 varchar(100), 
  TextStufe4 varchar(100), 
  TextStufe5 varchar(100), 
  BezeichnungSONST varchar(100),
  CONSTRAINT PK_K_Ankreuzdaten PRIMARY KEY (ID)
);


CREATE TABLE K_Ankreuzfloskeln (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Jahrgang varchar(2) NOT NULL, 
  Floskeltext varchar(255) NOT NULL, 
  Sortierung int, 
  FachSortierung int, 
  Abschnitt int, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aktiv varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Ankreuzfloskeln PRIMARY KEY (ID)
);


CREATE TABLE K_BeschaeftigungsArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(100), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_BeschaeftigungsArt PRIMARY KEY (ID),
  CONSTRAINT K_BeschaeftigungsArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Datenschutz (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(250), 
  Sichtbar varchar(1) DEFAULT '+' NOT NULL, 
  Schluessel varchar(20), 
  SchulnrEigner int NOT NULL, 
  Sortierung int DEFAULT 32000 NOT NULL, 
  Beschreibung text,
  CONSTRAINT PK_K_Datenschutz PRIMARY KEY (ID)
);


CREATE TABLE K_EinschulungsArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(40) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_EinschulungsArt PRIMARY KEY (ID),
  CONSTRAINT K_EinschulungsArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Einzelleistungen (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Bezeichnung varchar(50), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1), 
  Gewichtung float,
  CONSTRAINT PK_K_Einzelleistungen PRIMARY KEY (ID)
);


CREATE TABLE K_EntlassGrund (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_EntlassGrund PRIMARY KEY (ID),
  CONSTRAINT K_EntlassGrund_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_ErzieherArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  ExportBez varchar(20), 
  SchulnrEigner int,
  CONSTRAINT PK_K_ErzieherArt PRIMARY KEY (ID),
  CONSTRAINT K_ErzieherArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_ErzieherFunktion (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_ErzieherFunktion PRIMARY KEY (ID),
  CONSTRAINT K_ErzieherFunktion_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_FahrschuelerArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_FahrschuelerArt PRIMARY KEY (ID),
  CONSTRAINT K_FahrschuelerArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Foerderschwerpunkt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  StatistikKrz varchar(2), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_Foerderschwerpunkt PRIMARY KEY (ID),
  CONSTRAINT K_Foerderschwerpunkt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Haltestelle (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  EntfernungSchule float, 
  SchulnrEigner int,
  CONSTRAINT PK_K_Haltestelle PRIMARY KEY (ID),
  CONSTRAINT K_Haltestelle_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Kindergarten (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(50), 
  PLZ varchar(10), 
  Ort varchar(30), 
  Strasse varchar(40), 
  Tel varchar(20), 
  EMail varchar(40), 
  Bemerkung varchar(50), 
  Sichtbar varchar(1), 
  Sortierung int, 
  SchulnrEigner int,
  CONSTRAINT PK_K_Kindergarten PRIMARY KEY (ID)
);


CREATE TABLE K_KlassenOrgForm (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(100) NOT NULL, 
  StatistikKrz varchar(2), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_KlassenOrgForm PRIMARY KEY (ID),
  CONSTRAINT K_KlassenOrgForm_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Ort (
  ID bigint DEFAULT -1 NOT NULL, 
  PLZ varchar(10) NOT NULL, 
  Bezeichnung varchar(50), 
  Kreis varchar(3), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  Land varchar(2), 
  SchulnrEigner int,
  CONSTRAINT PK_K_Ort PRIMARY KEY (ID),
  CONSTRAINT K_Ort_UC1 UNIQUE (Bezeichnung, PLZ)
);

CREATE INDEX K_Ort_IDX1 ON K_Ort(PLZ);


CREATE TABLE K_AllgAdresse (
  ID bigint DEFAULT -1 NOT NULL, 
  AllgAdrAdressArt varchar(30) NOT NULL, 
  AllgAdrName1 varchar(50), 
  AllgAdrName2 varchar(50), 
  AllgAdrStrasse varchar(50), 
  AllgAdrOrt_ID bigint, 
  AllgAdrPLZ varchar(10), 
  AllgAdrTelefon1 varchar(20), 
  AllgAdrTelefon2 varchar(20), 
  AllgAdrFax varchar(20), 
  AllgAdrEmail varchar(100), 
  AllgAdrBemerkungen varchar(255), 
  Sortierung int DEFAULT 32000, 
  AllgAdrAusbildungsBetrieb varchar(1) DEFAULT '-', 
  AllgAdrBietetPraktika varchar(1) DEFAULT '-', 
  AllgAdrBranche varchar(50), 
  AllgAdrZusatz1 varchar(10), 
  AllgAdrZusatz2 varchar(10), 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int, 
  Massnahmentraeger varchar(1) DEFAULT '-', 
  BelehrungISG varchar(1) DEFAULT '-', 
  GU_ID varchar(40), 
  ErwFuehrungszeugnis varchar(1) DEFAULT '-', 
  ExtID varchar(50),
  CONSTRAINT PK_K_AllgAdresse PRIMARY KEY (ID),
  CONSTRAINT K_AllgAdresse_AdressArt_FK FOREIGN KEY (AllgAdrAdressArt) REFERENCES K_Adressart(Bezeichnung) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT K_AllgAdresse_Ort_FK FOREIGN KEY (AllgAdrOrt_ID) REFERENCES K_Ort(ID) ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE AllgAdrAnsprechpartner (
  ID bigint DEFAULT -1 NOT NULL, 
  Adresse_ID bigint, 
  Name varchar(60), 
  Vorname varchar(60), 
  Anrede varchar(10), 
  Telefon varchar(20), 
  EMail varchar(100), 
  Abteilung varchar(50), 
  SchulnrEigner int, 
  Titel varchar(15), 
  GU_ID varchar(40),
  CONSTRAINT PK_AllgAdrAnsprechpartner PRIMARY KEY (ID),
  CONSTRAINT Ansprechpartner_Adr_FK FOREIGN KEY (Adresse_ID) REFERENCES K_AllgAdresse(ID) ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE K_Ortsteil (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Ort_ID bigint, 
  PLZ varchar(10), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int, 
  OrtsteilSchluessel varchar(30),
  CONSTRAINT PK_K_Ortsteil PRIMARY KEY (ID),
  CONSTRAINT K_Ortsteil_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Lehrer (
  ID bigint DEFAULT -1 NOT NULL, 
  GU_ID varchar(40), 
  Kuerzel varchar(10) NOT NULL, 
  LIDKrz varchar(4), 
  Nachname varchar(30) NOT NULL, 
  Vorname varchar(20), 
  PersonTyp varchar(20) DEFAULT 'LEHRKRAFT', 
  SchulnrEigner int, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  FuerExport varchar(1) DEFAULT '+', 
  Statistik varchar(1), 
  Strasse varchar(50), 
  Ort_ID bigint, 
  PLZ varchar(10), 
  Ortsteil_ID bigint, 
  Tel varchar(20), 
  Handy varchar(20), 
  EMail varchar(100), 
  EMailDienstlich varchar(100), 
  StaatKrz varchar(3), 
  Geburtsdatum date, 
  Geschlecht varchar(1), 
  Anrede varchar(10), 
  Amtsbezeichnung varchar(15), 
  Titel varchar(20), 
  Faecher varchar(100), 
  IdentNr1 varchar(10), 
  SerNr varchar(5), 
  PANr varchar(20), 
  LBVNr varchar(15), 
  VSchluessel varchar(1), 
  DatumZugang date, 
  GrundZugang varchar(10), 
  DatumAbgang date, 
  GrundAbgang varchar(10), 
  SchulFunktion varchar(10), 
  PflichtstdSoll float, 
  Rechtsverhaeltnis varchar(1), 
  Beschaeftigungsart varchar(2), 
  Einsatzstatus varchar(1), 
  StammschulNr varchar(6), 
  UnterrichtsStd float, 
  MehrleistungStd float, 
  EntlastungStd float, 
  AnrechnungStd float, 
  RestStd float, 
  LPassword varchar(255), 
  PWAktuell varchar(3) DEFAULT '-;5', 
  SchILDweb_FL varchar(1) DEFAULT '+', 
  SchILDweb_KL varchar(1) DEFAULT '+', 
  SchILDweb_Config text, 
  KennwortTools varchar(255), 
  Antwort1 varchar(255), 
  Antwort2 varchar(255), 
  KennwortToolsAktuell varchar(3) DEFAULT '-;5',
  CONSTRAINT PK_K_Lehrer PRIMARY KEY (ID),
  CONSTRAINT K_Lehrer_Ort_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT K_Lehrer_Ortsteil_FK FOREIGN KEY (Ortsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT K_Lehrer_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE EigeneSchule_Abteilungen (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  AbteilungsLeiter varchar(10), 
  Sichtbar varchar(1) DEFAULT '+', 
  SchulnrEigner int, 
  Raum varchar(20), 
  EMail varchar(100), 
  Durchwahl varchar(20), 
  Sortierung int,
  CONSTRAINT PK_EigeneSchule_Abteilungen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Abteilungen_Leiter_FK FOREIGN KEY (AbteilungsLeiter) REFERENCES K_Lehrer(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE K_Religion (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  StatistikKrz varchar(10), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  ExportBez varchar(20), 
  ZeugnisBezeichnung varchar(50), 
  SchulnrEigner int,
  CONSTRAINT PK_K_Religion PRIMARY KEY (ID),
  CONSTRAINT K_Religion_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Schule (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulNr varchar(6) NOT NULL, 
  Name varchar(100), 
  SchulformNr varchar(3), 
  SchulformKrz varchar(3), 
  SchulformBez varchar(50), 
  Strasse varchar(50), 
  PLZ varchar(10), 
  Ort varchar(50), 
  Telefon varchar(20), 
  Fax varchar(20), 
  Email varchar(40), 
  Schulleiter varchar(40), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulNr_SIM varchar(6), 
  Kuerzel varchar(10), 
  KurzBez varchar(40), 
  SchulnrEigner int,
  CONSTRAINT PK_K_Schule PRIMARY KEY (ID),
  CONSTRAINT K_Schule_UC1 UNIQUE (SchulNr)
);


CREATE TABLE K_Schulfunktionen (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(50), 
  Sortierung int, 
  Sichtbar varchar(1), 
  SchulnrEigner int,
  CONSTRAINT PK_K_Schulfunktionen PRIMARY KEY (ID)
);


CREATE TABLE K_Schwerpunkt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_Schwerpunkt PRIMARY KEY (ID),
  CONSTRAINT K_Schwerpunkt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE Fachklassen_Schwerpunkte (
  SchulnrEigner int NOT NULL, 
  Fachklasse_ID bigint NOT NULL, 
  Schwerpunkt_ID bigint NOT NULL,
  CONSTRAINT PK_Fachklassen_Schwerpunkte PRIMARY KEY (Fachklasse_ID, SchulnrEigner, Schwerpunkt_ID),
  CONSTRAINT Fachklassen_Schwerpunkte_Fachkl_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Fachklassen_Schwerpunkte_Schwerp_FK FOREIGN KEY (Schwerpunkt_ID) REFERENCES K_Schwerpunkt(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE K_Sportbefreiung (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_Sportbefreiung PRIMARY KEY (ID),
  CONSTRAINT K_Sportbefreiung_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Staat (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(80) NOT NULL, 
  StatistikKrz varchar(3), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  ExportBez varchar(20), 
  SchulnrEigner int, 
  Bezeichnung2 varchar(80),
  CONSTRAINT PK_K_Staat PRIMARY KEY (ID),
  CONSTRAINT K_Staat_UC1 UNIQUE (StatistikKrz)
);


CREATE TABLE K_TXTDATEIEN (
  ID bigint DEFAULT -1 NOT NULL, 
  BEZEICHNUNG varchar(32), 
  TEXT_ID bigint NOT NULL, 
  TEXT_BODY text, 
  Sichtbar varchar(1) DEFAULT '+', 
  Sortierung smallint, 
  SchulnrEigner int,
  CONSTRAINT PK_K_TXTDATEIEN PRIMARY KEY (ID)
);


CREATE TABLE K_TelefonArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_TelefonArt PRIMARY KEY (ID),
  CONSTRAINT K_TelefonArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Verkehrssprachen (
  ID bigint DEFAULT -1 NOT NULL, 
  Kurztext varchar(10), 
  Langtext varchar(100), 
  Sichtbar varchar(1), 
  Sortierung int, 
  SchulnrEigner int,
  CONSTRAINT PK_K_Verkehrssprachen PRIMARY KEY (ID)
);


CREATE TABLE K_Vermerkart (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_Vermerkart PRIMARY KEY (ID),
  CONSTRAINT K_Vermerkart_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Zertifikate (
  Kuerzel varchar(5) NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  SchulnrEigner int NOT NULL,
  CONSTRAINT PK_K_Zertifikate PRIMARY KEY (Kuerzel, SchulnrEigner)
);


CREATE TABLE Kompetenzen (
  KO_ID bigint NOT NULL, 
  KO_Gruppe bigint NOT NULL, 
  KO_Bezeichnung varchar(64) NOT NULL,
  CONSTRAINT PK_Kompetenzen PRIMARY KEY (KO_Gruppe, KO_ID)
);


CREATE TABLE Kompetenzgruppen (
  KG_Spalte bigint NOT NULL, 
  KG_Zeile bigint NOT NULL, 
  KG_ID bigint NOT NULL, 
  KG_Bezeichnung varchar(50) NOT NULL,
  CONSTRAINT PK_Kompetenzgruppen PRIMARY KEY (KG_Bezeichnung, KG_ID, KG_Spalte, KG_Zeile)
);


CREATE TABLE KursKombinationen (
  Kurs1_ID bigint NOT NULL, 
  Kurs2_ID bigint NOT NULL,
  CONSTRAINT PK_KursKombinationen PRIMARY KEY (Kurs1_ID, Kurs2_ID)
);


CREATE TABLE Kurse (
  ID bigint DEFAULT -1 NOT NULL, 
  Jahr smallint NOT NULL, 
  Abschnitt smallint NOT NULL, 
  KurzBez varchar(20) NOT NULL, 
  Jahrgang_ID bigint, 
  ASDJahrgang varchar(2), 
  Fach_ID bigint NOT NULL, 
  KursartAllg varchar(5), 
  Wochenstd smallint, 
  LehrerKrz varchar(10), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Schienen varchar(20), 
  Fortschreibungsart varchar(1), 
  WochenstdKL float, 
  SchulNr int, 
  EpochU varchar(1) DEFAULT '-', 
  SchulnrEigner int, 
  Zeugnisbez varchar(130), 
  Jahrgaenge varchar(50),
  CONSTRAINT PK_Kurse PRIMARY KEY (ID),
  CONSTRAINT Kurse_UC1 UNIQUE (ASDJahrgang, Abschnitt, Fach_ID, Jahr, Jahrgaenge, KursartAllg, KurzBez, LehrerKrz, Wochenstd)
);


CREATE TABLE KursLehrer (
  Kurs_ID bigint NOT NULL, 
  Lehrer_ID bigint NOT NULL, 
  Anteil float, 
  SchulnrEigner int,
  CONSTRAINT PK_KursLehrer PRIMARY KEY (Kurs_ID, Lehrer_ID),
  CONSTRAINT KursLehrer_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT KursLehrer_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerAbschnittsdaten (
  Lehrer_ID bigint NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  Rechtsverhaeltnis varchar(1), 
  Beschaeftigungsart varchar(2), 
  Einsatzstatus varchar(1), 
  PflichtstdSoll float, 
  UnterrichtsStd float, 
  MehrleistungStd float, 
  EntlastungStd float, 
  AnrechnungStd float, 
  RestStd float, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerAbschnittsdaten PRIMARY KEY (Abschnitt, Jahr, Lehrer_ID),
  CONSTRAINT LehrerAbschnitte_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerAnrechnung (
  Lehrer_ID bigint NOT NULL, 
  AnrechnungsgrundKrz varchar(10), 
  AnrechnungStd float, 
  Jahr int, 
  Abschnitt int, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerAnrechnung PRIMARY KEY (Abschnitt, AnrechnungsgrundKrz, Jahr, Lehrer_ID),
  CONSTRAINT LehrerAnrechnung_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerEntlastung (
  Lehrer_ID bigint NOT NULL, 
  EntlastungsgrundKrz varchar(10), 
  EntlastungStd float, 
  Jahr int, 
  Abschnitt int, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerEntlastung PRIMARY KEY (Abschnitt, EntlastungsgrundKrz, Jahr, Lehrer_ID),
  CONSTRAINT LehrerEntlastung_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerFotos (
  Lehrer_ID bigint NOT NULL, 
  Foto longblob, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerFotos PRIMARY KEY (Lehrer_ID)
);


CREATE TABLE LehrerFunktionen (
  Lehrer_ID bigint NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  Funktion_ID bigint NOT NULL, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerFunktionen PRIMARY KEY (Abschnitt, Funktion_ID, Jahr, Lehrer_ID),
  CONSTRAINT LehrerFunktionen_Funktion_FK FOREIGN KEY (Funktion_ID) REFERENCES K_Schulfunktionen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerFunktionen_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerLehramt (
  Lehrer_ID bigint NOT NULL, 
  LehramtKrz varchar(10), 
  LehramtAnerkennungKrz varchar(10), 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerLehramt PRIMARY KEY (LehramtKrz, Lehrer_ID),
  CONSTRAINT LehrerLehramt_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerLehramtFachr (
  Lehrer_ID bigint NOT NULL, 
  LehramtKrz varchar(10), 
  FachrKrz varchar(10), 
  FachrAnerkennungKrz varchar(10), 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerLehramtFachr PRIMARY KEY (FachrKrz, LehramtKrz, Lehrer_ID)
);


CREATE TABLE LehrerLehramtLehrbef (
  Lehrer_ID bigint NOT NULL, 
  LehramtKrz varchar(10), 
  LehrbefKrz varchar(10), 
  LehrbefAnerkennungKrz varchar(10), 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerLehramtLehrbef PRIMARY KEY (LehramtKrz, LehrbefKrz, Lehrer_ID)
);


CREATE TABLE LehrerMehrleistung (
  Lehrer_ID bigint NOT NULL, 
  MehrleistungsgrundKrz varchar(10) NOT NULL, 
  MehrleistungStd float, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerMehrleistung PRIMARY KEY (Abschnitt, Jahr, Lehrer_ID, MehrleistungsgrundKrz),
  CONSTRAINT LehrerMehrleistung_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Lehrer_IMEI (
  ID bigint NOT NULL, 
  Lehrer_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  IMEI varchar(20),
  CONSTRAINT PK_Lehrer_IMEI PRIMARY KEY (ID),
  CONSTRAINT Lehrer_IMEI_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Logins (
  LI_UserID bigint NOT NULL, 
  LI_LoginTime datetime, 
  LI_LogoffTime datetime, 
  SchulnrEigner int,
  CONSTRAINT PK_Logins PRIMARY KEY (LI_LoginTime, LI_UserID)
);


CREATE TABLE NUES_Kategorien (
  KategorieKuerzel varchar(20) NOT NULL, 
  KategorieText varchar(100) NOT NULL, 
  KategorieArt varchar(1),
  CONSTRAINT PK_NUES_Kategorien PRIMARY KEY (KategorieKuerzel)
);


CREATE TABLE NUES_Merkmale (
  MerkmalKuerzel varchar(20) NOT NULL, 
  MerkmalText varchar(200) NOT NULL, 
  Jahrgang varchar(2), 
  HauptKategorie varchar(20) NOT NULL, 
  NebenKategorie varchar(20),
  CONSTRAINT PK_NUES_Merkmale PRIMARY KEY (MerkmalKuerzel),
  CONSTRAINT NUES_Merkmale_Kategorie_FK FOREIGN KEY (HauptKategorie) REFERENCES NUES_Kategorien(KategorieKuerzel) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE NichtMoeglAbiFachKombi (
  Fach1_ID bigint NOT NULL, 
  Fach2_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Kursart1 varchar(5), 
  Kursart2 varchar(5), 
  PK varchar(30) NOT NULL, 
  Sortierung int, 
  Phase varchar(10), 
  Typ varchar(1),
  CONSTRAINT PK_NichtMoeglAbiFachKombi PRIMARY KEY (PK)
);


CREATE TABLE Personengruppen (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Gruppenname varchar(100) NOT NULL, 
  Zusatzinfo varchar(100), 
  SammelEMail varchar(100), 
  GruppenArt varchar(20), 
  XMLExport varchar(1), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_Personengruppen PRIMARY KEY (ID)
);


CREATE TABLE Personengruppen_Personen (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Gruppe_ID bigint NOT NULL, 
  Person_ID bigint, 
  PersonNr int, 
  PersonArt varchar(1), 
  PersonName varchar(50) NOT NULL, 
  PersonVorname varchar(30), 
  PersonPLZ varchar(10), 
  PersonOrt varchar(50), 
  PersonStrasse varchar(50), 
  PersonTelefon varchar(20), 
  PersonMobil varchar(20), 
  PersonEMail varchar(100), 
  Bemerkung varchar(100), 
  ZusatzInfo varchar(100), 
  Sortierung int, 
  PersonAnrede varchar(10), 
  PersonAkadGrad varchar(15),
  CONSTRAINT PK_Personengruppen_Personen PRIMARY KEY (ID)
);


CREATE TABLE PrfSemAbschl (
  Nr varchar(2) NOT NULL, 
  Klartext varchar(30), 
  StatistikKrz varchar(1), 
  Sortierung int DEFAULT 32000,
  CONSTRAINT PK_PrfSemAbschl PRIMARY KEY (Nr)
);


CREATE TABLE SETTINGS (
  ID bigint NOT NULL, 
  NAME varchar(32), 
  SchulNrEigner int NOT NULL, 
  VALUE_FLOAT float, 
  VALUE_INT int, 
  VALUE_STR text,
  CONSTRAINT PK_SETTINGS PRIMARY KEY (ID)
);

CREATE INDEX SETTINGS_IDX1 ON SETTINGS(NAME, SchulNrEigner);
CREATE INDEX SETTINGS_IDX2 ON SETTINGS(NAME);
CREATE INDEX SETTINGS_IDX3 ON SETTINGS(SchulNrEigner);


CREATE TABLE SVWS_DB_AutoInkremente (
  NameTabelle varchar(200) NOT NULL, 
  MaxID bigint DEFAULT 1 NOT NULL,
  CONSTRAINT PK_SVWS_DB_AutoInkremente PRIMARY KEY (NameTabelle)
);


CREATE TABLE SVWS_DB_Version (
  Revision int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_SVWS_DB_Version PRIMARY KEY (Revision)
);


CREATE TABLE SchildFilter (
  ID bigint DEFAULT -1 NOT NULL, 
  Art varchar(1), 
  Name varchar(50) NOT NULL, 
  Beschreibung varchar(255), 
  Tabellen varchar(255), 
  ZusatzTabellen varchar(255), 
  Bedingung text, 
  BedingungKlartext text, 
  SchulnrEigner int,
  CONSTRAINT PK_SchildFilter PRIMARY KEY (ID),
  CONSTRAINT SchildFilter_UC1 UNIQUE (Name)
);


CREATE TABLE Schild_Verwaltung (
  BackupDatum datetime, 
  AutoBerechnung datetime, 
  DatumStatkue datetime, 
  DatumSchildIntern datetime, 
  Bescheinigung varchar(255), 
  Stammblatt varchar(255), 
  DatenGeprueft varchar(1) DEFAULT '-', 
  FaecherUebernehmen varchar(1) DEFAULT '+', 
  Version varchar(10), 
  GU_ID varchar(40) NOT NULL, 
  StatistikJahr int, 
  SchulnrEigner int NOT NULL, 
  LD_Datentyp varchar(1), 
  Version3 varchar(16), 
  DatumLoeschfristHinweisDeaktiviert datetime, 
  DatumLoeschfristHinweisDeaktiviertUserID int, 
  DatumDatenGeloescht datetime,
  CONSTRAINT PK_Schild_Verwaltung PRIMARY KEY (GU_ID),
  CONSTRAINT Schild_Verwaltung_UC1 UNIQUE (SchulnrEigner)
);


CREATE TABLE Schildintern_AbiturInfos (
  PrfOrdnung varchar(20) NOT NULL, 
  AbiFach varchar(1) NOT NULL, 
  Bedingung varchar(3), 
  AbiInfoKrz varchar(20), 
  AbiInfoBeschreibung varchar(255), 
  AbiInfoText text,
  CONSTRAINT PK_Schildintern_AbiturInfos PRIMARY KEY (AbiFach, AbiInfoKrz, Bedingung, PrfOrdnung)
);


CREATE TABLE Schildintern_Berufsebene (
  Berufsebene int NOT NULL, 
  Kuerzel varchar(2) NOT NULL, 
  Klartext varchar(255),
  CONSTRAINT PK_Schildintern_Berufsebene PRIMARY KEY (Berufsebene, Kuerzel)
);


CREATE TABLE Schildintern_DQR_Niveaus (
  Gliederung varchar(4) NOT NULL, 
  FKS varchar(8) NOT NULL, 
  DQR_Niveau int NOT NULL
);


CREATE TABLE Schildintern_Datenart (
  DatenartKrz varchar(10) NOT NULL, 
  Datenart varchar(50), 
  Tabellenname varchar(30), 
  Reihenfolge int,
  CONSTRAINT PK_Schildintern_Datenart PRIMARY KEY (DatenartKrz)
);


CREATE TABLE Schildintern_Fachgruppen (
  FG_ID bigint NOT NULL, 
  FG_SF varchar(50), 
  FG_Bezeichnung varchar(50), 
  FG_Farbe int, 
  FG_Sortierung int, 
  FG_Kuerzel varchar(5), 
  FG_Zeugnis varchar(1),
  CONSTRAINT PK_Schildintern_Fachgruppen PRIMARY KEY (FG_ID)
);


CREATE TABLE Schildintern_FaecherSortierung (
  Fach varchar(2) NOT NULL, 
  Bezeichnung varchar(80), 
  Sortierung1 int, 
  Sortierung2 int, 
  Fachgruppe_ID bigint, 
  FachgruppeKrz varchar(2), 
  AufgabenbereichAbitur varchar(5),
  CONSTRAINT PK_Schildintern_FaecherSortierung PRIMARY KEY (Fach)
);


CREATE TABLE Schildintern_FilterFehlendeEintraege (
  ID bigint NOT NULL, 
  Beschreibung varchar(100), 
  Feldname varchar(30), 
  Tabellen varchar(50), 
  SQLText varchar(100), 
  Schulform varchar(50), 
  Feldtyp varchar(1),
  CONSTRAINT PK_Schildintern_FilterFehlendeEintraege PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_FilterFeldListe (
  ID bigint NOT NULL, 
  Bezeichnung varchar(50), 
  DBFeld varchar(50), 
  Typ varchar(50), 
  Werte varchar(20), 
  StdWert varchar(5), 
  Operator varchar(10), 
  Zusatzbedingung varchar(50),
  CONSTRAINT PK_Schildintern_FilterFeldListe PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_HSchStatus (
  StatusNr int NOT NULL, 
  Bezeichnung varchar(255), 
  Sortierung int, 
  InSimExp varchar(1), 
  SIMAbschnitt varchar(1),
  CONSTRAINT PK_Schildintern_HSchStatus PRIMARY KEY (StatusNr)
);


CREATE TABLE Schildintern_KAoA_Anschlussoption (
  AO_Kuerzel varchar(2) NOT NULL, 
  AO_Beschreibung varchar(255), 
  AO_Stufen varchar(10),
  CONSTRAINT PK_Schildintern_KAoA_Anschlussoption PRIMARY KEY (AO_Kuerzel)
);


CREATE TABLE Schildintern_KAoA_Berufsfeld (
  BF_Kuerzel varchar(10) NOT NULL, 
  BF_Beschreibung varchar(255),
  CONSTRAINT PK_Schildintern_KAoA_Berufsfeld PRIMARY KEY (BF_Kuerzel)
);


CREATE TABLE Schildintern_KAoA_Kategorie (
  K_Kuerzel varchar(10) NOT NULL, 
  K_Beschreibung varchar(255), 
  K_Jahrgaenge varchar(25),
  CONSTRAINT PK_Schildintern_KAoA_Kategorie PRIMARY KEY (K_Kuerzel)
);


CREATE TABLE Schildintern_KAoA_Merkmal (
  M_Kuerzel varchar(20) NOT NULL, 
  M_Kategorie varchar(10), 
  M_Beschreibung varchar(255), 
  M_Option varchar(25),
  CONSTRAINT PK_Schildintern_KAoA_Merkmal PRIMARY KEY (M_Kuerzel)
);


CREATE TABLE Schildintern_KAoA_Zusatzmerkmal (
  ZM_Kuerzel varchar(20) NOT NULL, 
  ZM_Merkmal varchar(20), 
  ZM_Beschreibung varchar(255), 
  ZM_Option varchar(25),
  CONSTRAINT PK_Schildintern_KAoA_Zusatzmerkmal PRIMARY KEY (ZM_Kuerzel)
);


CREATE TABLE Schildintern_K_Schulnote (
  ID bigint NOT NULL, 
  Krz varchar(2), 
  Art varchar(1), 
  Bezeichnung varchar(40), 
  Zeugnisnotenbez varchar(40), 
  Punkte varchar(2), 
  Sortierung int, 
  Sichtbar varchar(1), 
  Aenderbar varchar(1),
  CONSTRAINT PK_Schildintern_K_Schulnote PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_KursartenZuordnung (
  KursartIndiv varchar(5) NOT NULL, 
  KursartAllg varchar(5) NOT NULL,
  CONSTRAINT PK_Schildintern_KursartenZuordnung PRIMARY KEY (KursartIndiv)
);


CREATE TABLE Schildintern_Laender (
  Kurztext varchar(2) NOT NULL, 
  Langtext varchar(40), 
  Sortierung int,
  CONSTRAINT PK_Schildintern_Laender PRIMARY KEY (Kurztext)
);


CREATE TABLE Schildintern_PrfSemAbschl (
  Nr varchar(2) NOT NULL, 
  Klartext varchar(50), 
  StatistikKrz varchar(1), 
  Sortierung int, 
  Schulform varchar(2) NOT NULL, 
  StatistikKrzNeu varchar(2),
  CONSTRAINT PK_Schildintern_PrfSemAbschl PRIMARY KEY (Nr, Schulform)
);


CREATE TABLE Schildintern_PruefOrd_Optionen (
  OP_Schulformen varchar(20) NOT NULL, 
  OP_POKrz varchar(30) NOT NULL, 
  OP_Krz varchar(40) NOT NULL, 
  OP_Abgangsart_B varchar(2), 
  OP_Abgangsart_NB varchar(2), 
  OP_Art varchar(1) NOT NULL, 
  OP_Typ varchar(5), 
  OP_Bildungsgang varchar(1) NOT NULL, 
  OP_Name varchar(255) NOT NULL, 
  OP_Kommentar varchar(100), 
  OP_Jahrgaenge varchar(20) NOT NULL, 
  OP_BKIndex varchar(50), 
  OP_BKAnl_Typ varchar(50), 
  OP_Reihenfolge int NOT NULL,
  CONSTRAINT PK_Schildintern_PruefOrd_Optionen PRIMARY KEY (OP_Art, OP_Bildungsgang, OP_Jahrgaenge, OP_Krz, OP_Name, OP_POKrz, OP_Reihenfolge, OP_Schulformen)
);


CREATE TABLE Schildintern_PruefungsOrdnung (
  PO_Schulform varchar(50) NOT NULL, 
  PO_Krz varchar(30) NOT NULL, 
  PO_Name varchar(255) NOT NULL, 
  PO_SGL varchar(50) NOT NULL, 
  PO_MinJahrgang int DEFAULT 0 NOT NULL, 
  PO_MaxJahrgang int DEFAULT 20 NOT NULL, 
  PO_Jahrgaenge varchar(30) NOT NULL,
  CONSTRAINT PK_Schildintern_PruefungsOrdnung PRIMARY KEY (PO_Krz, PO_SGL, PO_Schulform)
);


CREATE TABLE Schildintern_SchuelerImpExp (
  Tabelle varchar(50) NOT NULL, 
  TabellenAnzeige varchar(50), 
  MasterTable varchar(50), 
  ExpCmd varchar(250), 
  SrcGetFieldsSQL varchar(250), 
  DeleteSQL varchar(250), 
  DstGetIDSQL varchar(250), 
  HauptFeld varchar(50), 
  DetailFeld varchar(50), 
  Reihenfolge int,
  CONSTRAINT PK_Schildintern_SchuelerImpExp PRIMARY KEY (Tabelle)
);


CREATE TABLE Schildintern_SpezialFilterFelder (
  ID bigint NOT NULL, 
  Gruppe varchar(2), 
  KurzBez varchar(50), 
  Bezeichnung varchar(50), 
  Grundschule varchar(1), 
  Tabelle varchar(30), 
  DBFeld varchar(50), 
  Typ varchar(1), 
  Control varchar(10), 
  WerteAnzeige varchar(20), 
  WerteSQL varchar(20), 
  LookupInfo varchar(50), 
  OperatorenAnzeige varchar(150), 
  OperatorenSQL varchar(100), 
  Zusatzbedingung varchar(100), 
  ZusatzTabellen varchar(50),
  CONSTRAINT PK_Schildintern_SpezialFilterFelder PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_TextExport (
  DatenartKrz varchar(10) NOT NULL, 
  Feldname varchar(30) NOT NULL, 
  AnzeigeText varchar(50) NOT NULL, 
  FeldTyp varchar(1), 
  Feldwerte varchar(20), 
  ErgebnisWerte varchar(100), 
  LookupFeldname varchar(100), 
  LookupSQLText text, 
  DBFormat varchar(10) DEFAULT 'ALLE' NOT NULL,
  CONSTRAINT PK_Schildintern_TextExport PRIMARY KEY (AnzeigeText, DBFormat, DatenartKrz, Feldname)
);


CREATE TABLE Schildintern_VerfImportFelder (
  ID bigint NOT NULL, 
  TableDescription varchar(50), 
  FieldDescription varchar(50), 
  DstTable varchar(50), 
  DstFieldName varchar(50), 
  DstFieldType varchar(1), 
  DstRequiredState varchar(1), 
  DstLookupTable varchar(50), 
  DstLookupTableIDFieldName varchar(50), 
  DstLookupFieldName varchar(50), 
  DstResultFieldName varchar(50), 
  DstKeyLookupInsert varchar(1), 
  DstKeyLookupNameCreateID varchar(1), 
  DstForceNumeric varchar(1),
  CONSTRAINT PK_Schildintern_VerfImportFelder PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_VerfImportTabellen (
  TableName varchar(50) NOT NULL, 
  DstRequiredFields varchar(50), 
  DstIDFieldName varchar(50), 
  Sequence int, 
  LookupTable varchar(50), 
  LookupFields varchar(50), 
  LookupFieldTypes varchar(50), 
  LookupResultField varchar(50), 
  LookupResultFieldType varchar(10), 
  LookupKeyField varchar(50), 
  DstDefaultFieldName varchar(50), 
  DstDefaultFieldValue varchar(20), 
  DstCreateID varchar(1), 
  GU_ID_Field varchar(50),
  CONSTRAINT PK_Schildintern_VerfImportTabellen PRIMARY KEY (TableName)
);


CREATE TABLE Schildintern_Zusatzinfos (
  SGL_BKAbschl varchar(50) NOT NULL, 
  JG_BKAbschl varchar(50) NOT NULL,
  CONSTRAINT PK_Schildintern_Zusatzinfos PRIMARY KEY (JG_BKAbschl, SGL_BKAbschl)
);


CREATE TABLE SchuelerEinzelleistungen (
  SchulnrEigner int NOT NULL, 
  ID bigint DEFAULT -1 NOT NULL, 
  Datum date, 
  Lehrer_ID bigint, 
  Art_ID bigint, 
  Bemerkung varchar(100), 
  Leistung_ID bigint, 
  NotenKrz varchar(2),
  CONSTRAINT PK_SchuelerEinzelleistungen PRIMARY KEY (ID),
  CONSTRAINT SchuelerEL_Art_FK FOREIGN KEY (Art_ID) REFERENCES K_Einzelleistungen(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerGSDaten (
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Note_Sprachgebrauch int, 
  Note_Lesen int, 
  Note_Rechtschreiben int, 
  Note_Sachunterricht int, 
  Note_Mathematik int, 
  Note_Englisch int, 
  Note_KunstTextil int, 
  Note_Musik int, 
  Note_Sport int, 
  Note_Religion int, 
  Durchschnittsnote_Sprache float, 
  Durchschnittsnote_Einfach float, 
  Durchschnittsnote_Gewichtet float, 
  Anrede_Klassenlehrer varchar(10), 
  Nachname_Klassenlehrer varchar(50), 
  GS_Klasse varchar(10), 
  Bemerkungen text, 
  Geschwisterkind varchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerGSDaten PRIMARY KEY (Schueler_ID)
);


CREATE TABLE SchuelerListe (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Erzeuger varchar(20), 
  Privat varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerListe PRIMARY KEY (ID),
  CONSTRAINT SchuelerListe_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE SchuelerReportvorlagen (
  User_ID bigint NOT NULL, 
  SchulnrEigner int, 
  ReportVorlage varchar(255), 
  Schueler_IDs text
);


CREATE TABLE SchuelerWiedervorlage (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Bemerkung varchar(255), 
  AngelegtAm datetime, 
  WiedervorlageAm datetime, 
  ErledigtAm datetime, 
  User_ID bigint, 
  Sekretariat varchar(1), 
  Typ varchar(1), 
  NichtLoeschen varchar(1),
  CONSTRAINT PK_SchuelerWiedervorlage PRIMARY KEY (ID)
);


CREATE TABLE Schulver_DBS (
  SchulNr varchar(6) NOT NULL, 
  Regschl varchar(6), 
  KoRe float, 
  KoHo float, 
  ABez1 varchar(40), 
  ABez2 varchar(40), 
  ABez3 varchar(40), 
  PLZ varchar(6), 
  Ort varchar(34), 
  Strasse varchar(40), 
  TelVorw varchar(6), 
  Telefon varchar(12), 
  FaxVorw varchar(6), 
  Fax varchar(15), 
  ModemVorw varchar(6), 
  Modem varchar(15), 
  SF varchar(2), 
  OeffPri varchar(1), 
  KurzBez varchar(40), 
  SchBetrSchl int, 
  SchBetrSchlDatum varchar(8), 
  ArtderTraegerschaft varchar(2), 
  SchultraegerNr varchar(6), 
  Schulgliederung varchar(3), 
  Schulart varchar(3), 
  Ganztagsbetrieb varchar(1), 
  FSP varchar(2), 
  Verbund varchar(1), 
  Bus varchar(1), 
  Fachberater int, 
  FachberHauptamtl int, 
  TelNrDBSalt varchar(15), 
  RP varchar(1), 
  Email varchar(100), 
  URL varchar(1000), 
  Bemerkung text, 
  CD int, 
  Stift int, 
  OGTS varchar(1), 
  SELB varchar(1), 
  Internat varchar(1), 
  InternatPlaetze int DEFAULT 0, 
  SMail varchar(50), 
  SportImAbi varchar(1) DEFAULT '0',
  CONSTRAINT PK_Schulver_DBS PRIMARY KEY (SchulNr)
);


CREATE TABLE Schulver_Schulformen (
  Schulform varchar(2) NOT NULL, 
  SF varchar(2), 
  Bezeichnung varchar(60), 
  Flag varchar(1) DEFAULT '1', 
  geaendert datetime,
  CONSTRAINT PK_Schulver_Schulformen PRIMARY KEY (Schulform)
);


CREATE TABLE Schulver_Schultraeger (
  SchulNr varchar(255) NOT NULL, 
  Regschl varchar(255), 
  KoRe varchar(255), 
  KoHo varchar(255), 
  ABez1 varchar(255), 
  ABez2 varchar(255), 
  ABez3 varchar(255), 
  PLZ varchar(255), 
  Ort varchar(255), 
  Strasse varchar(255), 
  TelVorw varchar(255), 
  Telefon varchar(255), 
  SF varchar(255), 
  OeffPri varchar(255), 
  KurzBez varchar(255), 
  SchBetrSchl int, 
  SchBetrSchlDatum varchar(255), 
  SchuelerZahlASD int DEFAULT 0, 
  SchuelerZahlVS int DEFAULT 0, 
  ArtderTraegerschaft varchar(255), 
  SchultraegerNr varchar(255), 
  Schulgliederung varchar(255), 
  Ganztagsbetrieb varchar(255), 
  aktiv int DEFAULT 1 NOT NULL,
  CONSTRAINT PK_Schulver_Schultraeger PRIMARY KEY (SchulNr)
);


CREATE TABLE Statkue_Abgangsart (
  SF varchar(2) NOT NULL, 
  Art varchar(2) NOT NULL, 
  Beschreibung varchar(200), 
  KZ_Bereich int DEFAULT 0, 
  KZ_Bereich_JG int DEFAULT 0, 
  AbgangsJG varchar(2), 
  Flag varchar(1) DEFAULT '1', 
  geaendert datetime, 
  Sortierung int DEFAULT 0,
  CONSTRAINT PK_Statkue_Abgangsart PRIMARY KEY (AbgangsJG, Art, KZ_Bereich, SF)
);


CREATE TABLE Statkue_AllgMerkmale (
  ID bigint NOT NULL, 
  SF varchar(2) NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  StatistikKrz varchar(5), 
  Langtext varchar(255) NOT NULL, 
  Schule int, 
  Schueler int, 
  Beginn datetime, 
  Ende datetime, 
  Sort int,
  CONSTRAINT PK_Statkue_AllgMerkmale PRIMARY KEY (ID, Kurztext)
);


CREATE TABLE Statkue_AndereGrundschulen (
  SNR varchar(6) NOT NULL, 
  SF varchar(2), 
  ABez1 varchar(40), 
  Strasse varchar(40), 
  Ort varchar(40), 
  Auswahl int, 
  RegSchl varchar(6), 
  geaendert datetime,
  CONSTRAINT PK_Statkue_AndereGrundschulen PRIMARY KEY (SNR)
);


CREATE TABLE Statkue_Bilingual (
  SF varchar(2) NOT NULL, 
  Fach varchar(2) NOT NULL, 
  Beschreibung varchar(100), 
  geaendert datetime,
  CONSTRAINT PK_Statkue_Bilingual PRIMARY KEY (Fach, SF)
);


CREATE TABLE Statkue_Einschulungsart (
  Art varchar(2) NOT NULL, 
  Sortierung int DEFAULT 0, 
  Beschreibung varchar(100), 
  geaendert datetime,
  CONSTRAINT PK_Statkue_Einschulungsart PRIMARY KEY (Art)
);


CREATE TABLE Statkue_Fachklasse (
  BKIndex int DEFAULT 0 NOT NULL, 
  Flag varchar(1), 
  FKS varchar(3) NOT NULL, 
  AP varchar(2) NOT NULL, 
  BGrp varchar(1), 
  BFeld varchar(2), 
  Sortierung int DEFAULT 0, 
  Status varchar(20), 
  Beschreibung varchar(100), 
  Beschreibung_W varchar(100), 
  geaendert datetime, 
  Beschreibung_MW varchar(100), 
  BAKLALT varchar(2), 
  BAGRALT varchar(4), 
  BAKL varchar(5), 
  BAGR varchar(8), 
  Ebene1 varchar(2), 
  Ebene2 varchar(2), 
  Ebene3 varchar(2), 
  Flag_APOBK varchar(1),
  CONSTRAINT PK_Statkue_Fachklasse PRIMARY KEY (AP, BKIndex, FKS)
);


CREATE TABLE Statkue_Foerderschwerpunkt (
  Beschreibung varchar(100), 
  FSP varchar(2) NOT NULL, 
  Flag varchar(1) DEFAULT '1', 
  SF varchar(2) NOT NULL, 
  geaendert datetime,
  CONSTRAINT PK_Statkue_Foerderschwerpunkt PRIMARY KEY (FSP, SF)
);


CREATE TABLE Statkue_Gliederung (
  SF varchar(2) NOT NULL, 
  Flag varchar(1) NOT NULL, 
  BKAnlage varchar(1) NOT NULL, 
  BKTyp varchar(2) NOT NULL, 
  BKIndex int DEFAULT 0, 
  Beschreibung varchar(100), 
  geaendert datetime,
  CONSTRAINT PK_Statkue_Gliederung PRIMARY KEY (BKAnlage, BKTyp, Flag, SF)
);


CREATE TABLE Statkue_Herkunftsart (
  SF varchar(2) NOT NULL, 
  Art varchar(2) NOT NULL, 
  Beschreibung varchar(255) NOT NULL, 
  Flag varchar(1) DEFAULT '1' NOT NULL, 
  Sortierung int DEFAULT 0 NOT NULL, 
  geaendert datetime,
  CONSTRAINT PK_Statkue_Herkunftsart PRIMARY KEY (Art, SF)
);


CREATE TABLE Statkue_Herkunftsschulform (
  SF varchar(2) NOT NULL, 
  HSF varchar(3) NOT NULL, 
  Beschreibung varchar(150) NOT NULL, 
  Flag varchar(1) DEFAULT '1' NOT NULL, 
  geaendert datetime,
  CONSTRAINT PK_Statkue_Herkunftsschulform PRIMARY KEY (HSF, SF)
);


CREATE TABLE Statkue_LehrerAbgang (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  ASDSchluessel varchar(2),
  CONSTRAINT PK_Statkue_LehrerAbgang PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerAnrechnung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerAnrechnung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerBeschaeftigungsart (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerBeschaeftigungsart PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerEinsatzstatus (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerEinsatzstatus PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerFachrAnerkennung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerFachrAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerFachrichtung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerFachrichtung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehramt (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLehramt PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehramtAnerkennung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLehramtAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehrbefAnerkennung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLehrbefAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehrbefaehigung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLehrbefaehigung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLeitung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLeitung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerMehrleistung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerMehrleistung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerMinderleistung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerMinderleistung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerRechtsverhaeltnis (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerRechtsverhaeltnis PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerZugang (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  ASDSchluessel varchar(2),
  CONSTRAINT PK_Statkue_LehrerZugang PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Nationalitaeten (
  Schluessel varchar(3) NOT NULL, 
  Klartext varchar(255) NOT NULL, 
  Klartext2 varchar(80) NOT NULL, 
  Flag varchar(1), 
  geaendert datetime, 
  Beginn datetime, 
  Ende datetime,
  CONSTRAINT PK_Statkue_Nationalitaeten PRIMARY KEY (Schluessel)
);


CREATE TABLE Statkue_Organisationsform (
  SF varchar(2) NOT NULL, 
  OrgForm varchar(1) NOT NULL, 
  FSP varchar(2) NOT NULL, 
  Beschreibung varchar(100) NOT NULL, 
  Flag varchar(1), 
  geaendert datetime,
  CONSTRAINT PK_Statkue_Organisationsform PRIMARY KEY (FSP, OrgForm, SF)
);


CREATE TABLE Statkue_PLZOrt (
  ID bigint NOT NULL, 
  PLZ varchar(50), 
  REGSCHL varchar(50), 
  ORT varchar(50), 
  Sortierung int DEFAULT 1,
  CONSTRAINT PK_Statkue_PLZOrt PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Reformpaedagogik (
  SF varchar(2) NOT NULL, 
  RPG varchar(1) NOT NULL, 
  Beschreibung varchar(100) NOT NULL, 
  geaendert datetime,
  CONSTRAINT PK_Statkue_Reformpaedagogik PRIMARY KEY (RPG, SF)
);


CREATE TABLE Statkue_Religionen (
  Schluessel varchar(2) NOT NULL, 
  Klartext varchar(50) NOT NULL, 
  geaendert datetime,
  CONSTRAINT PK_Statkue_Religionen PRIMARY KEY (Schluessel)
);


CREATE TABLE Statkue_SchuelerErsteSchulformSekI (
  ID bigint NOT NULL, 
  SF varchar(2), 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  geaendert datetime,
  CONSTRAINT PK_Statkue_SchuelerErsteSchulformSekI PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerKindergartenbesuch (
  ID bigint NOT NULL, 
  SF varchar(2), 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_SchuelerKindergartenbesuch PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerUebergangsempfehlung5Jg (
  ID bigint NOT NULL, 
  SF varchar(2), 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int, 
  HGSEM varchar(4) NOT NULL,
  CONSTRAINT PK_Statkue_SchuelerUebergangsempfehlung5Jg PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerVerkehrssprache (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Gesprochen_in varchar(255), 
  Beginn datetime, 
  Ende datetime,
  CONSTRAINT PK_Statkue_SchuelerVerkehrssprache PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Schulformen (
  Schulform varchar(2), 
  SF varchar(2) NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Flag varchar(1) DEFAULT '1' NOT NULL, 
  geaendert datetime, 
  Sortierung int DEFAULT 0,
  CONSTRAINT PK_Statkue_Schulformen PRIMARY KEY (Bezeichnung, SF)
);


CREATE TABLE Statkue_ZulFaecher (
  Schulform varchar(2) NOT NULL, 
  FSP varchar(2) NOT NULL, 
  BG varchar(2) NOT NULL, 
  Fach varchar(2) NOT NULL, 
  Bezeichnung varchar(80) NOT NULL, 
  KZ_Bereich int DEFAULT 0, 
  Flag varchar(1) DEFAULT '1', 
  Sortierung int DEFAULT 0, 
  geaendert datetime,
  CONSTRAINT PK_Statkue_ZulFaecher PRIMARY KEY (BG, Bezeichnung, FSP, Fach, Flag, Schulform)
);


CREATE TABLE Statkue_ZulJahrgaenge (
  ID bigint NOT NULL, 
  Schulform varchar(2) NOT NULL, 
  SNR varchar(6), 
  FSP varchar(2), 
  Jahrgang varchar(2), 
  KZ_Bereich int DEFAULT 0, 
  Beschreibung varchar(255), 
  geaendert datetime,
  CONSTRAINT PK_Statkue_ZulJahrgaenge PRIMARY KEY (ID)
);


CREATE TABLE Statkue_ZulKlArt (
  KlArt varchar(2) NOT NULL, 
  FSP varchar(2) NOT NULL, 
  Bezeichnung varchar(100) NOT NULL, 
  Schulform varchar(2) NOT NULL, 
  geaendert datetime,
  CONSTRAINT PK_Statkue_ZulKlArt PRIMARY KEY (Bezeichnung, FSP, KlArt, Schulform)
);


CREATE TABLE Statkue_ZulKuArt (
  SF varchar(2) NOT NULL, 
  FSP varchar(2) NOT NULL, 
  BG varchar(2) NOT NULL, 
  Kursart varchar(3) NOT NULL, 
  Kursart2 varchar(5) NOT NULL, 
  Bezeichnung varchar(120) NOT NULL, 
  JgBereich int DEFAULT 0 NOT NULL, 
  Flag varchar(1) DEFAULT '1' NOT NULL, 
  geaendert datetime,
  CONSTRAINT PK_Statkue_ZulKuArt PRIMARY KEY (BG, Bezeichnung, FSP, Flag, JgBereich, Kursart, Kursart2, SF)
);


CREATE TABLE Stundentafel (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Jahrgang_ID bigint, 
  ASDJahrgang varchar(2), 
  Klasse varchar(6), 
  SGL varchar(3), 
  Fachklasse_ID bigint, 
  Sichtbar varchar(1) DEFAULT '+', 
  SchulnrEigner int, 
  Sortierung int DEFAULT 32000,
  CONSTRAINT PK_Stundentafel PRIMARY KEY (ID)
);


CREATE TABLE Stundentafel_Faecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Stundentafel_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  KursartAllg varchar(5), 
  WochenStd smallint, 
  LehrerKrz varchar(10), 
  EpochenUnterricht varchar(1) DEFAULT '-', 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Gewichtung int DEFAULT 1, 
  SchulnrEigner int,
  CONSTRAINT PK_Stundentafel_Faecher PRIMARY KEY (ID),
  CONSTRAINT StundentafelFaecher_Faecher_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT StundentafelFaecher_Stdtafel_FK FOREIGN KEY (Stundentafel_ID) REFERENCES Stundentafel(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundentafel_Faecher_UC1 UNIQUE (Fach_ID, Stundentafel_ID)
);


CREATE TABLE TextExportVorlagen (
  SchulnrEigner int NOT NULL, 
  VorlageName varchar(50) NOT NULL, 
  Daten text,
  CONSTRAINT PK_TextExportVorlagen PRIMARY KEY (SchulnrEigner, VorlageName)
);


CREATE TABLE Usergroups (
  UG_ID bigint NOT NULL, 
  UG_Bezeichnung varchar(64), 
  UG_Kompetenzen varchar(255), 
  UG_Nr int, 
  SchulnrEigner int,
  CONSTRAINT PK_Usergroups PRIMARY KEY (UG_ID),
  CONSTRAINT Usergroups_UC1 UNIQUE (UG_Bezeichnung)
);


CREATE TABLE Users (
  ID bigint DEFAULT -1 NOT NULL, 
  US_Name varchar(50) NOT NULL, 
  US_LoginName varchar(20) NOT NULL, 
  US_Password varchar(20), 
  US_UserGroups varchar(50), 
  US_Privileges varchar(255), 
  SchulnrEigner int, 
  EMail varchar(100), 
  EMailName varchar(100), 
  SMTPUsername varchar(100), 
  SMTPPassword varchar(100), 
  EMailSignature text, 
  HeartbeatDate int, 
  ComputerName varchar(50), 
  US_PasswordHash varchar(255),
  CONSTRAINT PK_Users PRIMARY KEY (ID),
  CONSTRAINT Users_UC1 UNIQUE (US_LoginName)
);


CREATE TABLE Versetzung (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung varchar(150), 
  ASDKlasse varchar(6), 
  Klasse varchar(15) NOT NULL, 
  Jahrgang_ID bigint, 
  FKlasse varchar(15), 
  VKlasse varchar(15), 
  OrgFormKrz varchar(1), 
  KlassenlehrerKrz varchar(10), 
  StvKlassenlehrerKrz varchar(10), 
  Restabschnitte smallint, 
  ASDSchulformNr varchar(3), 
  Fachklasse_ID bigint, 
  PruefOrdnung varchar(20), 
  Sichtbar varchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  Klassenart varchar(2), 
  SommerSem varchar(1), 
  NotenGesperrt varchar(1), 
  SchulnrEigner int, 
  AdrMerkmal varchar(1) DEFAULT 'A', 
  WebNotenGesperrt varchar(1) DEFAULT '-', 
  KoopKlasse varchar(1) DEFAULT '-', 
  Ankreuzzeugnisse varchar(1),
  CONSTRAINT PK_Versetzung PRIMARY KEY (ID),
  CONSTRAINT Versetzung_Lehrer_FK FOREIGN KEY (KlassenlehrerKrz) REFERENCES K_Lehrer(Kuerzel) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT Versetzung_UC1 UNIQUE (Klasse)
);


CREATE TABLE EigeneSchule_Abt_Kl (
  ID bigint DEFAULT -1 NOT NULL, 
  Abteilung_ID bigint NOT NULL, 
  Klasse varchar(15) NOT NULL, 
  Sichtbar varchar(1) DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_EigeneSchule_Abt_Kl PRIMARY KEY (ID),
  CONSTRAINT EigeneSchuleAbtKl_Abteilung_FK FOREIGN KEY (Abteilung_ID) REFERENCES EigeneSchule_Abteilungen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT EigeneSchuleAbtKl_Klasse_FK FOREIGN KEY (Klasse) REFERENCES Versetzung(Klasse) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Schueler (
  ID bigint DEFAULT -1 NOT NULL, 
  GU_ID varchar(40), 
  SrcID int, 
  IDext varchar(30), 
  Status int, 
  Name varchar(60), 
  Vorname varchar(60), 
  Zusatz varchar(255), 
  Geburtsname varchar(60), 
  Strasse varchar(50), 
  Ort_ID bigint, 
  PLZ varchar(10), 
  OrtAbk varchar(50), 
  Ortsteil_ID bigint, 
  Telefon varchar(20), 
  Email varchar(100), 
  Fax varchar(20), 
  AktSchuljahr smallint, 
  AktAbschnitt smallint, 
  Klasse varchar(15), 
  Jahrgang smallint, 
  PruefOrdnung varchar(20), 
  Geburtsdatum date, 
  Geburtsort varchar(100), 
  Volljaehrig varchar(1) DEFAULT '-', 
  Geschlecht smallint, 
  StaatKrz varchar(3), 
  StaatKrz2 varchar(3), 
  StaatAbk varchar(50), 
  Aussiedler varchar(1) DEFAULT '-', 
  Religion_ID bigint, 
  ReligionAbk varchar(30), 
  Religionsabmeldung date, 
  Religionsanmeldung date, 
  Bafoeg varchar(1) DEFAULT '-', 
  Schwerbehinderung varchar(1) DEFAULT '-', 
  Foerderschwerpunkt_ID bigint, 
  Sportbefreiung_ID bigint, 
  Fahrschueler_ID bigint, 
  Haltestelle_ID bigint, 
  HaltestelleAbk varchar(30), 
  ASDSchulform varchar(3), 
  Jahrgang_ID bigint, 
  ASDJahrgang varchar(2), 
  Fachklasse_ID bigint, 
  SchulpflichtErf varchar(1) DEFAULT '-', 
  Anschreibdatum date, 
  Aufnahmedatum date, 
  Einschulungsjahr smallint, 
  Einschulungsart_ID bigint, 
  LSSchulNr varchar(6), 
  LSSchulformSIM varchar(3), 
  LSJahrgang varchar(2), 
  LSSchulentlassDatum date, 
  LSVersetzung varchar(2), 
  LSFachklKennung varchar(10), 
  LSFachklSIM varchar(5), 
  LSEntlassgrund varchar(50), 
  LSEntlassArt varchar(2), 
  LSKlassenart varchar(2), 
  LSRefPaed varchar(1), 
  Entlassjahrgang varchar(2), 
  Entlassjahrgang_ID bigint, 
  Entlassdatum date, 
  Entlassgrund varchar(50), 
  Entlassart varchar(2), 
  SchulwechselNr varchar(6), 
  Schulwechseldatum date, 
  Geloescht varchar(1) DEFAULT '-', 
  Gesperrt varchar(1) DEFAULT '-', 
  ModifiziertAm datetime, 
  ModifiziertVon varchar(20), 
  Markiert varchar(21) DEFAULT '-', 
  FotoVorhanden varchar(1) DEFAULT '-', 
  JVA varchar(1) DEFAULT '-', 
  RefPaed varchar(1), 
  KeineAuskunft varchar(1) DEFAULT '-', 
  Lehrer varchar(10), 
  Beruf varchar(100), 
  AbschlussDatum varchar(15), 
  Bemerkungen text, 
  BeginnBildungsgang date, 
  Durchschnitt varchar(4), 
  OrgFormKrz varchar(1), 
  Klassenart varchar(2), 
  DurchschnittsNote varchar(4), 
  LSSGL varchar(5), 
  LSSchulform varchar(2), 
  KonfDruck varchar(1), 
  DSN_Text varchar(15), 
  Berufsabschluss varchar(1), 
  Schwerpunkt_ID bigint, 
  LSSGL_SIM varchar(3), 
  BerufsschulpflErf varchar(1), 
  StatusNSJ int, 
  FachklasseNSJ_ID bigint, 
  Buchkonto float, 
  VerkehrsspracheFamilie varchar(2), 
  JahrZuzug int, 
  DauerKindergartenbesuch varchar(1), 
  VerpflichtungSprachfoerderkurs varchar(1), 
  TeilnahmeSprachfoerderkurs varchar(1), 
  Schulbuchgeldbefreit varchar(1), 
  Autist varchar(1), 
  GeburtslandSchueler varchar(10), 
  GeburtslandVater varchar(10), 
  GeburtslandMutter varchar(10), 
  Uebergangsempfehlung_JG5 varchar(10), 
  ErsteSchulform_SI varchar(10), 
  JahrWechsel_SI int, 
  JahrWechsel_SII int, 
  Migrationshintergrund varchar(1), 
  Foerderschwerpunkt2_ID bigint, 
  SortierungKlasse int, 
  ExterneSchulNr varchar(6), 
  Kindergarten_ID bigint, 
  LetzterBerufsAbschluss varchar(10), 
  LetzterAllgAbschluss varchar(10), 
  Land varchar(2), 
  AV_Leist int, 
  AV_Zuv int, 
  AV_Selbst int, 
  SV_Verant int, 
  SV_Konfl int, 
  SV_Koop int, 
  Duplikat varchar(1) DEFAULT '-', 
  EinschulungsartASD varchar(2), 
  Hausnr varchar(10), 
  Strassenname varchar(50), 
  SchulnrEigner int, 
  BilingualerZweig varchar(1), 
  DurchschnittsnoteFHR varchar(4), 
  DSN_FHR_Text varchar(15), 
  Eigenanteil float, 
  StaatAbk2 varchar(50), 
  ZustimmungFoto varchar(1) DEFAULT '-', 
  BKAZVO int, 
  HatBerufsausbildung varchar(1) DEFAULT '-', 
  Ausweisnummer varchar(30), 
  AOSF varchar(1) DEFAULT '+', 
  EPJahre int DEFAULT 2, 
  LSBemerkung varchar(255), 
  WechselBestaetigt varchar(1) DEFAULT '-', 
  DauerBildungsgang int, 
  AnmeldeDatum date, 
  MeisterBafoeg varchar(1) DEFAULT '-', 
  OnlineAnmeldung varchar(1) DEFAULT '-', 
  Dokumentenverzeichnis varchar(255), 
  Berufsqualifikation varchar(100), 
  HausnrZusatz varchar(30), 
  ZieldifferentesLernen varchar(1) DEFAULT '-', 
  ZusatzNachname varchar(30), 
  EndeEingliederung date, 
  SchulEmail varchar(100), 
  EndeAnschlussfoerderung date,
  CONSTRAINT PK_Schueler PRIMARY KEY (ID),
  CONSTRAINT Schueler_Einschulungsart_FK FOREIGN KEY (Einschulungsart_ID) REFERENCES K_EinschulungsArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Fahrschueler_FK FOREIGN KEY (Fahrschueler_ID) REFERENCES K_FahrschuelerArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Foerderschwerpunkt_FK FOREIGN KEY (Foerderschwerpunkt_ID) REFERENCES K_Foerderschwerpunkt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Haltestelle_FK FOREIGN KEY (Haltestelle_ID) REFERENCES K_Haltestelle(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Ort_PLZ_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Ortsteil_FK FOREIGN KEY (Ortsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Religion_FK FOREIGN KEY (Religion_ID) REFERENCES K_Religion(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Sportbefreiung_FK FOREIGN KEY (Sportbefreiung_ID) REFERENCES K_Sportbefreiung(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Staat_FK FOREIGN KEY (StaatKrz) REFERENCES K_Staat(StatistikKrz) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Versetzung_FK FOREIGN KEY (Klasse) REFERENCES Versetzung(Klasse) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_UC1 UNIQUE (GU_ID)
);


CREATE TABLE SchuelerMerkmale (
  ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Kurztext varchar(10), 
  SchulnrEigner int, 
  DatumVon date, 
  DatumBis date,
  CONSTRAINT PK_SchuelerMerkmale PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerMerkmale_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerBKAbschluss (
  Schueler_ID bigint NOT NULL, 
  Zulassung char(1), 
  Bestanden char(1), 
  Zeugnis char(1), 
  ZertifikatBK char(1), 
  ZulassungErwBK char(1), 
  BestandenErwBK char(1), 
  ZulassungBA char(1), 
  BestandenBA char(1), 
  PraktPrfNote varchar(2), 
  NoteKolloquium varchar(2), 
  ThemaAbschlussarbeit text, 
  SchulnrEigner int, 
  BAP_Vorhanden varchar(1), 
  NoteFachpraxis varchar(2), 
  FachPraktAnteilAusr varchar(1), 
  Jahr int, 
  Abschnitt int,
  CONSTRAINT PK_SchuelerBKAbschluss PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerBKAbschl_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerTelefone (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  TelefonArt_ID bigint, 
  Telefonnummer varchar(20), 
  Bemerkung varchar(50), 
  Sortierung int DEFAULT 32000, 
  SchulnrEigner int, 
  Gesperrt varchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerTelefone PRIMARY KEY (ID),
  CONSTRAINT SchuelerTelefone_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerTelefone_Telefonart_FK FOREIGN KEY (TelefonArt_ID) REFERENCES K_TelefonArt(ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE INDEX SchuelerTelefone_IDX1 ON SchuelerTelefone(Schueler_ID);


CREATE TABLE SchuelerVermerke (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  VermerkArt_ID bigint, 
  Datum date, 
  Bemerkung text, 
  SchulnrEigner int, 
  AngelegtVon varchar(20), 
  GeaendertVon varchar(20),
  CONSTRAINT PK_SchuelerVermerke PRIMARY KEY (ID),
  CONSTRAINT SchuelerVermerke_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerVermerke_VermerkArt_FK FOREIGN KEY (VermerkArt_ID) REFERENCES K_Vermerkart(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerVermerke_IDX1 ON SchuelerVermerke(Schueler_ID);


CREATE TABLE SchuelerSprachenfolge (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  JahrgangVon smallint, 
  JahrgangBis smallint, 
  Reihenfolge varchar(1), 
  AbschnittVon smallint, 
  AbschnittBis smallint, 
  SchulnrEigner int, 
  Referenzniveau varchar(5),
  CONSTRAINT PK_SchuelerSprachenfolge PRIMARY KEY (ID),
  CONSTRAINT SchuelerSprachenfolge_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerSprachenfolge_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerSprachenfolge_UC1 UNIQUE (Fach_ID, Schueler_ID)
);


CREATE TABLE SchuelerListe_Inhalt (
  Liste_ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerListe_Inhalt PRIMARY KEY (Liste_ID, Schueler_ID),
  CONSTRAINT SchuelerListeInhalt_Liste_FK FOREIGN KEY (Liste_ID) REFERENCES SchuelerListe(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerListeInhalt_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerNUESDaten (
  ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  JahrgangIst varchar(2), 
  HauptMerkmal varchar(20) NOT NULL, 
  NebenMerkmal varchar(20),
  CONSTRAINT PK_SchuelerNUESDaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerNUESDaten_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerAbiFaecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  FachKrz varchar(20), 
  FSortierung int, 
  Gekoppelt varchar(1), 
  Kurs_ID bigint, 
  KursartAllg varchar(5), 
  Fachlehrer varchar(10), 
  AbiFach varchar(1), 
  P11_1 varchar(2), 
  S11_1 varchar(1), 
  P11_2 varchar(2), 
  S11_2 varchar(1), 
  P_FA varchar(2), 
  R_FA varchar(1) DEFAULT '-', 
  W12_1 int, 
  P12_1 varchar(2), 
  H12_1 int, 
  R12_1 varchar(1) DEFAULT '-', 
  S12_1 varchar(1) DEFAULT '-', 
  W12_2 int, 
  P12_2 varchar(2), 
  H12_2 int, 
  R12_2 varchar(1) DEFAULT '-', 
  S12_2 varchar(1) DEFAULT '-', 
  W13_1 int, 
  P13_1 varchar(2), 
  H13_1 int, 
  R13_1 varchar(1) DEFAULT '-', 
  S13_1 varchar(1) DEFAULT '-', 
  W13_2 int, 
  P13_2 varchar(2), 
  H13_2 int, 
  R13_2 varchar(1) DEFAULT '-', 
  S13_2 varchar(1) DEFAULT '-', 
  Zulassung smallint, 
  Durchschnitt float, 
  AbiPruefErgebnis smallint, 
  Zwischenstand smallint, 
  MdlPflichtPruefung varchar(1) DEFAULT '-', 
  MdlBestPruefung varchar(1), 
  MdlFreiwPruefung varchar(1) DEFAULT '-', 
  MdlPruefErgebnis smallint, 
  MdlPruefFolge smallint, 
  AbiErgebnis smallint, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerAbiFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbiFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbiFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFotos (
  Schueler_ID bigint NOT NULL, 
  Foto longblob, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerFotos PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerFotos_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Kurs_Schueler (
  Kurs_ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL,
  CONSTRAINT PK_Kurs_Schueler PRIMARY KEY (Kurs_ID, Schueler_ID),
  CONSTRAINT KursSchueler_Kurse_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT KursSchueler_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerBKFaecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  FachKrz varchar(20), 
  FachSchriftlich char(1), 
  FachSchriftlichBA char(1), 
  Vornote varchar(2), 
  NoteSchriftlich varchar(2), 
  MdlPruefung char(1), 
  MdlPruefungFW char(1), 
  NoteMuendlich varchar(2), 
  NoteAbschluss varchar(2), 
  NotePrfGesamt varchar(2), 
  FSortierung int, 
  SchulnrEigner int, 
  Fachlehrer varchar(10), 
  NoteAbschlussBA varchar(2), 
  Kursart varchar(5), 
  Jahr int, 
  Abschnitt int,
  CONSTRAINT PK_SchuelerBKFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerBKFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerBKFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerAbgaenge (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  BemerkungIntern varchar(30), 
  AbgangsSchulform varchar(2), 
  AbgangsBeschreibung varchar(200), 
  OrganisationsformKrz varchar(1), 
  AbgangsSchule varchar(100), 
  AbgangsSchuleAnschr varchar(100), 
  AbgangsSchulNr varchar(6), 
  LSJahrgang varchar(2), 
  LSEntlassArt varchar(2), 
  LSSchulformSIM varchar(3), 
  LSSchulEntlassDatum date, 
  LSVersetzung varchar(2), 
  LSSGL varchar(5), 
  LSFachklKennung varchar(10), 
  LSFachklSIM varchar(5), 
  FuerSIMExport varchar(1) DEFAULT '-', 
  LSBeginnDatum date, 
  LSBeginnJahrgang varchar(2), 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerAbgaenge PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbgaenge_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerAbgaenge_IDX1 ON SchuelerAbgaenge(LSSchulEntlassDatum, Schueler_ID);


CREATE TABLE SchuelerLernabschnittsdaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Jahr smallint NOT NULL, 
  Abschnitt smallint NOT NULL, 
  Bildungsgang varchar(1) NOT NULL, 
  WechselNr smallint NOT NULL, 
  Jahrgang smallint, 
  Hochrechnung int, 
  SemesterWertung varchar(1) DEFAULT '+', 
  PruefOrdnung varchar(20), 
  Klasse varchar(10), 
  Verspaetet smallint, 
  NPV_Fach_ID bigint, 
  NPV_NoteKrz varchar(2), 
  NPV_Datum date, 
  NPAA_Fach_ID bigint, 
  NPAA_NoteKrz varchar(2), 
  NPAA_Datum date, 
  NPBQ_Fach_ID bigint, 
  NPBQ_NoteKrz varchar(2), 
  NPBQ_Datum date, 
  VersetzungKrz varchar(2), 
  AbschlussArt smallint, 
  AbschlIstPrognose varchar(1) DEFAULT '-', 
  Konferenzdatum date, 
  ZeugnisDatum date, 
  KlassenLehrer varchar(10), 
  ASDSchulgliederung varchar(3), 
  ASDJahrgang varchar(2), 
  Jahrgang_ID bigint, 
  Fachklasse_ID bigint, 
  Schwerpunkt_ID bigint, 
  ZeugnisBem text, 
  Schwerbehinderung varchar(1) DEFAULT '-', 
  Foerderschwerpunkt_ID bigint, 
  OrgFormKrz varchar(1), 
  RefPaed varchar(1) DEFAULT '-', 
  Klassenart varchar(2), 
  SumFehlStd int, 
  SumFehlStdU int, 
  Wiederholung varchar(1), 
  Gesamtnote_GS int, 
  Gesamtnote_NW int, 
  Folgeklasse varchar(10), 
  Foerderschwerpunkt2_ID bigint, 
  Abschluss varchar(50), 
  Abschluss_B varchar(50), 
  DSNote varchar(4), 
  AV_Leist int, 
  AV_Zuv int, 
  AV_Selbst int, 
  SV_Verant int, 
  SV_Konfl int, 
  SV_Koop int, 
  KN_Lehrer varchar(10), 
  SchulnrEigner int, 
  StvKlassenlehrer_ID bigint, 
  MoeglNPFaecher text, 
  Zertifikate varchar(30), 
  DatumFHR date, 
  PruefAlgoErgebnis text, 
  Zeugnisart varchar(5), 
  DatumVon date, 
  DatumBis date, 
  FehlstundenGrenzwert int,
  CONSTRAINT PK_SchuelerLernabschnittsdaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerLernabschnittsdaten_Fachklasse_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Foerderschwerpunkt_FK FOREIGN KEY (Foerderschwerpunkt_ID) REFERENCES K_Foerderschwerpunkt(ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT SchuelerLernabschnittsdaten_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLernabschnittsdaten_UC1 UNIQUE (Abschnitt, Bildungsgang, Jahr, Schueler_ID, WechselNr)
);


CREATE TABLE SchuelerErzAdr (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  ErzieherArt_ID bigint, 
  Anrede1 varchar(20), 
  Titel1 varchar(10), 
  Name1 varchar(50), 
  Vorname1 varchar(50), 
  Anrede2 varchar(20), 
  Titel2 varchar(10), 
  Name2 varchar(50), 
  Vorname2 varchar(50), 
  ErzStrasse varchar(50), 
  ErzOrt_ID bigint, 
  ErzPLZ varchar(10), 
  ErzOrtsteil_ID bigint, 
  ErzAnschreiben varchar(1) DEFAULT '+', 
  ErzBemerkung varchar(255), 
  Sortierung int, 
  ErzEMail varchar(100), 
  ErzAdrZusatz varchar(50), 
  SchulnrEigner int, 
  Erz1StaatKrz varchar(3), 
  Erz2StaatKrz varchar(3), 
  ErzEMail2 varchar(100), 
  Erz1ZusatzNachname varchar(30), 
  Erz2ZusatzNachname varchar(30), 
  Bemerkungen text,
  CONSTRAINT PK_SchuelerErzAdr PRIMARY KEY (ID),
  CONSTRAINT SchuelerErzAdr_ErzieherArt_FK FOREIGN KEY (ErzieherArt_ID) REFERENCES K_ErzieherArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Ort_FK FOREIGN KEY (ErzOrt_ID) REFERENCES K_Ort(ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT SchuelerErzAdr_Ortsteil_FK FOREIGN KEY (ErzOrtsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT SchuelerErzAdr_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerErzAdr_IDX1 ON SchuelerErzAdr(Schueler_ID);


CREATE TABLE SchuelerDatenschutz (
  Schueler_ID bigint NOT NULL, 
  Datenschutz_ID bigint NOT NULL, 
  Status varchar(1) DEFAULT '-' NOT NULL, 
  SchulnrEigner int NOT NULL,
  CONSTRAINT PK_SchuelerDatenschutz PRIMARY KEY (Datenschutz_ID, Schueler_ID),
  CONSTRAINT SchuelerDatenschutz_K_Datenschutz_FK FOREIGN KEY (Datenschutz_ID) REFERENCES K_Datenschutz(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerDatenschutz_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerAnkreuzfloskeln (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  Floskel_ID bigint NOT NULL, 
  Stufe1 varchar(1), 
  Stufe2 varchar(1), 
  Stufe3 varchar(1), 
  Stufe4 varchar(1), 
  Stufe5 varchar(1),
  CONSTRAINT PK_SchuelerAnkreuzfloskeln PRIMARY KEY (ID),
  CONSTRAINT SchuelerAKF_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFHRFaecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  KursartAllg varchar(5), 
  FachKrz varchar(20), 
  PSII_2_1 varchar(2), 
  HSII_2_1 int, 
  RSII_2_1 varchar(1) DEFAULT '-', 
  PSII_2_2 varchar(2), 
  HSII_2_2 int, 
  RSII_2_2 varchar(1) DEFAULT '-', 
  PSII_2_1_W varchar(2), 
  HSII_2_1_W int, 
  RSII_2_1_W varchar(1) DEFAULT '-', 
  PSII_2_2_W varchar(2), 
  HSII_2_2_W int, 
  RSII_2_2_W varchar(1) DEFAULT '-', 
  PSII_3_1 varchar(2), 
  HSII_3_1 int, 
  RSII_3_1 varchar(1) DEFAULT '-', 
  PSII_3_2 varchar(2), 
  HSII_3_2 int, 
  RSII_3_2 varchar(1) DEFAULT '-', 
  PSII_3_1_W varchar(2), 
  HSII_3_1_W int, 
  RSII_3_1_W varchar(1) DEFAULT '-', 
  PSII_3_2_W varchar(2), 
  HSII_3_2_W int, 
  RSII_3_2_W varchar(1) DEFAULT '-', 
  KSII_2_1 varchar(5), 
  KSII_2_2 varchar(5), 
  KSII_2_1_W varchar(5), 
  KSII_2_2_W varchar(5), 
  KSII_3_1 varchar(5), 
  KSII_3_2 varchar(5), 
  KSII_3_1_W varchar(5), 
  KSII_3_2_W varchar(5), 
  FSortierung int, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerFHRFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerFHRFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFHRFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Schueler_AllgAdr (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Adresse_ID bigint NOT NULL, 
  Vertragsart_ID bigint, 
  Vertragsbeginn date, 
  Vertragsende date, 
  Ausbilder varchar(30), 
  AllgAdrAnschreiben varchar(1) DEFAULT '-', 
  Praktikum varchar(1) DEFAULT '-', 
  Sortierung int, 
  Ansprechpartner_ID bigint, 
  Betreuungslehrer_ID bigint, 
  SchulnrEigner int,
  CONSTRAINT PK_Schueler_AllgAdr PRIMARY KEY (ID),
  CONSTRAINT SchuelerAllgAdr_Adresse_FK FOREIGN KEY (Adresse_ID) REFERENCES K_AllgAdresse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAllgAdr_Ansprech_FK FOREIGN KEY (Ansprechpartner_ID) REFERENCES AllgAdrAnsprechpartner(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerAllgAdr_Beschaeftigungsart_FK FOREIGN KEY (Vertragsart_ID) REFERENCES K_BeschaeftigungsArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerAllgAdr_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Schueler_AllgAdr_IDX1 ON Schueler_AllgAdr(Schueler_ID);


CREATE TABLE SchuelerAbitur (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  FA_Fach varchar(130), 
  FA_Punkte int, 
  FehlStd int, 
  uFehlStd int, 
  Latinum varchar(1) DEFAULT '-', 
  KlLatinum varchar(1) DEFAULT '-', 
  Graecum varchar(1) DEFAULT '-', 
  Hebraicum varchar(1) DEFAULT '-', 
  FranzBilingual varchar(1) DEFAULT '-', 
  BesondereLernleistung varchar(1) DEFAULT '-', 
  AnzRelLK smallint, 
  AnzRelGK smallint, 
  AnzRelOK smallint, 
  AnzDefLK smallint, 
  AnzDefGK smallint, 
  Thema_PJK varchar(255), 
  FS2_SekI_manuell varchar(1) DEFAULT '-', 
  Kurse_I int, 
  Defizite_I int, 
  LK_Defizite_I int, 
  AnzahlKurse_0 int, 
  Punktsumme_I int, 
  Durchschnitt_I float, 
  SummeGK smallint, 
  SummeLK smallint, 
  SummenOK smallint, 
  Zugelassen varchar(1) DEFAULT '-', 
  Jahr int, 
  Abschnitt int, 
  BLL_Art varchar(1) DEFAULT 'K', 
  BLL_Punkte int, 
  Thema_BLL varchar(255), 
  Punktsumme_II int, 
  Defizite_II int, 
  LK_Defizite_II int, 
  PruefungBestanden varchar(1) DEFAULT '-', 
  Note varchar(3), 
  GesamtPunktzahl smallint, 
  Notensprung smallint, 
  FehlendePunktzahl smallint, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerAbitur PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbitur_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbitur_UC1 UNIQUE (Schueler_ID)
);


CREATE TABLE SchuelerFHR (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  FHRErreicht varchar(1) DEFAULT '-', 
  Note varchar(3), 
  GesamtPunktzahl smallint, 
  SummeGK smallint, 
  SummeLK smallint, 
  SummenOK smallint, 
  AnzRelLK smallint, 
  AnzRelGK smallint, 
  AnzRelOK smallint, 
  AnzDefLK smallint, 
  AnzDefGK smallint, 
  AnzDefOK smallint, 
  JSII_2_1 smallint, 
  JSII_2_1_W smallint, 
  JSII_2_2 smallint, 
  JSII_2_2_W smallint, 
  JSII_3_1 smallint, 
  JSII_3_1_W smallint, 
  JSII_3_2 smallint, 
  JSII_3_2_W smallint, 
  ASII_2_1 smallint, 
  ASII_2_2 smallint, 
  ASII_2_1_W smallint, 
  ASII_2_2_W smallint, 
  ASII_3_1 smallint, 
  ASII_3_2 smallint, 
  ASII_3_1_W smallint, 
  ASII_3_2_W smallint, 
  WSII_2_1 varchar(1), 
  WSII_2_2 varchar(1), 
  WSII_2_1_W varchar(1), 
  WSII_2_2_W varchar(1), 
  WSII_3_1 varchar(1), 
  WSII_3_2 varchar(1), 
  WSII_3_1_W varchar(1), 
  WSII_3_2_W varchar(1), 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerFHR PRIMARY KEY (ID),
  CONSTRAINT SchuelerFHR_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFHR_UC1 UNIQUE (Schueler_ID)
);


CREATE TABLE SchuelerKAoADaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  Jahrgang varchar(2), 
  Kategorie varchar(10), 
  Merkmal varchar(20), 
  Zusatzmerkmal varchar(20), 
  Anschlussoption varchar(2), 
  Berufsfeld varchar(10), 
  Bemerkung varchar(255),
  CONSTRAINT PK_SchuelerKAoADaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerKAoADaten_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFoerderempfehlungen (
  GU_ID varchar(40) NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  DatumAngelegt date DEFAULT CURRENT_DATE() NOT NULL, 
  Klasse varchar(15), 
  Jahr int, 
  Abschnitt int, 
  Fach_ID bigint, 
  Lehrer_ID bigint, 
  DatumAenderungSchild datetime, 
  DatumAenderungSchildWeb datetime, 
  Kurs varchar(20), 
  Inhaltl_Prozessbez_Komp text, 
  Methodische_Komp text, 
  Lern_Arbeitsverhalten text, 
  Massn_Inhaltl_Prozessbez_Komp text, 
  Massn_Methodische_Komp text, 
  Massn_Lern_Arbeitsverhalten text, 
  Verantwortlichkeit_Eltern text, 
  Verantwortlichkeit_Schueler text, 
  Zeitrahmen_von_Datum date, 
  Zeitrahmen_bis_Datum date, 
  Ueberpruefung_Datum date, 
  Naechstes_Beratungsgespraech date, 
  Leistung_ID bigint, 
  Kurs_ID bigint, 
  EingabeFertig varchar(1) DEFAULT '-', 
  Faecher varchar(255), 
  Abgeschlossen varchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerFoerderempfehlungen PRIMARY KEY (GU_ID),
  CONSTRAINT SchuelerFE_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerZuweisungen (
  Abschnitt_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart varchar(5), 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerZuweisungen PRIMARY KEY (Abschnitt_ID, Fach_ID),
  CONSTRAINT Zuweisungen_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerErzFunktion (
  ID bigint DEFAULT -1 NOT NULL, 
  Erzieher_ID bigint NOT NULL, 
  Funktion_ID bigint NOT NULL, 
  Person smallint, 
  Klasse varchar(10), 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerErzFunktion PRIMARY KEY (ID),
  CONSTRAINT SchuelerErzFunktion_Erzieher_FK FOREIGN KEY (Erzieher_ID) REFERENCES SchuelerErzAdr(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerErzFunktion_Funktion_FK FOREIGN KEY (Funktion_ID) REFERENCES K_ErzieherFunktion(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerLeistungsdaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Hochrechnung int, 
  FachLehrer varchar(10), 
  Kursart varchar(5), 
  KursartAllg varchar(5), 
  Kurs_ID bigint, 
  NotenKrz varchar(2), 
  Warnung varchar(1) DEFAULT '-', 
  Warndatum date, 
  AbiFach varchar(1), 
  Wochenstunden smallint, 
  AbiZeugnis varchar(1) DEFAULT '-', 
  Prognose varchar(1), 
  Fehlstd smallint, 
  uFehlstd smallint, 
  Sortierung int DEFAULT 32000, 
  Lernentw text, 
  Gekoppelt varchar(1) DEFAULT '-', 
  VorherAbgeschl varchar(1) DEFAULT '-', 
  AbschlussJahrgang varchar(2), 
  HochrechnungStatus varchar(1), 
  SchulNr int, 
  Zusatzkraft varchar(10), 
  WochenstdZusatzkraft int, 
  Prf10Fach varchar(1), 
  AufZeugnis varchar(1) DEFAULT '+', 
  Gewichtung int DEFAULT 1, 
  SchulnrEigner int, 
  NoteAbschlussBA varchar(2),
  CONSTRAINT PK_SchuelerLeistungsdaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerLeistungsdaten_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLeistungsdaten_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLeistungsdaten_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_Lehrer_FK FOREIGN KEY (FachLehrer) REFERENCES K_Lehrer(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_UC2 UNIQUE (Abschnitt_ID, FachLehrer, Fach_ID, Kurs_ID, Kursart)
);

CREATE INDEX SchuelerLeistungsdaten_IDX1 ON SchuelerLeistungsdaten(Kurs_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX2 ON SchuelerLeistungsdaten(Fach_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX3 ON SchuelerLeistungsdaten(FachLehrer);


CREATE TABLE SchuelerLD_PSFachBem (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  ASV text, 
  LELS text, 
  ESF text, 
  BemerkungFSP text, 
  BemerkungVersetzung text, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerLD_PSFachBem PRIMARY KEY (ID),
  CONSTRAINT SchuelerLD_PSFachBem_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLD_PSFachBem_UC1 UNIQUE (Abschnitt_ID)
);


CREATE TABLE SchuelerFehlstunden (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Datum date DEFAULT CURRENT_DATE() NOT NULL, 
  Fach_ID bigint, 
  Fehlstd float NOT NULL, 
  VonStd int, 
  BisStd int, 
  Entschuldigt varchar(1), 
  Lehrer_ID bigint,
  CONSTRAINT PK_SchuelerFehlstunden PRIMARY KEY (ID),
  CONSTRAINT SchuelerFehlstunden_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE ZuordnungReportvorlagen (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Jahrgang_ID bigint NOT NULL, 
  Abschluss varchar(50), 
  AbschlussBB varchar(50), 
  AbschlussArt int, 
  VersetzungKrz varchar(2), 
  Fachklasse_ID bigint, 
  Reportvorlage varchar(255), 
  Beschreibung varchar(255), 
  Gruppe varchar(50), 
  Zeugnisart varchar(5),
  CONSTRAINT PK_ZuordnungReportvorlagen PRIMARY KEY (ID)
);
delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Fachklassen
BEFORE INSERT
  ON EigeneSchule_Fachklassen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Fachklassen' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM EigeneSchule_Fachklassen INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Fachklassen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Fachklassen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Fachklassen
BEFORE UPDATE
  ON EigeneSchule_Fachklassen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Fachklassen' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM EigeneSchule_Fachklassen INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Fachklassen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Fachklassen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Faecher
BEFORE INSERT
  ON EigeneSchule_Faecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Faecher' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM EigeneSchule_Faecher INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Faecher', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Faecher';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Faecher
BEFORE UPDATE
  ON EigeneSchule_Faecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Faecher' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM EigeneSchule_Faecher INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Faecher', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Faecher';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Jahrgaenge
BEFORE INSERT
  ON EigeneSchule_Jahrgaenge FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Jahrgaenge' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM EigeneSchule_Jahrgaenge INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Jahrgaenge', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Jahrgaenge';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Jahrgaenge
BEFORE UPDATE
  ON EigeneSchule_Jahrgaenge FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Jahrgaenge' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM EigeneSchule_Jahrgaenge INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Jahrgaenge', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Jahrgaenge';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Kursart
BEFORE INSERT
  ON EigeneSchule_Kursart FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Kursart' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM EigeneSchule_Kursart INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Kursart', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Kursart';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Kursart
BEFORE UPDATE
  ON EigeneSchule_Kursart FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Kursart' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM EigeneSchule_Kursart INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Kursart', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Kursart';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_KursartAllg
BEFORE INSERT
  ON EigeneSchule_KursartAllg FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_KursartAllg' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM EigeneSchule_KursartAllg INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_KursartAllg', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_KursartAllg';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_KursartAllg
BEFORE UPDATE
  ON EigeneSchule_KursartAllg FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_KursartAllg' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM EigeneSchule_KursartAllg INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_KursartAllg', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_KursartAllg';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Merkmale
BEFORE INSERT
  ON EigeneSchule_Merkmale FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Merkmale' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM EigeneSchule_Merkmale INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Merkmale', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Merkmale';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Merkmale
BEFORE UPDATE
  ON EigeneSchule_Merkmale FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Merkmale' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM EigeneSchule_Merkmale INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Merkmale', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Merkmale';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Schulformen
BEFORE INSERT
  ON EigeneSchule_Schulformen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Schulformen' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM EigeneSchule_Schulformen INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Schulformen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Schulformen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Schulformen
BEFORE UPDATE
  ON EigeneSchule_Schulformen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Schulformen' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM EigeneSchule_Schulformen INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Schulformen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Schulformen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Zertifikate
BEFORE INSERT
  ON EigeneSchule_Zertifikate FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Zertifikate' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM EigeneSchule_Zertifikate INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Zertifikate', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Zertifikate';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Zertifikate
BEFORE UPDATE
  ON EigeneSchule_Zertifikate FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Zertifikate' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM EigeneSchule_Zertifikate INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Zertifikate', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Zertifikate';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Adressart
BEFORE INSERT
  ON K_Adressart FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Adressart' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Adressart INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Adressart', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Adressart';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Adressart
BEFORE UPDATE
  ON K_Adressart FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Adressart' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Adressart INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Adressart', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Adressart';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Ankreuzdaten
BEFORE INSERT
  ON K_Ankreuzdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Ankreuzdaten' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Ankreuzdaten INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ankreuzdaten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ankreuzdaten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ankreuzdaten
BEFORE UPDATE
  ON K_Ankreuzdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Ankreuzdaten' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Ankreuzdaten INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ankreuzdaten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ankreuzdaten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Ankreuzfloskeln
BEFORE INSERT
  ON K_Ankreuzfloskeln FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Ankreuzfloskeln' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Ankreuzfloskeln INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ankreuzfloskeln', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ankreuzfloskeln';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ankreuzfloskeln
BEFORE UPDATE
  ON K_Ankreuzfloskeln FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Ankreuzfloskeln' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Ankreuzfloskeln INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ankreuzfloskeln', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ankreuzfloskeln';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_BeschaeftigungsArt
BEFORE INSERT
  ON K_BeschaeftigungsArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_BeschaeftigungsArt' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_BeschaeftigungsArt INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_BeschaeftigungsArt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_BeschaeftigungsArt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_BeschaeftigungsArt
BEFORE UPDATE
  ON K_BeschaeftigungsArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_BeschaeftigungsArt' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_BeschaeftigungsArt INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_BeschaeftigungsArt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_BeschaeftigungsArt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Datenschutz
BEFORE INSERT
  ON K_Datenschutz FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Datenschutz' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Datenschutz INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Datenschutz', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Datenschutz';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Datenschutz
BEFORE UPDATE
  ON K_Datenschutz FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Datenschutz' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Datenschutz INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Datenschutz', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Datenschutz';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_EinschulungsArt
BEFORE INSERT
  ON K_EinschulungsArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_EinschulungsArt' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_EinschulungsArt INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_EinschulungsArt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_EinschulungsArt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_EinschulungsArt
BEFORE UPDATE
  ON K_EinschulungsArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_EinschulungsArt' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_EinschulungsArt INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_EinschulungsArt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_EinschulungsArt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Einzelleistungen
BEFORE INSERT
  ON K_Einzelleistungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Einzelleistungen' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Einzelleistungen INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Einzelleistungen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Einzelleistungen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Einzelleistungen
BEFORE UPDATE
  ON K_Einzelleistungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Einzelleistungen' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Einzelleistungen INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Einzelleistungen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Einzelleistungen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_EntlassGrund
BEFORE INSERT
  ON K_EntlassGrund FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_EntlassGrund' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_EntlassGrund INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_EntlassGrund', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_EntlassGrund';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_EntlassGrund
BEFORE UPDATE
  ON K_EntlassGrund FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_EntlassGrund' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_EntlassGrund INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_EntlassGrund', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_EntlassGrund';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_ErzieherArt
BEFORE INSERT
  ON K_ErzieherArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_ErzieherArt' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_ErzieherArt INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_ErzieherArt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_ErzieherArt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_ErzieherArt
BEFORE UPDATE
  ON K_ErzieherArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_ErzieherArt' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_ErzieherArt INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_ErzieherArt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_ErzieherArt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_ErzieherFunktion
BEFORE INSERT
  ON K_ErzieherFunktion FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_ErzieherFunktion' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_ErzieherFunktion INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_ErzieherFunktion', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_ErzieherFunktion';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_ErzieherFunktion
BEFORE UPDATE
  ON K_ErzieherFunktion FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_ErzieherFunktion' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_ErzieherFunktion INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_ErzieherFunktion', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_ErzieherFunktion';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_FahrschuelerArt
BEFORE INSERT
  ON K_FahrschuelerArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_FahrschuelerArt' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_FahrschuelerArt INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_FahrschuelerArt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_FahrschuelerArt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_FahrschuelerArt
BEFORE UPDATE
  ON K_FahrschuelerArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_FahrschuelerArt' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_FahrschuelerArt INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_FahrschuelerArt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_FahrschuelerArt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Foerderschwerpunkt
BEFORE INSERT
  ON K_Foerderschwerpunkt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Foerderschwerpunkt' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Foerderschwerpunkt INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Foerderschwerpunkt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Foerderschwerpunkt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Foerderschwerpunkt
BEFORE UPDATE
  ON K_Foerderschwerpunkt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Foerderschwerpunkt' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Foerderschwerpunkt INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Foerderschwerpunkt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Foerderschwerpunkt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Haltestelle
BEFORE INSERT
  ON K_Haltestelle FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Haltestelle' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Haltestelle INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Haltestelle', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Haltestelle';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Haltestelle
BEFORE UPDATE
  ON K_Haltestelle FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Haltestelle' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Haltestelle INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Haltestelle', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Haltestelle';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Kindergarten
BEFORE INSERT
  ON K_Kindergarten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Kindergarten' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Kindergarten INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Kindergarten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Kindergarten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Kindergarten
BEFORE UPDATE
  ON K_Kindergarten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Kindergarten' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Kindergarten INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Kindergarten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Kindergarten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_KlassenOrgForm
BEFORE INSERT
  ON K_KlassenOrgForm FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_KlassenOrgForm' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_KlassenOrgForm INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_KlassenOrgForm', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_KlassenOrgForm';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_KlassenOrgForm
BEFORE UPDATE
  ON K_KlassenOrgForm FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_KlassenOrgForm' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_KlassenOrgForm INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_KlassenOrgForm', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_KlassenOrgForm';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Ort
BEFORE INSERT
  ON K_Ort FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Ort' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Ort INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ort', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ort';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ort
BEFORE UPDATE
  ON K_Ort FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Ort' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Ort INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ort', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ort';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_AllgAdresse
BEFORE INSERT
  ON K_AllgAdresse FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_AllgAdresse' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_AllgAdresse INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_AllgAdresse', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_AllgAdresse';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_AllgAdresse
BEFORE UPDATE
  ON K_AllgAdresse FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_AllgAdresse' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_AllgAdresse INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_AllgAdresse', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_AllgAdresse';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_AllgAdrAnsprechpartner
BEFORE INSERT
  ON AllgAdrAnsprechpartner FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='AllgAdrAnsprechpartner' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM AllgAdrAnsprechpartner INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('AllgAdrAnsprechpartner', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='AllgAdrAnsprechpartner';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_AllgAdrAnsprechpartner
BEFORE UPDATE
  ON AllgAdrAnsprechpartner FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='AllgAdrAnsprechpartner' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM AllgAdrAnsprechpartner INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('AllgAdrAnsprechpartner', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='AllgAdrAnsprechpartner';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Ortsteil
BEFORE INSERT
  ON K_Ortsteil FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Ortsteil' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Ortsteil INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ortsteil', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ortsteil';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ortsteil
BEFORE UPDATE
  ON K_Ortsteil FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Ortsteil' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Ortsteil INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ortsteil', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ortsteil';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Lehrer
BEFORE INSERT
  ON K_Lehrer FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Lehrer' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Lehrer INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Lehrer', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Lehrer';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Lehrer
BEFORE UPDATE
  ON K_Lehrer FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Lehrer' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Lehrer INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Lehrer', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Lehrer';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Abteilungen
BEFORE INSERT
  ON EigeneSchule_Abteilungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Abteilungen' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM EigeneSchule_Abteilungen INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Abteilungen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Abteilungen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Abteilungen
BEFORE UPDATE
  ON EigeneSchule_Abteilungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Abteilungen' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM EigeneSchule_Abteilungen INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Abteilungen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Abteilungen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Religion
BEFORE INSERT
  ON K_Religion FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Religion' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Religion INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Religion', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Religion';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Religion
BEFORE UPDATE
  ON K_Religion FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Religion' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Religion INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Religion', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Religion';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Schule
BEFORE INSERT
  ON K_Schule FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Schule' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Schule INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schule', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Schule';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Schule
BEFORE UPDATE
  ON K_Schule FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Schule' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Schule INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schule', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Schule';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Schulfunktionen
BEFORE INSERT
  ON K_Schulfunktionen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Schulfunktionen' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Schulfunktionen INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schulfunktionen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Schulfunktionen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Schulfunktionen
BEFORE UPDATE
  ON K_Schulfunktionen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Schulfunktionen' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Schulfunktionen INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schulfunktionen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Schulfunktionen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Schwerpunkt
BEFORE INSERT
  ON K_Schwerpunkt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Schwerpunkt' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Schwerpunkt INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schwerpunkt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Schwerpunkt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Schwerpunkt
BEFORE UPDATE
  ON K_Schwerpunkt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Schwerpunkt' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Schwerpunkt INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schwerpunkt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Schwerpunkt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Sportbefreiung
BEFORE INSERT
  ON K_Sportbefreiung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Sportbefreiung' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Sportbefreiung INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Sportbefreiung', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Sportbefreiung';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Sportbefreiung
BEFORE UPDATE
  ON K_Sportbefreiung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Sportbefreiung' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Sportbefreiung INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Sportbefreiung', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Sportbefreiung';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Staat
BEFORE INSERT
  ON K_Staat FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Staat' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Staat INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Staat', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Staat';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Staat
BEFORE UPDATE
  ON K_Staat FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Staat' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Staat INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Staat', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Staat';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_TXTDATEIEN
BEFORE INSERT
  ON K_TXTDATEIEN FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_TXTDATEIEN' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_TXTDATEIEN INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_TXTDATEIEN', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_TXTDATEIEN';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_TXTDATEIEN
BEFORE UPDATE
  ON K_TXTDATEIEN FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_TXTDATEIEN' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_TXTDATEIEN INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_TXTDATEIEN', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_TXTDATEIEN';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_TelefonArt
BEFORE INSERT
  ON K_TelefonArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_TelefonArt' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_TelefonArt INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_TelefonArt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_TelefonArt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_TelefonArt
BEFORE UPDATE
  ON K_TelefonArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_TelefonArt' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_TelefonArt INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_TelefonArt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_TelefonArt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Verkehrssprachen
BEFORE INSERT
  ON K_Verkehrssprachen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Verkehrssprachen' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Verkehrssprachen INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Verkehrssprachen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Verkehrssprachen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Verkehrssprachen
BEFORE UPDATE
  ON K_Verkehrssprachen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Verkehrssprachen' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Verkehrssprachen INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Verkehrssprachen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Verkehrssprachen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Vermerkart
BEFORE INSERT
  ON K_Vermerkart FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Vermerkart' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM K_Vermerkart INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Vermerkart', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Vermerkart';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Vermerkart
BEFORE UPDATE
  ON K_Vermerkart FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='K_Vermerkart' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM K_Vermerkart INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Vermerkart', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Vermerkart';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Kurse
BEFORE INSERT
  ON Kurse FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Kurse' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM Kurse INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Kurse', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Kurse';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Kurse
BEFORE UPDATE
  ON Kurse FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Kurse' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM Kurse INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Kurse', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Kurse';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Personengruppen
BEFORE INSERT
  ON Personengruppen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Personengruppen' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM Personengruppen INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Personengruppen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Personengruppen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Personengruppen
BEFORE UPDATE
  ON Personengruppen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Personengruppen' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM Personengruppen INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Personengruppen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Personengruppen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Personengruppen_Personen
BEFORE INSERT
  ON Personengruppen_Personen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Personengruppen_Personen' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM Personengruppen_Personen INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Personengruppen_Personen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Personengruppen_Personen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Personengruppen_Personen
BEFORE UPDATE
  ON Personengruppen_Personen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Personengruppen_Personen' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM Personengruppen_Personen INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Personengruppen_Personen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Personengruppen_Personen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchildFilter
BEFORE INSERT
  ON SchildFilter FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchildFilter' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchildFilter INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchildFilter', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchildFilter';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchildFilter
BEFORE UPDATE
  ON SchildFilter FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchildFilter' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchildFilter INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchildFilter', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchildFilter';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerEinzelleistungen
BEFORE INSERT
  ON SchuelerEinzelleistungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerEinzelleistungen' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerEinzelleistungen INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerEinzelleistungen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerEinzelleistungen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerEinzelleistungen
BEFORE UPDATE
  ON SchuelerEinzelleistungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerEinzelleistungen' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerEinzelleistungen INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerEinzelleistungen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerEinzelleistungen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerListe
BEFORE INSERT
  ON SchuelerListe FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerListe' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerListe INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerListe', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerListe';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerListe
BEFORE UPDATE
  ON SchuelerListe FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerListe' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerListe INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerListe', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerListe';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerWiedervorlage
BEFORE INSERT
  ON SchuelerWiedervorlage FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerWiedervorlage' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerWiedervorlage INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerWiedervorlage', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerWiedervorlage';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerWiedervorlage
BEFORE UPDATE
  ON SchuelerWiedervorlage FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerWiedervorlage' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerWiedervorlage INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerWiedervorlage', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerWiedervorlage';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundentafel
BEFORE INSERT
  ON Stundentafel FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Stundentafel' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM Stundentafel INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundentafel', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundentafel';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundentafel
BEFORE UPDATE
  ON Stundentafel FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Stundentafel' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM Stundentafel INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundentafel', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundentafel';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundentafel_Faecher
BEFORE INSERT
  ON Stundentafel_Faecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Stundentafel_Faecher' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM Stundentafel_Faecher INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundentafel_Faecher', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundentafel_Faecher';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundentafel_Faecher
BEFORE UPDATE
  ON Stundentafel_Faecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Stundentafel_Faecher' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM Stundentafel_Faecher INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundentafel_Faecher', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundentafel_Faecher';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Users
BEFORE INSERT
  ON Users FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Users' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM Users INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Users', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Users';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Users
BEFORE UPDATE
  ON Users FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Users' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM Users INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Users', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Users';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Versetzung
BEFORE INSERT
  ON Versetzung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Versetzung' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM Versetzung INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Versetzung', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Versetzung';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Versetzung
BEFORE UPDATE
  ON Versetzung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Versetzung' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM Versetzung INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Versetzung', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Versetzung';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Abt_Kl
BEFORE INSERT
  ON EigeneSchule_Abt_Kl FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Abt_Kl' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM EigeneSchule_Abt_Kl INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Abt_Kl', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Abt_Kl';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Abt_Kl
BEFORE UPDATE
  ON EigeneSchule_Abt_Kl FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='EigeneSchule_Abt_Kl' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM EigeneSchule_Abt_Kl INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Abt_Kl', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Abt_Kl';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Schueler
BEFORE INSERT
  ON Schueler FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Schueler' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM Schueler INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Schueler', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Schueler';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Schueler
BEFORE UPDATE
  ON Schueler FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Schueler' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM Schueler INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Schueler', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Schueler';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerTelefone
BEFORE INSERT
  ON SchuelerTelefone FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerTelefone' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerTelefone INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerTelefone', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerTelefone';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerTelefone
BEFORE UPDATE
  ON SchuelerTelefone FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerTelefone' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerTelefone INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerTelefone', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerTelefone';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerVermerke
BEFORE INSERT
  ON SchuelerVermerke FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerVermerke' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerVermerke INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerVermerke', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerVermerke';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerVermerke
BEFORE UPDATE
  ON SchuelerVermerke FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerVermerke' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerVermerke INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerVermerke', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerVermerke';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerSprachenfolge
BEFORE INSERT
  ON SchuelerSprachenfolge FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerSprachenfolge' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerSprachenfolge INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerSprachenfolge', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerSprachenfolge';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerSprachenfolge
BEFORE UPDATE
  ON SchuelerSprachenfolge FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerSprachenfolge' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerSprachenfolge INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerSprachenfolge', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerSprachenfolge';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAbiFaecher
BEFORE INSERT
  ON SchuelerAbiFaecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerAbiFaecher' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerAbiFaecher INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbiFaecher', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAbiFaecher';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAbiFaecher
BEFORE UPDATE
  ON SchuelerAbiFaecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerAbiFaecher' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerAbiFaecher INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbiFaecher', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAbiFaecher';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerBKFaecher
BEFORE INSERT
  ON SchuelerBKFaecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerBKFaecher' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerBKFaecher INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerBKFaecher', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerBKFaecher';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerBKFaecher
BEFORE UPDATE
  ON SchuelerBKFaecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerBKFaecher' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerBKFaecher INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerBKFaecher', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerBKFaecher';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAbgaenge
BEFORE INSERT
  ON SchuelerAbgaenge FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerAbgaenge' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerAbgaenge INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbgaenge', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAbgaenge';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAbgaenge
BEFORE UPDATE
  ON SchuelerAbgaenge FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerAbgaenge' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerAbgaenge INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbgaenge', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAbgaenge';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerLernabschnittsdaten
BEFORE INSERT
  ON SchuelerLernabschnittsdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerLernabschnittsdaten' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerLernabschnittsdaten INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLernabschnittsdaten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerLernabschnittsdaten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerLernabschnittsdaten
BEFORE UPDATE
  ON SchuelerLernabschnittsdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerLernabschnittsdaten' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerLernabschnittsdaten INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLernabschnittsdaten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerLernabschnittsdaten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerErzAdr
BEFORE INSERT
  ON SchuelerErzAdr FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerErzAdr' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerErzAdr INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerErzAdr', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerErzAdr';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerErzAdr
BEFORE UPDATE
  ON SchuelerErzAdr FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerErzAdr' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerErzAdr INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerErzAdr', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerErzAdr';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAnkreuzfloskeln
BEFORE INSERT
  ON SchuelerAnkreuzfloskeln FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerAnkreuzfloskeln' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerAnkreuzfloskeln INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAnkreuzfloskeln', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAnkreuzfloskeln';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAnkreuzfloskeln
BEFORE UPDATE
  ON SchuelerAnkreuzfloskeln FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerAnkreuzfloskeln' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerAnkreuzfloskeln INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAnkreuzfloskeln', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAnkreuzfloskeln';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerFHRFaecher
BEFORE INSERT
  ON SchuelerFHRFaecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerFHRFaecher' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerFHRFaecher INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFHRFaecher', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerFHRFaecher';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerFHRFaecher
BEFORE UPDATE
  ON SchuelerFHRFaecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerFHRFaecher' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerFHRFaecher INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFHRFaecher', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerFHRFaecher';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Schueler_AllgAdr
BEFORE INSERT
  ON Schueler_AllgAdr FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Schueler_AllgAdr' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM Schueler_AllgAdr INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Schueler_AllgAdr', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Schueler_AllgAdr';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Schueler_AllgAdr
BEFORE UPDATE
  ON Schueler_AllgAdr FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='Schueler_AllgAdr' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM Schueler_AllgAdr INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Schueler_AllgAdr', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Schueler_AllgAdr';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAbitur
BEFORE INSERT
  ON SchuelerAbitur FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerAbitur' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerAbitur INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbitur', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAbitur';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAbitur
BEFORE UPDATE
  ON SchuelerAbitur FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerAbitur' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerAbitur INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbitur', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAbitur';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerFHR
BEFORE INSERT
  ON SchuelerFHR FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerFHR' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerFHR INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFHR', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerFHR';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerFHR
BEFORE UPDATE
  ON SchuelerFHR FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerFHR' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerFHR INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFHR', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerFHR';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerKAoADaten
BEFORE INSERT
  ON SchuelerKAoADaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerKAoADaten' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerKAoADaten INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerKAoADaten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerKAoADaten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerKAoADaten
BEFORE UPDATE
  ON SchuelerKAoADaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerKAoADaten' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerKAoADaten INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerKAoADaten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerKAoADaten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerErzFunktion
BEFORE INSERT
  ON SchuelerErzFunktion FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerErzFunktion' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerErzFunktion INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerErzFunktion', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerErzFunktion';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerErzFunktion
BEFORE UPDATE
  ON SchuelerErzFunktion FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerErzFunktion' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerErzFunktion INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerErzFunktion', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerErzFunktion';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerLeistungsdaten
BEFORE INSERT
  ON SchuelerLeistungsdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerLeistungsdaten' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerLeistungsdaten INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLeistungsdaten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerLeistungsdaten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerLeistungsdaten
BEFORE UPDATE
  ON SchuelerLeistungsdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerLeistungsdaten' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerLeistungsdaten INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLeistungsdaten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerLeistungsdaten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_DELETE_SCHUELERLEISTUNGSDATEN_KURS_SCHUELER
AFTER DELETE
	ON SchuelerLeistungsdaten FOR EACH ROW
BEGIN
    DECLARE schuelerID INTEGER;
    IF OLD.Kurs_ID IS NOT NULL THEN
		SET schuelerID := (SELECT Schueler.id FROM SchuelerLernabschnittsdaten JOIN Schueler ON SchuelerLernabschnittsdaten.ID = OLD.Abschnitt_ID AND SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID);
        DELETE FROM Kurs_Schueler WHERE Kurs_Schueler.Kurs_ID = OLD.Kurs_ID AND Kurs_Schueler.SCHUELER_ID = schuelerID;
    END IF;
END
$
delimiter ;


delimiter $
CREATE TRIGGER t_INSERT_SCHUELERLEISTUNGSDATEN_KURS_SCHUELER
AFTER INSERT
	ON SchuelerLeistungsdaten FOR EACH ROW
BEGIN
    DECLARE schuelerID INTEGER;
    IF NEW.Kurs_ID IS NOT NULL THEN
		SET schuelerID := (SELECT Schueler.id FROM SchuelerLernabschnittsdaten JOIN Schueler ON SchuelerLernabschnittsdaten.ID = NEW.Abschnitt_ID AND SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID);
        INSERT INTO Kurs_Schueler(Kurs_ID, Schueler_ID) VALUES (NEW.Kurs_ID, schuelerID);
    END IF;
END
$
delimiter ;


delimiter $
CREATE TRIGGER t_UPDATE_SCHUELERLEISTUNGSDATEN_KURS_SCHUELER
AFTER UPDATE
	ON SchuelerLeistungsdaten FOR EACH ROW
BEGIN
    DECLARE alteSchuelerID, neueSchuelerID INTEGER;
    IF NEW.Kurs_ID IS NOT NULL AND OLD.Kurs_ID IS NOT NULL AND OLD.Kurs_ID <> NEW.Kurs_ID THEN
		SET alteSchuelerID := (SELECT Schueler.id FROM SchuelerLernabschnittsdaten JOIN Schueler ON SchuelerLernabschnittsdaten.ID = OLD.Abschnitt_ID AND SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID);
        IF OLD.Abschnitt_ID <> NEW.Abschnitt_ID THEN
			SET neueSchuelerID := (SELECT Schueler.id FROM SchuelerLernabschnittsdaten JOIN Schueler ON SchuelerLernabschnittsdaten.ID = NEW.Abschnitt_ID AND SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID);
		ELSE
            SET neueSchuelerID := alteSchuelerID;
        END IF;
        UPDATE Kurs_Schueler SET Kurs_Schueler.Kurs_ID = NEW.Kurs_ID, Kurs_Schueler.Schueler_ID = neueSchuelerID WHERE Kurs_Schueler.Kurs_ID = OLD.Kurs_ID AND Kurs_Schueler.SCHUELER_ID = alteSchuelerID;
    ELSEIF NEW.Kurs_ID IS NULL THEN
        SET alteSchuelerID := (SELECT Schueler.id FROM SchuelerLernabschnittsdaten JOIN Schueler ON SchuelerLernabschnittsdaten.ID = OLD.Abschnitt_ID AND SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID);
        DELETE FROM Kurs_Schueler WHERE Kurs_Schueler.Kurs_ID = OLD.Kurs_ID AND Kurs_Schueler.SCHUELER_ID = alteSchuelerID;        
    ELSEIF OLD.Kurs_ID IS NULL THEN
		SET neueSchuelerID := (SELECT Schueler.id FROM SchuelerLernabschnittsdaten JOIN Schueler ON SchuelerLernabschnittsdaten.ID = NEW.Abschnitt_ID AND SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID);
        INSERT INTO Kurs_Schueler(Kurs_ID, Schueler_ID) VALUES (NEW.Kurs_ID, neueSchuelerID);
    END IF;
END
$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerLD_PSFachBem
BEFORE INSERT
  ON SchuelerLD_PSFachBem FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerLD_PSFachBem' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerLD_PSFachBem INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLD_PSFachBem', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerLD_PSFachBem';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerLD_PSFachBem
BEFORE UPDATE
  ON SchuelerLD_PSFachBem FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerLD_PSFachBem' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerLD_PSFachBem INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLD_PSFachBem', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerLD_PSFachBem';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerFehlstunden
BEFORE INSERT
  ON SchuelerFehlstunden FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerFehlstunden' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM SchuelerFehlstunden INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFehlstunden', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerFehlstunden';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerFehlstunden
BEFORE UPDATE
  ON SchuelerFehlstunden FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='SchuelerFehlstunden' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM SchuelerFehlstunden INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFehlstunden', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerFehlstunden';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_ZuordnungReportvorlagen
BEFORE INSERT
  ON ZuordnungReportvorlagen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='ZuordnungReportvorlagen' INTO tmpID;
  IF tmpID IS NULL THEN
    SELECT max(ID) FROM ZuordnungReportvorlagen INTO tmpID;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('ZuordnungReportvorlagen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='ZuordnungReportvorlagen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_ZuordnungReportvorlagen
BEFORE UPDATE
  ON ZuordnungReportvorlagen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle='ZuordnungReportvorlagen' INTO tmpID;
    IF tmpID IS NULL THEN
      SELECT max(ID) FROM ZuordnungReportvorlagen INTO tmpID;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('ZuordnungReportvorlagen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE SVWS_DB_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='ZuordnungReportvorlagen';
    END IF;
  END IF;
END

$
delimiter ;



DELETE FROM Kurs_Schueler;

UPDATE 
  SchuelerLeistungsdaten a 
SET 
  Kurs_ID = NULL 
WHERE
  (SELECT Jahr,Abschnitt FROM Kurse WHERE ID = a.Kurs_ID) <> (SELECT Jahr,Abschnitt FROM SchuelerLernabschnittsdaten WHERE ID = a.Abschnitt_ID);

INSERT INTO Kurs_Schueler
SELECT DISTINCT
  Kurse.ID AS Kurs_ID,
  Schueler.ID AS Schueler_ID
FROM 
  Kurse JOIN SchuelerLeistungsdaten ON Kurse.ID = SchuelerLeistungsdaten.Kurs_ID
        JOIN SchuelerLernabschnittsdaten ON SchuelerLeistungsdaten.Abschnitt_ID = SchuelerLernabschnittsdaten.ID
        JOIN Schueler ON SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID;

INSERT INTO SVWS_DB_Version(Revision) VALUES (3);


INSERT INTO Users (ID,US_Name,US_LoginName,US_UserGroups,US_Privileges) VALUES (1,'Administrator','Admin','1;2;3;4;5','$');
