--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7 (Debian 15.7-1.pgdg120+1)
-- Dumped by pg_dump version 15.3

-- Started on 2024-05-21 14:05:12

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16395)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    category_name character varying
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16394)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 216
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 215 (class 1259 OID 16386)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    id integer NOT NULL,
    name character varying,
    location character varying
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16385)
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_id_seq OWNER TO postgres;

--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 214
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_id_seq OWNED BY public.company.id;


--
-- TOC entry 225 (class 1259 OID 16431)
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    id integer NOT NULL,
    code character varying
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16430)
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currency_id_seq OWNER TO postgres;

--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 224
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currency_id_seq OWNED BY public.currency.id;


--
-- TOC entry 227 (class 1259 OID 16440)
-- Name: offer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offer (
    id integer NOT NULL,
    position_id integer,
    company_id integer,
    category_id integer,
    currency_id integer,
    source_id integer,
    link character varying,
    seniority character varying,
    minimum_salary double precision,
    maximum_salary double precision,
    summary character varying
);


ALTER TABLE public.offer OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16439)
-- Name: offer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.offer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offer_id_seq OWNER TO postgres;

--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 226
-- Name: offer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.offer_id_seq OWNED BY public.offer.id;


--
-- TOC entry 228 (class 1259 OID 16473)
-- Name: offer_skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offer_skill (
    offer_id integer NOT NULL,
    skill_id integer NOT NULL
);


ALTER TABLE public.offer_skill OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16413)
-- Name: position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."position" (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public."position" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16412)
-- Name: position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.position_id_seq OWNER TO postgres;

--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 220
-- Name: position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.position_id_seq OWNED BY public."position".id;


--
-- TOC entry 223 (class 1259 OID 16422)
-- Name: skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill (
    id integer NOT NULL,
    skill_name character varying
);


ALTER TABLE public.skill OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16421)
-- Name: skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skill_id_seq OWNER TO postgres;

--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 222
-- Name: skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skill_id_seq OWNED BY public.skill.id;


--
-- TOC entry 219 (class 1259 OID 16404)
-- Name: source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.source (
    id integer NOT NULL,
    source_name character varying
);


ALTER TABLE public.source OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16403)
-- Name: source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.source_id_seq OWNER TO postgres;

--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 218
-- Name: source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.source_id_seq OWNED BY public.source.id;


--
-- TOC entry 3234 (class 2604 OID 16398)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 16389)
-- Name: company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company ALTER COLUMN id SET DEFAULT nextval('public.company_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 16434)
-- Name: currency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 16443)
-- Name: offer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer ALTER COLUMN id SET DEFAULT nextval('public.offer_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 16416)
-- Name: position id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position" ALTER COLUMN id SET DEFAULT nextval('public.position_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 16425)
-- Name: skill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill ALTER COLUMN id SET DEFAULT nextval('public.skill_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 16407)
-- Name: source id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source ALTER COLUMN id SET DEFAULT nextval('public.source_id_seq'::regclass);


--
-- TOC entry 3408 (class 0 OID 16395)
-- Dependencies: 217
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, category_name) FROM stdin;
1	BigData/Data Science
2	Data
\.


--
-- TOC entry 3406 (class 0 OID 16386)
-- Dependencies: 215
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (id, name, location) FROM stdin;
1	J-LABS sp. z o.o.	Zabłocie 43A, Podgórze, Kraków
2	TIDK sp. z o.o.	Samuela Bogumiła Lindego 1c, Bronowice, Kraków
3	Be in IT	Kraków
4	INFOGAIN TECHNOLOGIES SPKA Z OGRANICZON ODPOWIEDZIALNOCI	Kraków
5	Mindbox S.A.	Kraków
6	edrone Sp. z o.o.	Lekarska 1, Prądnik Biały, Kraków
7	Tesco Technology	Przy Rondzie 4, Grzegórzki, Kraków
8	Kontakt.io	Stoczniowców 3, Podgórze, Kraków
9	ITDS Polska Sp. z o.o.	Kraków
10	KITOPI POLAND sp. z o.o.	Lubostroń 1, Dębniki, Kraków
11	BRAVER IT SPKA AKCYJNA	Kraków
12	Avanade Poland Sp. z o.o.	Kraków
13	Rite NRG sp. z o.o.	Wadowicka 7, Podgórze, Kraków
14	BPMRIDERS	Centrum, Kraków, 50.0591121 N 19.9378922 E
15	in4ge sp. z o.o.	-, Kraków, 50.0646501 N 19.9449799 E
16	7N	7N Road 505, Montrose County, Colorado, United States
17	ITDS	Zakrzówek, Kraków, 50.0412396 N 19.9176932 E
18	Omni Calculator	Mikołajska 13, Kraków, 50.0613911 N 19.9426072 E
19	Tooploox	-, Kraków, 50.0646501 N 19.9449799 E
20	MasterBorn Sp. z o.o.	-, Kraków, 50.0638134 N 19.9298243 E
21	InfiniteDATA	-, Kraków, 50.0646501 N 19.9449799 E
22	Remitly	Pawia 17, Kraków, 50.0711184 N 19.9452978 E
23	Trans.eu Group SA	-, Kraków, 50.0646501 N 19.9449799 E
24	RITS Professional Services	ul. leca w ch... z biurem w Krk za to mają biuro w Katowice przy ul. centrum, 50.2648919 N 19.0237815 E
25	Crestt	ul. leca w ch... z biurem w Krk za to mają biuro w Warszawa przy ul. Tadeusza Rejtana 17, 52.2072880 N 21.0174513 E
26	Datumo	Centrum, Kraków, 50.0591121 N 19.9378922 E
27	Onwelo Sp. z o.o.	Mogilska 43, Kraków, 50.0660615 N 19.9675828 E
28	Sunscrapers	-, Kraków, 50.0646501 N 19.9449799 E
29	Qodeca	-, Kraków, 50.0646501 N 19.9449799 E
30	Blazity	ul. leca w ch... z biurem w Krk za to mają biuro w Warszawa przy ul. Plac Trzech Krzyży, 52.2286204 N 21.0222933 E
31	Opensignal	-, Kraków, 50.0646501 N 19.9449799 E
32	Scalac	-, Kraków, 50.0646501 N 19.9449799 E
33	Qurate Retail Group GBS	Ul. Wielicka 30, Kraków, 50.0156249 N 19.9948761 E
34	Agora SA	Agora, 8/10, Czerska, Marcelin, Sielce, Mokotów, Warszawa, województwo mazowieckie, 00-732, Polska
35	Limango Polska	-, Kraków, 50.0646501 N 19.9449799 E
36	BlockWise	-, Kraków, 50.0646501 N 19.9449799 E
37	N-iX	Zabłocie 43A, 30-701, Kraków, 50.0497753 N 19.9627033 E
38	DevsData LLC	Centrum, Kraków, 50.0591121 N 19.9378922 E
39	Sporty Group	-, Kraków, 50.0646501 N 19.9449799 E
40	VirtusLab	Szlak 49, Kraków, 50.071166 N 19.9396229 E
41	Devopsbay	Leśna 1, Kraków, 50.0593664 N 19.8666778 E
42	Britenet	Britenet, Morwowa, Rury Brygidkowskie, Konstantynów, Lublin, województwo lubelskie, 20-701, Polska
43	Kainos	Kainos, Upper Crescent, Queen's Quarter, Belfast, County Antrim, Northern Ireland / Tuaisceart Éireann, BT7 1NZ, United Kingdom
44	CSHARK	-, Kraków, 50.0646501 N 19.9449799 E
45	Islandsbanki	Islandsbanki, 74, Álfheimar, Heimar, Laugardalur, Reykjavíkurborg, Höfuðborgarsvæðið, 104, Ísland
46	Sigma IT Poland	Pawia, Kraków, 50.0685096 N 19.9451979 E
47	hubQuest	ul. leca w ch... z biurem w Krk za to mają biuro w Warszawa przy ul. Jana i Jędrzeja Śniadeckich 10, 52.2213673 N 21.0143475 E
48	dmTECH Polska	ul. leca w ch... z biurem w Krk za to mają biuro w Wrocław przy ul. Jaworska 13, 51.1160673 N 16.9940864 E
49	Ework Group	-, Kraków, 50.0646501 N 19.9449799 E
50	Craftware	-, Kraków, 50.0646501 N 19.9449799 E
51	Rite NRG	Wadowicka, Kraków, 50.0328411 N 19.9385809 E
52	Lite e-Commerce	-, Kraków, 50.0646501 N 19.9449799 E
53	Justpoint	-, Kraków, 50.0646501 N 19.9449799 E
54	Reply Polska Sp. z o. o.	-, Kraków, 50.0646501 N 19.9449799 E
55	IN Team	ul. leca w ch... z biurem w Krk za to mają biuro w Warszawa przy ul. Żwirki i Wigury 16A, 52.1890996 N 20.9829388 E
56	VOLT	Volt, Wolf Point District / šųktógeja oʾípa, Roosevelt County, Montana, United States
57	emagine Polska	Emagine, 28, Wielicka, Kabel, Podgórze, Kraków, województwo małopolskie, 30-554, Polska
58	Haddad Brands Europe	-, Kraków, 48.8575475 N 2.3513765 E
59	CLOUDFIDE	-, Kraków, 50.0646501 N 19.9449799 E
60	Altimetrik Poland	-, Kraków, 50.0646501 N 19.9449799 E
61	Pragmile	Centrum, Kraków, 50.0591121 N 19.9378922 E
62	Kitopi	Lubostroń 1, Kraków, 50.015284 N 19.902203 E
63	Sigmoidal	Starowiślana, Kraków, 50.054804 N 19.9471229 E
64	Plenti	Plenti, 17, Calle Moreto, Jerónimos, Retiro, Madrid, Comunidad de Madrid, 28014, España
65	DO OK S.A.	-, Kraków, 50.0646501 N 19.9449799 E
66	Prime Force	-, Kraków, 50.0646501 N 19.9449799 E
67	GetInData | Part of Xebia	-, Kraków, 50.0646501 N 19.9449799 E
68	NOVOMATIC	Novomatic, Drumul Gării Odăii, Otopeni, Ilfov, 075150, România
69	DCV Technologies	Kapelanka 42A, 30-347, Kraków, 50.0354718 N 19.9247283 E
\.


--
-- TOC entry 3416 (class 0 OID 16431)
-- Dependencies: 225
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (id, code) FROM stdin;
1	PLN
2	USD
3	EUR
\.


--
-- TOC entry 3418 (class 0 OID 16440)
-- Dependencies: 227
-- Data for Name: offer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offer (id, position_id, company_id, category_id, currency_id, source_id, link, seniority, minimum_salary, maximum_salary, summary) FROM stdin;
1	1	1	1	1	1	https://www.pracuj.pl/praca/scala-big-data-engineer-krakow-zablocie-43a,oferta,1003299357	Senior	26880	31920	Projekt zrzesza obszary zarządzania ryzykiem przestępstw finansowych i odpowiada za wdrażanie najefektywniejszych standardów w ich zwalczaniu. W celu identyfikacji tych zagrożeń wykorzystywana jest technologia Big Data, AI oraz GCP (dane z miliardów transakcji w 50 krajach).Rozwiązanie jest tworzone w oparciu o architekturę mikroserwisową.
2	2	2	1	1	1	https://www.pracuj.pl/praca/spark-engineer-krakow-samuela-bogumila-lindego-1c,oferta,1003338612	Senior	7000	19000	Implementacja procesów zasilania i transformacji danych z wykorzystaniem PySpark. Znajomość usług platformy Azure (szczególnie z obszarów Data).Umiejętności algorytmiczne i matematyczne.
3	3	2	1	1	1	https://www.pracuj.pl/praca/data-engineer-krakow-samuela-bogumila-lindego-1c,oferta,1003338610	Senior	7000	19000	
4	4	3	1	1	1	https://www.pracuj.pl/praca/servicenow-data-analyst-krakow,oferta,1003341711	Senior	23520	26880	O projekcieDługofalowa współpraca z międzynarodową, topową firmą consultingową, świadcząca usługi IT dla dużych i średnich firm z różnorodnych sektorów jak automotive, finanse, bankowość czy produkcja. Nasze wymaganiaCo najmniej 3-letnie doświadczenie na stanowisku Data Analyst lub ServiceNow Data Analyst.
5	5	1	1	1	1	https://www.pracuj.pl/praca/senior-mlops-engineer-krakow-zablocie-43a,oferta,1003329906	Senior	31920	36960	O projekcieBędziesz częścią zespołu odpowiedzialnego, za współtworzenie systemu do monitorowania oraz analizowania aktywności, w celu wykrywania potencjalnie podejrzanej działalności. Twój zakres obowiązkówBędziesz odpowiedzialny za opracowywanie i wdrażanie nowych modeli uczenia maszynowego, doskonaleniu istniejących oraz zarządzaniu infrastrukturą modeli produkcyjnych w celu wsparcia i poprawy sposobu działania monitoringu.
6	1	1	1	1	1	https://www.pracuj.pl/praca/scala-big-data-engineer-krakow-zablocie-43a,oferta,1003299357	Senior	26880	31920	Projekt zrzesza obszary zarządzania ryzykiem przestępstw finansowych i odpowiada za wdrażanie najefektywniejszych standardów w ich zwalczaniu. W celu identyfikacji tych zagrożeń wykorzystywana jest technologia Big Data, AI oraz GCP (dane z miliardów transakcji w 50 krajach).Rozwiązanie jest tworzone w oparciu o architekturę mikroserwisową.
7	6	4	1	1	1	https://www.pracuj.pl/praca/lead-data-analyst-krakow,oferta,1003299133	Mid/Regular	21840	30240	O projekcieData analyst responsibilities include conducting full lifecycle analysis to include requirements, activities and design. Proficiency levelSkill in generating queries and reports.
8	7	5	1	1	1	https://www.pracuj.pl/praca/senior-etl-developer-krakow,oferta,1003299046	Senior	25200	30240	Your responsibilitiesCommunicating effectively with senior stakeholdersWork with a team of technologists, ensuring prioritization of tasks and supporting removal of blockers. At least 2 years of experience in Pyspark development; Should be capable of developing/configuring data pipelinesStrong Experience in writing complex SQL queries to perform data analysis on Databases SQL server, Oracle, HIVE etc.
9	8	6	1	1	1	https://www.pracuj.pl/praca/data-analyst-krakow-lekarska-1,oferta,1003327379	Mid/Regular	12000	17000	About the projectWe're a hard-working, fun-loving, get-things-done type of team dedicated to providing unique marketing automation solutions for clients. Ensure visualizations are user-friendly, interactive, and accurately represent the underlying dataPython and ETL Scripting: Apply Python programming skills to enhance data analytics and ETL processes.
10	9	7	1	1	1	https://www.pracuj.pl/praca/software-development-engineer-ii-data-fulfillment-krakow-przy-rondzie-4,oferta,1003297865	Mid/Regular	17000	30000	About the projectThe Fulfillment Data department at Tesco Technology is at the forefront of data processing and order fulfillment within the retail and technology industry. As a Data Engineer, you will collaborate closely with software developers, database architects, data analysts, and data scientists on various data-driven initiatives. Keep our data separated and secureCreate data tools for analytics and data scientist team members that assist them in building and optimising our product into an innovative industry leader.
11	10	8	1	1	1	https://www.pracuj.pl/praca/big-data-engineer-krakow-stoczniowcow-3,oferta,1003349611	Senior	26880	31920	About the projectOur portfolio of complete IoT and location solutions combine hardware, software, and cloud to bring real-time visibility, analytics, and AI to operations. Today, we serve over 2,000 customers across diverse sizes and industries, from transportation and logistics to manufacturing, healthcare, airports, governments and public spaces.
12	11	9	1	1	1	https://www.pracuj.pl/praca/data-reporting-senior-developer-krakow,oferta,1003314817	Senior	21000	24150	About the projectAs a Data & Reporting Senior Developer, you will be working for our client, a global financial institution focused on connecting business processes, data, products, services, and technology. Joining the Data & Architecture Office, you’ll become part of the Developer’s Team, delivering data insights and developing data repositories aligned with bank standards.
13	12	8	1	1	1	https://www.pracuj.pl/praca/database-administrator-krakow-stoczniowcow-3,oferta,1003345261	Senior	20000	28560	About the projectAs a Database Administrator, you will be responsible for the installation, configuration, optimization, and maintenance of our MongoDB and Cassandra database environments. You will play a critical role in ensuring the performance, scalability, security, and reliability of our data infrastructure, working in the DevOps team.
14	13	10	1	1	1	https://www.pracuj.pl/praca/dwh-architect-data-modeling-krakow-lubostron-1,oferta,1003312351	Senior	20000	30000	About the projectWithin our structured data organization, comprising both business domain-focused verticals and technical practice-focused horizontals, we recognize the pivotal role of data modeling in elevating our reporting and analytics practices. Advocate for data modeling depth, rigor, and consistency across the data and business teams, and coach data scientists and engineers on the principles of effective data modeling. Keen on gaining a deep understanding of our business, product, and operations. Experience in designing data pipelines (e.g., AirFlow DAGs), including identifying dependencies, opportunities for abstraction, and performance bottlenecks.
15	14	7	1	1	1	https://www.pracuj.pl/praca/software-development-engineer-ii-data-engineering-forecasting-krakow-przy-rondzie-4,oferta,1003305701	Mid/Regular	17000	30000	About the projectIn Forecasting team, we build products that powers the engine of the Supply Chain that makes sure customers get what products they need when they walk into a Tesco Store or shop through other channels. The more we save, the more we can pass on to our customers w.r.t the right price. We take responsibility for the software through its entire lifecycle. You are comfortable designing systems and reasoning about them.
16	15	11	1	1	1	https://www.pracuj.pl/praca/power-bi-developer-krakow,oferta,1003303535	Senior	13000	24000	About the projectJoin our dynamic team in the modern Krakow office as a Power BI Developer!Your responsibilitiesCrafting, building, and upkeeping reports and dashboards within the PowerBI framework. Generating sophisticated data visualizations to present business insights clearly and accessibly.
17	16	12	1	1	1	https://www.pracuj.pl/praca/data-engineer-in-microsoft-azure-cloud-krakow,oferta,1003320133	Senior	13000	29400	About the projectOur talented Data Engineering team is made up of globally recognized experts - and there’s room for more analytical, innovative, client-driven data professionals. Proficiency in Delta Lake and Databricks for efficient data management. Designing and implementing ETL workflows to ensure data quality and accessibility.
18	10	12	1	1	1	https://www.pracuj.pl/praca/big-data-engineer-krakow-pawia-21,oferta,1003320127	Mid/Regular	120	180	About the projectWe are looking for a seasoned Big Data Engineer to play a pivotal role in our transformational journey. Ensure the security, integrity, and performance of all software applications through rigorous testing and optimization. Provide technical guidance and mentorship to junior team members, fostering a culture of continuous learning and innovation. Our requirementsBachelor's degree in Computer Science, Engineering, or a related field. Stay ahead of the curve, anticipating what lies ahead and adapting to the latest advancements.
19	17	13	1	1	1	https://www.pracuj.pl/praca/senior-data-engineer-krakow-wadowicka-7,oferta,1003340077	Senior	28000	33600	O projekcieDołącz do naszej ekipy Rite NRG jako Senior Data Engineer i stwórz z nami w Polsce centrum dostaw dla lidera branży iGaming. Będziesz miał możliwość rozwijania się w obszarze analizy danych i zarządzania danymi.
20	18	14	2	1	2	https://justjoin.it/offers/bpmriders-power-bi-consultant-krakow	Mid/Regular	9000	12000	
21	1	1	1	1	1	https://www.pracuj.pl/praca/scala-big-data-engineer-krakow-zablocie-43a,oferta,1003299357	Senior	26880	31920	Projekt zrzesza obszary zarządzania ryzykiem przestępstw finansowych i odpowiada za wdrażanie najefektywniejszych standardów w ich zwalczaniu. W celu identyfikacji tych zagrożeń wykorzystywana jest technologia Big Data, AI oraz GCP (dane z miliardów transakcji w 50 krajach).Rozwiązanie jest tworzone w oparciu o architekturę mikroserwisową.
22	2	2	1	1	1	https://www.pracuj.pl/praca/spark-engineer-krakow-samuela-bogumila-lindego-1c,oferta,1003338612	Senior	7000	19000	Implementacja procesów zasilania i transformacji danych z wykorzystaniem PySpark. Znajomość usług platformy Azure (szczególnie z obszarów Data).Umiejętności algorytmiczne i matematyczne.
23	3	2	1	1	1	https://www.pracuj.pl/praca/data-engineer-krakow-samuela-bogumila-lindego-1c,oferta,1003338610	Senior	7000	19000	
24	4	3	1	1	1	https://www.pracuj.pl/praca/servicenow-data-analyst-krakow,oferta,1003341711	Senior	23520	26880	O projekcieDługofalowa współpraca z międzynarodową, topową firmą consultingową, świadcząca usługi IT dla dużych i średnich firm z różnorodnych sektorów jak automotive, finanse, bankowość czy produkcja. Nasze wymaganiaCo najmniej 3-letnie doświadczenie na stanowisku Data Analyst lub ServiceNow Data Analyst.
25	5	1	1	1	1	https://www.pracuj.pl/praca/senior-mlops-engineer-krakow-zablocie-43a,oferta,1003329906	Senior	31920	36960	O projekcieBędziesz częścią zespołu odpowiedzialnego, za współtworzenie systemu do monitorowania oraz analizowania aktywności, w celu wykrywania potencjalnie podejrzanej działalności. Twój zakres obowiązkówBędziesz odpowiedzialny za opracowywanie i wdrażanie nowych modeli uczenia maszynowego, doskonaleniu istniejących oraz zarządzaniu infrastrukturą modeli produkcyjnych w celu wsparcia i poprawy sposobu działania monitoringu.
26	1	1	1	1	1	https://www.pracuj.pl/praca/scala-big-data-engineer-krakow-zablocie-43a,oferta,1003299357	Senior	26880	31920	Projekt zrzesza obszary zarządzania ryzykiem przestępstw finansowych i odpowiada za wdrażanie najefektywniejszych standardów w ich zwalczaniu. W celu identyfikacji tych zagrożeń wykorzystywana jest technologia Big Data, AI oraz GCP (dane z miliardów transakcji w 50 krajach).Rozwiązanie jest tworzone w oparciu o architekturę mikroserwisową.
27	6	4	1	1	1	https://www.pracuj.pl/praca/lead-data-analyst-krakow,oferta,1003299133	Mid/Regular	21840	30240	O projekcieData analyst responsibilities include conducting full lifecycle analysis to include requirements, activities and design. Proficiency levelSkill in generating queries and reports.
28	7	5	1	1	1	https://www.pracuj.pl/praca/senior-etl-developer-krakow,oferta,1003299046	Senior	25200	30240	Your responsibilitiesCommunicating effectively with senior stakeholdersWork with a team of technologists, ensuring prioritization of tasks and supporting removal of blockers. At least 2 years of experience in Pyspark development; Should be capable of developing/configuring data pipelinesStrong Experience in writing complex SQL queries to perform data analysis on Databases SQL server, Oracle, HIVE etc.
29	8	6	1	1	1	https://www.pracuj.pl/praca/data-analyst-krakow-lekarska-1,oferta,1003327379	Mid/Regular	12000	17000	About the projectWe're a hard-working, fun-loving, get-things-done type of team dedicated to providing unique marketing automation solutions for clients. Ensure visualizations are user-friendly, interactive, and accurately represent the underlying dataPython and ETL Scripting: Apply Python programming skills to enhance data analytics and ETL processes.
30	9	7	1	1	1	https://www.pracuj.pl/praca/software-development-engineer-ii-data-fulfillment-krakow-przy-rondzie-4,oferta,1003297865	Mid/Regular	17000	30000	About the projectThe Fulfillment Data department at Tesco Technology is at the forefront of data processing and order fulfillment within the retail and technology industry. As a Data Engineer, you will collaborate closely with software developers, database architects, data analysts, and data scientists on various data-driven initiatives. Keep our data separated and secureCreate data tools for analytics and data scientist team members that assist them in building and optimising our product into an innovative industry leader.
31	10	8	1	1	1	https://www.pracuj.pl/praca/big-data-engineer-krakow-stoczniowcow-3,oferta,1003349611	Senior	26880	31920	About the projectOur portfolio of complete IoT and location solutions combine hardware, software, and cloud to bring real-time visibility, analytics, and AI to operations. Today, we serve over 2,000 customers across diverse sizes and industries, from transportation and logistics to manufacturing, healthcare, airports, governments and public spaces.
61	32	33	2	1	2	https://justjoin.it/offers/qurate-retail-group-gbs-data-scientist	Mid/Regular	9000	11000	Responsibilities: Identify, collect, and integrate data from various sources, such as surveys, HR systems, Operational and Financial metrics, and external benchmarks. Partners with the Workforce Analytics Lead in the design and delivery of advanced visualization techniques.
32	11	9	1	1	1	https://www.pracuj.pl/praca/data-reporting-senior-developer-krakow,oferta,1003314817	Senior	21000	24150	About the projectAs a Data & Reporting Senior Developer, you will be working for our client, a global financial institution focused on connecting business processes, data, products, services, and technology. Joining the Data & Architecture Office, you’ll become part of the Developer’s Team, delivering data insights and developing data repositories aligned with bank standards.
33	12	8	1	1	1	https://www.pracuj.pl/praca/database-administrator-krakow-stoczniowcow-3,oferta,1003345261	Senior	20000	28560	About the projectAs a Database Administrator, you will be responsible for the installation, configuration, optimization, and maintenance of our MongoDB and Cassandra database environments. You will play a critical role in ensuring the performance, scalability, security, and reliability of our data infrastructure, working in the DevOps team.
34	13	10	1	1	1	https://www.pracuj.pl/praca/dwh-architect-data-modeling-krakow-lubostron-1,oferta,1003312351	Senior	20000	30000	About the projectWithin our structured data organization, comprising both business domain-focused verticals and technical practice-focused horizontals, we recognize the pivotal role of data modeling in elevating our reporting and analytics practices. Advocate for data modeling depth, rigor, and consistency across the data and business teams, and coach data scientists and engineers on the principles of effective data modeling. Keen on gaining a deep understanding of our business, product, and operations. Experience in designing data pipelines (e.g., AirFlow DAGs), including identifying dependencies, opportunities for abstraction, and performance bottlenecks.
35	14	7	1	1	1	https://www.pracuj.pl/praca/software-development-engineer-ii-data-engineering-forecasting-krakow-przy-rondzie-4,oferta,1003305701	Mid/Regular	17000	30000	About the projectIn Forecasting team, we build products that powers the engine of the Supply Chain that makes sure customers get what products they need when they walk into a Tesco Store or shop through other channels. The more we save, the more we can pass on to our customers w.r.t the right price. We take responsibility for the software through its entire lifecycle. You are comfortable designing systems and reasoning about them.
36	15	11	1	1	1	https://www.pracuj.pl/praca/power-bi-developer-krakow,oferta,1003303535	Senior	13000	24000	About the projectJoin our dynamic team in the modern Krakow office as a Power BI Developer!Your responsibilitiesCrafting, building, and upkeeping reports and dashboards within the PowerBI framework. Generating sophisticated data visualizations to present business insights clearly and accessibly.
37	16	12	1	1	1	https://www.pracuj.pl/praca/data-engineer-in-microsoft-azure-cloud-krakow,oferta,1003320133	Senior	13000	29400	About the projectOur talented Data Engineering team is made up of globally recognized experts - and there’s room for more analytical, innovative, client-driven data professionals. Proficiency in Delta Lake and Databricks for efficient data management. Designing and implementing ETL workflows to ensure data quality and accessibility.
38	10	12	1	1	1	https://www.pracuj.pl/praca/big-data-engineer-krakow-pawia-21,oferta,1003320127	Mid/Regular	120	180	About the projectWe are looking for a seasoned Big Data Engineer to play a pivotal role in our transformational journey. Ensure the security, integrity, and performance of all software applications through rigorous testing and optimization. Provide technical guidance and mentorship to junior team members, fostering a culture of continuous learning and innovation. Our requirementsBachelor's degree in Computer Science, Engineering, or a related field. Stay ahead of the curve, anticipating what lies ahead and adapting to the latest advancements.
39	17	13	1	1	1	https://www.pracuj.pl/praca/senior-data-engineer-krakow-wadowicka-7,oferta,1003340077	Senior	28000	33600	O projekcieDołącz do naszej ekipy Rite NRG jako Senior Data Engineer i stwórz z nami w Polsce centrum dostaw dla lidera branży iGaming. Będziesz miał możliwość rozwijania się w obszarze analizy danych i zarządzania danymi.
40	18	14	2	1	2	https://justjoin.it/offers/bpmriders-power-bi-consultant-krakow	Mid/Regular	9000	12000	
41	19	15	2	1	2	https://justjoin.it/offers/in4ge-sp-z-o-o--specjalista-ds-baz-danych-oracle-oracle-database-specialist--krakow-data	Mid/Regular	10000	26800	in4ge to spółka z wieloletnim doświadczeniem, należąca do grupy zajmującej się tworzeniem autorskich produktów IT wspierających biznes. Zarządzanie danymi w bazach Oracle, w tym tworzenie, modyfikacja i optymalizacja struktur baz danych. Współpraca z zespołem deweloperskim i administracyjnym w celu zapewnienia efektywnego wykorzystania bazy danych. Poziom wiedzy i kwalifikacje:\nDoświadczenie w pracy z bazami danych Oracle, w tym znajomość Oracle Database 11g, 12c lub nowszych wersji. Umiejętność pracy z narzędziami do zarządzania wersjami danych.
42	3	16	2	1	2	https://justjoin.it/offers/7n-data-engineer-krakow-data	Mid/Regular	20160	25200	O projekciePoszukujemy Data Engineera do współpracy z duńską organizacją z branży usług ratownictwa medycznego i pożarnictwa przemysłowego. Lokalizacja: ZdalnieCzas projektu: 6 miesięcy (z możliwością przedłużenia)Oczekiwania\nwiedza i doświadczenie w technologii chmurowej: Azure Factory, Data Lakes\nznajomość Pythona\nstosowanie dobrych praktyk (np. Zobacz wypowiedź Konsultanta 7N o roli Agenta i możliwościach projektowych.
43	20	17	2	1	2	https://justjoin.it/offers/itds-dynamics-365-agile-business-analyst-krakow-data	Mid/Regular	14500	20000	We are seeking an Agile Business Analyst to join our Digital Quality Management team. You'll play a pivotal role in implementing the Wholesale Servicing strategy globally through Dynamics 365 Cloud.
44	8	18	2	1	2	https://justjoin.it/offers/omni-calculator-data-analyst-krakow-data	Mid/Regular	13000	22000	Omni Calculator is a Polish tech company that helps solve real-life problems using science, numbers, and equations, thus making rational decisions. Role overview: We are looking for a Data Analyst who can bring data-driven insight into everything we do and leverage data to aid business decision-making processes. Responsibilities: \nDesign a data tracking process to ensure that the minimum data set is sufficient to understand user behavior in our platform.
45	21	19	2	1	2	https://justjoin.it/offers/tooploox-machine-learning-engineer-krakow-387828	Mid/Regular	13000	18000	We are Tooploox and we work on projects that improve people’s lives - in line with our mission, we have already changed the way people invest their money, build houses and take care of their health (just take a look at our client portfolio). It would be great if you also have:\nFluency in deep learning/machine learning libraries: scikit-learn, keras, pytorch, tensorflow, etc.
62	33	34	2	1	2	https://justjoin.it/offers/agora-sa-cloud-data-developer-krakow	Mid/Regular	12000	16000	Jesteśmy jedną z największych firm medialnych w Polsce. rocznym doświadczeniem,•\tbardzo dobra znajomość BigQuery oraz Python,•\tzaangażowanie, komunikatywność i proaktywne podejście do realizacji zadań.
46	3	20	2	1	2	https://justjoin.it/offers/masterborn-sp-z-o-o-data-engineer-krakow	Mid/Regular	9000	15000	Meet MasterBorn, a world-class software development company driving success for businesses in FinTech, SportsTech, and MedTech, led by a passionate team committed to client product success. CV/Application check by HR Team\nOrganizational phone call with HR Team (15min)\nSoft-skills interview with HR Team (1h)\nTechnical interview (2h)\nFeedback and decision 🥳\nJoin us and have a real impact on the road to a project’s success!
47	22	21	2	1	2	https://justjoin.it/offers/infinitedata-snowflake-developer-krakow-data	Mid/Regular	15000	25000	Are you looking for an interesting project, but you come across only boring technologies? Or maybe you want to develop yourself in a top solution, but don't know how to start?If you answered yes to at least one of these questions, we have something you will definitely be interested in.
48	3	22	2	1	2	https://justjoin.it/offers/remitly-data-engineer	Mid/Regular	20500	23000	Remitly's vision is to transform lives with trusted financial services that transcend borders. Today, we are reimagining global financial services and building products that extend beyond traditional barriers to give customers access to more of the services they need, no matter where they call home.
49	23	23	2	1	2	https://justjoin.it/offers/trans-eu-group-sa-dataops-engineer-krakow-375285	Mid/Regular	12000	22000	Cześć!Chcesz się rozwijać u jednego z najlepszych pracodawców w Polsce? CI/CD, konteneryzacja)\nZnajomość platformy rozproszonego strumieniowania zdarzeń (rabbitmq, kafka)\nNice to have:\nDoświadczenie z Tableau Server\nUmiejętności devops (terraform)\nCo będzie należało do Twoich codziennych obowiązków?
50	24	24	2	1	2	https://justjoin.it/offers/rits-professional-services-specjalista-hurtowni-danych	Mid/Regular	23520	28560	Jesteśmy RITS i aktualnie poszukujemy Specjalisty Hurtowni Danych, który dołączy do nowego projektu w sektorze energetycznym.
51	25	25	2	1	2	https://justjoin.it/offers/crestt-data-scientist-100-remote-krakow	Mid/Regular	21000	26880	We’re thrilled to announce an exciting opportunity for a seasoned 🌟 Data Scientist 🌟 to become a pivotal part of our dedicated team. Tackle additional project-specific tasks, details of which will be discussed during the interview process. Apply now and join us in shaping the future of finance!
52	3	26	2	1	2	https://justjoin.it/offers/datumo-big-data-engineer-krakow	Mid/Regular	15000	20000	Datumo specializes in providing Big Data and Cloud consulting services to clients from all over the world, primarily in Western Europe, Poland and the USA. Our team members tend to stick around for more than 3 years, and when a project wraps up, we don't let them go - we embark on a journey to discover exciting new challenges for them. Realtime Consumer Data PlatformThe initiative involves constructing a consumer data platform (CDP) for a major Polish retail company. Open-source tools, including a Kubernetes cluster with Apache Kafka, Apache Airflow and Apache Flink, are used to meet specific requirements.
53	26	27	2	1	2	https://justjoin.it/offers/onwelo-sp-z-o-o--data-engineer-databricks--krakow-data	Mid/Regular	14000	18000	Poznaj Onwelo:Onwelo to nowoczesna polska spółka technologiczna, która specjalizuje się w budowaniu innowacyjnych rozwiązań IT dla organizacji z szeregu sektorów na całym świecie. O projekcie:Obecnie do działu Data & Analytics poszukujemy doświadczonego inżyniera, dołączy do naszego zespołu zajmującego się budową nowoczesnej platformy danych opartej o mikroserwisy w środowisku AWS.
54	3	28	2	1	2	https://justjoin.it/offers/sunscrapers-data-engineer-krakow-385181	Mid/Regular	20000	24000	Advance your career with Sunscrapers, a leading force in software development, now expanding its presence in a data-centric environment. Responsibilities include developing data models, building transformations using Python, DBT, and Snowflake, creating automated ETL jobs, enhancing efficiency, and becoming a subject matter expert in the drug discount space for the client team.
55	27	29	2	1	2	https://justjoin.it/offers/qodeca-data-warehouse-developer-krakow	Mid/Regular	19000	23000	Are you a skilled Data Warehouse Developer ready to take the next step in your career? In-depth knowledge of Data Warehouse concepts such as Kimball vs. Inmon methodologies, Datamarts, Enterprise DWH, Star schema, Facts and Dimensions, SCD, etc. Nice-to-Have Skills:\nFamiliarity with other Azure components useful for Data Warehouse solutions. Open Environment: Foster your creativity in an open and collaborative workplace.
56	28	16	2	1	2	https://justjoin.it/offers/7n-sql-bi-developer-krakow	Mid/Regular	23520	26880	About projectCurrently we are looking for SQL BI Developers (Mid/Senior) who will join a team working on projects from MarTech industry. Our Career Development Program offers consultants advisory support in career planning. They are a group of 7N Consultants who consistently and actively share their professional knowledge and expertise. Check out one of our discussion panels here: Does a Scrum Master need a background in programming (in Polish) \nComprehensive and personal project support from one of a 7N Agent.
57	29	30	2	1	2	https://justjoin.it/offers/blazity-nlp-engineer-krakow	Mid/Regular	16000	23000	We’re Blazity - a team of React.js and Next.js experts creating API first products. Develop APIs and SDKs to provide seamless access to the language models for other developers or end-users. Optimize the integration process to ensure efficient utilization of resources. Text Generation: Leverage the generation capabilities of GPT-3 and GPT-4 to develop applications that can produce coherent and contextually relevant text. Apply techniques such as tokenization, lemmatization, and data augmentation to improve the accuracy and robustness of the models. English at C1 level\nStrong understanding of natural language processing concepts, techniques, and algorithms. Knowledge of data preprocessing techniques and tools for NLP, such as tokenization, stemming, and named entity recognition.
58	30	21	2	1	2	https://justjoin.it/offers/infinitedata-dwh-analyst-krakow	Mid/Regular	12000	16000	Let me guess, you are fed up with corporations but still dream of a growth job on exciting projects. You can no longer watch the rat race, you just want to work side by side with the best experts and coding enthusiasts.
59	3	31	2	1	2	https://justjoin.it/offers/opensignal-data-engineer-krakow	Mid/Regular	20000	28000	What you will be doing\nOwn and improve our big data pipelines in AWS Spark. Our mission is to advance connectivity for all and here at Opensignal, the team is leading the industry in enabling operators to link their network experience and market performance in a way that has never before been possible. BenefitsWe believe we are stronger when we not only celebrate our many differences, values, and voices but include them in everyday practice.
60	31	32	2	1	2	https://justjoin.it/offers/scalac-big-data-engineer-spark-hadoop-krakow	Mid/Regular	15000	19000	We're looking for Big Data Engineer with Spark and Hadoop who will be working on an external project in the fintech area. Ensure the high quality of the delivered software code. Must-haves in the technology stack: \nAt least 3 years of experience with Scala.
63	34	7	2	1	2	https://justjoin.it/offers/tesco-technology-data-engineer-fulfillment-krakow	Mid/Regular	20000	30000	Company DescriptionTesco Technology is multi-functional and specialist team that drives operational excellence of services improves scale for our systems and processes globally and creates business leading capabilities. As Tech Hub we cooperate within the group of Tesco Technology Hubs located in the UK, Poland, Hungary, and India. As we continue to expand, we are actively seeking a skilled Data Engineer to join our team of analytics experts. In this role, you will take charge of expanding and refining our data and data pipeline architecture. This role calls for a high level of self-direction and the ability to effectively support the data requirements of multiple teams, systems, and products. Tesco is committed to celebrating diversity and everyone is welcome at Tesco.
64	35	35	2	1	2	https://justjoin.it/offers/limango-polska-experienced-machine-learning-engineer-krakow	Mid/Regular	16000	19000	Language classes in English and German, tailored to your skill level. Co-finance of Multi-sport cardOffice located in the vibrant center of Wrocław, with nearby amenities including cinemas, fitness clubs, and a variety of lunch options.
65	14	7	2	1	2	https://justjoin.it/offers/tesco-technology-software-development-engineer-ii-data-engineering-forecasting	Mid/Regular	18500	26000	Company DescriptionTesco is a leading multinational retailer, with more than 330 000 colleagues. This helps keep our operational costs in control and helps the bottom line. The more we save, the more we can pass on to our customers w.r.t the right price. Continuously improve yourself and your team by suggesting and helping implement new Engineering processes and practices. We love working from home, but we also love connecting, collaborating and innovating with our colleagues in person. As a Disability Confident Employer, we’re committed to providing a fully inclusive and accessible recruitment process, allowing candidates the opportunity to thrive and inform us of any reasonable adjustments they may require.
66	36	36	2	1	2	https://justjoin.it/offers/blockwise-specjalista-ka-ds-web-scrapingu-krakow-data	Mid/Regular	16000	22000	🏙️ Firma Blockwise to dynamiczny startup technologiczny, który specjalizuje się w obszarze sztucznej inteligencji oraz technologii blockchain. W chwili obecnej, nasza firma przechodzi przez intensywny etap rozwoju, co stwarza fascynujące możliwości kariery dla osób, które chcą dołączyć do rozwijającego się zespołu. Biegłości w korzystaniu z narzędzi do web scrapingu i platform automatyzacji. Zdolności do rozwiązywania problemów i efektywnej komunikacji. Elastyczność i zdolność szybkiego przystosowywania się do zmieniających się zadań.
67	37	21	2	1	2	https://justjoin.it/offers/infinitedata-azure-platform-manager-krakow-data	Senior	20000	32000	Let me guess, you are fed up with corporations but still dream of a growth job on exciting projects. You can no longer watch the rat race, you just want to work side by side with the best experts and coding enthusiasts.
68	17	37	2	2	2	https://justjoin.it/offers/n-ix-senior-data-engineer-krakow	Senior	6000	6600	(#1295)Our Client is an OVO Group, a big family of companies united by a single vision: to get to zero carbon, fast. Developing a segmentation solution framework to rebuild the current solution together with a team of TS(JS) engineers.
69	38	38	2	3	2	https://justjoin.it/offers/devsdata-llc-senior-data-engineer-krakow-377876	Senior	5800	10000	Senior Data Engineer\n💰 70K to 120K EUR/year\n🌎 100% remote work in Europe/hybrid in London \n☑️ Full-time\n\n🕦 B2B\nDo you want to expand your career path and work on creating ground-breaking technology? We're looking for a person who will join us as a Senior Data Engineer!
70	17	22	2	1	2	https://justjoin.it/offers/remitly-senior-data-engineer-krakow-data	Senior	22000	26000	Remitly's vision is to transform lives with trusted financial services that transcend borders. Today, we are reimagining global financial services and building products that extend beyond traditional barriers to give customers access to more of the services they need, no matter where they call home.
71	39	39	2	3	2	https://justjoin.it/offers/sporty-group-senior-dba-krakow-387012	Senior	3500	6000	We leverage the power of high quality data to strengthen and equip our enterprise. As we are a highly structured and established company we are able to offer the security and support of a global business with the allure of a startup environment.
72	40	40	2	1	2	https://justjoin.it/offers/virtuslab-software-engineer---data-platforms-principal--krakow-data	Senior	30000	37000	We are #VLteam - tech enthusiasts constantly striving for growth. The team is our foundation, that's why we care the most about the friendly atmosphere, a lot of self-development opportunities and good working conditions.. Trust and autonomy are two essential qualities that drive our performance. What matters most is your passion and willingness to develop. What’s more, we refund up to 1,000 PLN (per quarter) for learning the English language. Training Package - use our training budget and 24 paid work hours for your development. Building tech community - we run 9 meetup groups in Kraków, Kielce, and Rzeszów and support many other local initiatives.
73	41	41	2	1	2	https://justjoin.it/offers/devopsbay-senior-data-scientist-krakow-data	Senior	25200	36960	As a Senior Data Scientist, you will play a critical role in driving our applied AI/ML strategy to optimize our commercial lines insurance operations. Design and implement machine learning algorithms and artificial intelligence techniques to automate and optimize operational processes, such as prospect identification, policy assessment and evaluation, claims management and client insight presentation. Provide guidance and mentorship to analysts and data engineers, promoting knowledge sharing and skill development within the team. Leadership qualities and the ability to guide and mentor junior team members and more senior stakeholders and peers.
74	42	42	2	1	2	https://justjoin.it/offers/britenet-data-engineer-snowflake-krakow	Senior	21800	26800	Imprezy integracyjne – Duże, wewnętrzne konferencje technologiczne, kilkudniowe imprezy integracyjne jesienią, przyjęcia gwiazdkowe oraz wyjścia zespołowe. Komfort pracy – Atrakcyjnie urządzone strefy relaksu, dostępne w największych oddziałach firmy, zachęcające do odpoczynku w ciągu dnia oraz wyposażone kuchnie z aromatyczną kawą. Wspieranie aktywności – Mamy drużyny piłki nożnej, rozgrywamy mistrzostwa, mamy na pokładzie maratończyków i innych aktywnych wielbicieli sportu.
86	51	50	2	1	2	https://justjoin.it/offers/craftware-oracle-apex-developer-krakow-data	Senior	21000	26880	Jesteśmy pionierami technologii Salesforce w Polsce. rozwiązywanie konfliktów)\nW Craftware będziesz miał możliwość zdobycia nowej wiedzy i doświadczenia dzięki międzynarodowym projektom i dostępowi do wielu szkoleń.
75	43	43	2	1	2	https://justjoin.it/offers/kainos-data-solution-architect-krakow-data	Senior	24000	40000	We work remotely in Kainos but we might require you to visit our Gdansk office occasionally for team activities or company events. You will be a quality orientated pragmatist, where you balance trade-offs to successfully deliver complex solutions. Making a significant contribution to the data community and wider data capability. Managing, coaching and developing a small number of staff, with a focus on managing employee performance and assisting in their career development. Requirements:\nExperience of leading multiple teams as the data solution architect, with ownership of a system of systems. Experience of deploying data-processing platforms from vendors such as AWS, Azure, GCP, Databricks.
76	44	44	2	1	2	https://justjoin.it/offers/cshark--net-developer-with-python-skills-krakow-data	Senior	23500	28500	We are currently looking for an Engineer experienced with .NET as well as in the field of data engineering. Handling a broad range of tasks from data aggregation and database schema definition to the implementation of APIs and ETL processes. Ensuring code quality and maintainability through comprehensive unit testing, integration testing, and code reviews. The Essentials We’re Seeking\nMore than 4 years of programming experience. Familiarity with software development methodologies (e.g., Agile, Scrum) and best practices in code organization, documentation, and code review. However, we count on your openness to occasionally visit the office for team meetings or client visits, or possible occasional trips to the client's headquarters.
77	45	45	2	1	2	https://justjoin.it/offers/islandsbanki-database-architect-oracle-sql-server-krakow	Senior	24000	26000	Database Architect (Oracle + SQL Server)We are seeking a highly skilled and experienced Oracle and SQL Server Architect to join our team. This role is crucial for leading our database strategy and ensuring the integrity, security, and availability of database services. Provide mentorship and technical leadership to database administrators and developers. What do we offer?Self-development:\nUpskilling trainings\nUp to 10% of your week dedicated to self-development\nConference and education budget – you name events!
78	46	46	2	1	2	https://justjoin.it/offers/sigma-it-poland-business-intelligence-engineer-with-azure-and-power-bi-krakow-data	Senior	18500	23500	Sigma IT Poland is a division within NEXER GROUP - a custom software development company. This person will be part of the analytics team of a top Scandinavian manufacturer, working with the latest advanced technology. Our client is a world leader in outdoor products for forest, park and garden maintenance, as well as equipment for the light construction industry.
79	32	38	2	2	2	https://justjoin.it/offers/devsdata-llc-data-scientist-krakow	Senior	5400	7500	Data Scientist\n💰 Salary: 65-90k USD/year\n🌎 100% Remote\n🕦 Full-time position \n☑️ B2B contract\nWe are looking for a Data Scientist who is excited about automating data science. Serve as a trusted advisor to customers, offering consultations on data science best practices and advising on new use case discovery to expand our impact in the customer's analytics landscape. We work 100% remotely, in an international team, including people from Asia, London, or San Francisco.
80	41	47	2	1	2	https://justjoin.it/offers/hubquest-senior-data-scientist-krakow-data	Senior	28500	37000	We are a team of experts, bringing together the best talents in IT and analytics. The Global Analytics team is a diverse collective of Data Scientists, Data Engineers, Business Intelligence Specialists, and Analytics Translators, with footprints across three continents and five countries. Together, we're committed to transforming whole organization into a leader in data-driven decision-making, leveraging global diversity to tackle challenges and create value.
81	47	44	2	1	2	https://justjoin.it/offers/cshark-power-platform-developer-krakow-data	Senior	23500	30000	Currently, we are looking for a Power Platform Developer with a strong understanding of creating Canvas and Model-driven applications on Dataverse. IN SHORT🌎 100% REMOTELY or from one of our 2 offices💰 140 - 180 zł/h☑️ B2B contract💻 minimum 3 years of experience in Power PlatformIf you value quality work, attention to detail, and a desire to expand your knowledge, CSHARK is a good choice for you! # Customizing the Microsoft Sustainability Manager program to meet ESG requirements. We have a close-knit team and we make sure to have regular integrations - we often go out to celebrate together. We have a flat structure - we are not a corporation and don't want to be one 🙃.
82	48	48	2	1	2	https://justjoin.it/offers/dmtech-polska-senior-data-scientist-z-j-niemieckim-krakow	Senior	10800	21000	dmTECH to międzynarodowy zespół ponad tysiąca ekspertek i ekspertów z różnych obszarów IT i technologii wspierających e-commerce pracujących dla dm – jednej z największych sieci drogerii w Europie. Aktualnie w dmTECH poszukujemy kandydata na stanowisko Senior Data Scientist z j.niemieckim Projekt:Nie chcemy tylko zachęcać naszych klientów do kupowania coraz więcej bez żadnego sensu. Praca zdalna to u nas standard \n\nPracę w międzynarodowych zespołach, z możliwością podszkolenia znajomości języków: niemieckiego i angielskiego \n\nSamodzielność i decyzyjność w codziennej pracy. Chcesz dowiedzieć się o tym, jak się u nas pracuje?
83	49	48	2	1	2	https://justjoin.it/offers/dmtech-polska-senior-data-engineer-z-j-niemieckim-krakow-data	Senior	10800	21000	dmTECH to międzynarodowy zespół ponad tysiąca ekspertek i ekspertów z różnych obszarów IT i technologii wspierających e-commerce pracujących dla dm – jednej z największych sieci drogerii w Europie. Przygotowywane przez nas rozwiązania każdego dnia wspierają technologicznie pracowników i klientów drogerii, sklepu internetowego oraz aplikacji mobilnej w 14 krajach. To także możliwość uczenia się od Twoich koleżanek i kolegów w ramach codziennej pracy \n\nSwobodę w decydowaniu o czasie i miejscu pracy.
84	50	40	2	1	2	https://justjoin.it/offers/virtuslab-data-platform-engineer-expert-krakow	Senior	26000	31000	We are #VLteam - tech enthusiasts constantly striving for growth. The team is our foundation, that's why we care the most about the friendly atmosphere, a lot of self-development opportunities and good working conditions.. Trust and autonomy are two essential qualities that drive our performance. You’ll lead innovation, swiftly test and validate new concepts, and integrate them, ensuring team collaboration. What matters most is your passion and willingness to develop. What’s more, we refund up to 1,000 PLN (per quarter) for learning the English language. Training Package - use our training budget and 24 paid work hours for your development. Building tech community - we run 9 meetup groups in Kraków, Kielce, and Rzeszów and support many other local initiatives.
85	17	49	2	3	2	https://justjoin.it/offers/ework-group-senior-data-engineer-krakow-359548	Senior	7200	8800	We are seeking a skilled and experienced Data Engineer to join our client (pharmaceutical area) team. The Data Engineer will be responsible for designing, building, and maintaining the data infrastructure that supports our organization's data needs.
87	52	37	2	2	2	https://justjoin.it/offers/n-ix-data-architect-data-unit-krakow	Senior	9000	10000	N-iX is looking for an experienced and mature Data Architect to participate in projects with cutting-edge technologies. Responsibilities:\nServe as a primary technical expert of the data platform and reporting teams creating data solutions. Provide guidance and technical expertise to development teams in implementing data solutions, ensuring compliance with best practices and industry standards. Proven hands-on experience with Snowflake and DBT\nExtensive knowledge of relational and non-relational databases, data warehouses, ETL/ELT processes, and data management tools.
88	17	51	2	1	2	https://justjoin.it/offers/rite-nrg-senior-data-engineer-krakow-data	Senior	28000	33600	Dołącz do naszej ekipy Rite NRG jako Senior Data Engineer i stwórz z nami w Polsce centrum dostaw dla lidera branży iGaming. Będziesz miał możliwość rozwijania się w obszarze analizy danych i zarządzania danymi.
89	17	52	2	1	2	https://justjoin.it/offers/lite-e-commerce-senior-data-engineer-krakow-387167	Senior	22000	28000	So far, we have created two products in the Polish market. At Lite e-Commerce, we create cutting-edge technologies that will make your life easier.
90	53	16	2	1	2	https://justjoin.it/offers/7n-program-manager-with-bi-experience--krakow-data	Senior	28560	31920	For over 30 years of operation we have proven that a clear and transparent financial model, collaboration exclusively with experts in their respective fields, and taking good care of them, comprise the best possible IT consulting model. You will be working within a geographically dispersed team in Agile methodology. Develop advanced reports and analysis using data gathered from various systems. Oversee the process of developing and deploying solutions based on PowerBI. Collaborate with the development team to ensure optimal performance and functionality of the tool. We offer\n\nFinancial transparency: the salary is: 28 560 – 31 920 PLN (170 – 190 PLN/h) + VAT\n\n\nClear wage model. Check out one of our discussion panels here: Does a Scrum Master need a background in programming (in Polish) \nComprehensive and personal project support from one of a 7N Agent.
91	54	53	2	2	2	https://justjoin.it/offers/justpoint--remote-lead-data-analyst-krakow-data	Senior	5000	7000	About JustpointAt Justpoint, we're more than just a company; we're a community driven by passion, integrity, and a commitment to ensuring safety and well-being for all. Through collective action of those already harmed, we initiate lawsuits, acting to remove them from the market and ensuring the swift protection of consumers. About the roleAs a Lead Data Analyst you will cooperate closely with the executive team on strategic analytical problems. About youYou are empathetic, ambitious, passionate about your work, need to have an impact on the world and you work hard to achieve your goals.
92	17	31	2	1	2	https://justjoin.it/offers/opensignal-senior-data-engineer-krakow	Senior	25000	34000	What you will be doing\nOwn and improve our big data pipelines in AWS Spark. Our mission is to advance connectivity for all and here at Opensignal, the team is leading the industry in enabling operators to link their network experience and market performance in a way that has never before been possible. BenefitsWe believe we are stronger when we not only celebrate our many differences, values, and voices but include them in everyday practice.
93	55	54	2	1	2	https://justjoin.it/offers/reply-polska-sp-z-o-o-senior-oracle-siebel-developer-krakow	Senior	22000	28000	You can choose medical care package, meal tickets, sports cards (we have Multisport and on preferential terms, we have membership cards to one of the most popular Gyms), cinema tickets, shop vouchers, discounts and many more. Knowing that Customer Experience (CX) in the digital area must be highly flexible to be adapted to different industries and markets.
94	56	55	2	1	2	https://justjoin.it/offers/in-team-postgresql-administrator-krakow-data	Senior	23520	26880	W IN Team poszukujemy PostgreSQL Administratora w projekcie globalnej skali platformy gier i loterii. dofinansujemy Twój pakiet medyczny oraz kartę sportową Multisport
95	17	26	2	1	2	https://justjoin.it/offers/datumo-senior-data-engineer-krakow	Senior	20000	30000	Datumo specializes in providing Big Data and Cloud consulting services to clients from all over the world, primarily in Western Europe, Poland and the USA. Our team members tend to stick around for more than 3 years, and when a project wraps up, we don't let them go - we embark on a journey to discover exciting new challenges for them. Realtime Consumer Data PlatformThe initiative involves constructing a consumer data platform (CDP) for a major Polish retail company. Open-source tools, including a Kubernetes cluster with Apache Kafka, Apache Airflow and Apache Flink, are used to meet specific requirements.
96	57	56	2	1	2	https://justjoin.it/offers/volt-senior-php-software-engineer-krakow-362575	Senior	20500	26000	About VoltVolt is revolutionising how people pay online, globally. If you want to work in a company with a great, start-up atmosphere, you don’t have to look further :)\nAt Volt, diversity and inclusion are integral to our culture. Our mission is to transform the payments industry and this is only possible through the power of our diverse and talented team. Join us in making real-time payments accessible for all.
97	17	28	2	1	2	https://justjoin.it/offers/sunscrapers-senior-data-engineer-krakow-387071	Senior	30000	40000	Advance your career with Sunscrapers, a leading force in software development, now expanding its presence in a data-centric environment. Nice to have:\nExperience with BigQuery, SIGMA\nExperience in venture capital data operations\nFamiliarity with data visualization tools (e.g. Looker, Tableau, PowerBI, or similar), CRM (Salesforce), automation tools (Zapier)\nBenefitsWhat do we offer?
98	27	57	2	1	2	https://justjoin.it/offers/emagine-polska-data-warehouse-developer-krakow	Senior	22400	27200	INFORMACJE O PROJEKCIE:\n\nBranża: energetyka\n\nLokalizacja: 100% zdalnie\n\nWspółpraca typu: B2B\n\nStawka: do 170 PLN/h + VAT na B2B\nZADANIA:\nRozwój i utrzymanie hurtowni danych.
99	58	58	2	1	2	https://justjoin.it/offers/haddad-brands-europe-functional-d365-administrator-partly-in-paris-krakow	Senior	22000	35000	The work is divided into: roughly 3 months remote in Poland, 3 weeks stationary in the Paris office. The candidate must have prior experience with technologies such as Dynamics, D365 Financial, etc. The candidate should possess excellent communication skills, curiosity, and agility.
111	67	64	2	1	2	https://justjoin.it/offers/plenti-etl-python-backend-developer-krakow	Senior	35700	39900	Hi!We are seeking an experienced ETL Developer with advanced Python for our client in the finance industry. This role offers a greenfield opportunity to construct a data warehouse and integrate it with a Snowflake-based system.
100	59	59	2	1	2	https://justjoin.it/offers/cloudfide-business-intelligence-power-bi-developer-krakow-386118	Senior	11500	25000	ABOUT USAt CLOUDFIDE, we do everything with data and contribute to pivotal projects for Fortune 500 companies. This is your chance to enhance your skills and leave your global footprint. YOU AREBusiness Intelligence (BI) Developer, motivated and detail-oriented, with a knack for turning complex data into clear, actionable insights. Python coding experience - you're our code whisperer! Familiarity with public cloud architecture, security, networking concepts (MS Azure preferred) - we like our clouds secure and efficient. BENEFITS: Employee benefits program, certification opportunities. EQUAL OPPORTUNITY CLOUDFIDE is an Equal Opportunity Employer.
101	60	58	2	1	2	https://justjoin.it/offers/haddad-brands-europe-power-bi-developer-partly-in-paris-krakow	Senior	20000	27000	The work is divided into: roughly 3 months remote in Poland, 3 weeks stationary in the Paris office. MONITORING• Coordinates with various resources within the IT department related to their domain. • The candidate must master Microsoft BI technologies, especially Power BI.
102	61	60	2	1	2	https://justjoin.it/offers/altimetrik-poland-senior-data-architect-krakow-378921	Senior	22000	28000	In an agile way, we deliver bite-size outcomes to enterprises and startups from all industries, to help them scale and accelerate their businesses. We are looking for a Senior Data Architect to join our team!Your role in the project:\nData Source Discovery: \nLead efforts to identify and discover relevant data sources within the organization. Develop strategies and processes to efficiently discover and onboard new data sources to enrich the organization's assets. Strong understanding of data warehousing concepts, ETL processes, and data integration patterns. Familiarity with data governance frameworks and practices. … then we are looking for you!We work 100% remotely or from our hub in Wrocław.🔥We grow fast.🤓We learn a lot.🤹We prefer to do things instead of just talking about them.
103	3	61	2	1	2	https://justjoin.it/offers/pragmile-data-engineer-krakow-385693	Senior	23520	26880	Pragmile is running an innovative research & development project for a large Polish institution which should result in a unique solution to monitor media market. We're looking for an experienced engineer who could support us in the successful execution and delivery.
104	62	7	2	1	2	https://justjoin.it/offers/tesco-technology-software-development-engineer-0bee35df-4bc7-4c4a-8bee-331cf10b6446	Senior	26000	40000	About the Tesco Technology - Forecasting teamIn Demand Forecasting, we build products that powers the engine of Supply Chain that makes sure customers get what products they need when they walk into a Tesco Store or shop through other channels. Contribute to the definition of features for services owned by your team. Continuously improve yourself and your team by suggesting and helping implement new Engineering processes and practices. We love working from home, but we also love connecting, collaborating and innovating with our colleagues in person. Tesco is committed to celebrating diversity and everyone is welcome at Tesco.
105	63	38	2	2	2	https://justjoin.it/offers/devsdata-llc-tableau-developer-remote-40-h-parttime-8h-week-krakow	Senior	5000	6600	We work 100% remotely, in an international team, including people from Asia, London, or San Francisco. We employ people with experience in international corporations as well as students of the best technical and business universities.
106	64	62	2	1	2	https://justjoin.it/offers/kitopi-senior-data-analyst-krakow	Senior	15000	17500	Kitopi is the world's leading tech-powered multi-brand restaurant, on a mission to satisfy global appetites. As a Senior Data Analyst at Kitopi, you'll play a crucial role in leveraging data to drive strategic decision-making and deliver impactful insights. Identify growth opportunities, optimize menu and product performance, and execute impactful marketing campaigns. Apply advanced statistical analysis techniques to derive insights and evaluate options. Develop frameworks for measuring initiative success and communicating findings effectively to technical and non-technical audiences using data visualization tools. Bachelor's degree in computer science, Mathematics, Statistics, Economics, or related field. Minimum of 5 years of experience in analytics and reporting, preferably with a focus on growth-related analytics. Familiarity with marketing concepts and A/B testing methodologies is necessary for optimizing marketing initiatives and driving data-informed decision-making. Demonstrated ability to collaborate with cross-functional teams, manage multiple priorities, and adapt to a fast-paced environment is crucial.
107	13	62	2	1	2	https://justjoin.it/offers/kitopi-dwh-architect-data-modelling	Senior	20000	25000	Kitopi is the world's leading tech-powered multi-brand restaurant, on a mission to satisfy global appetites. Establish data modeling and naming standards that promote consistency and best practices across the data warehouse and communicate these standards effectively to the broader data team. Work with members of the data team to design data models that effectively measure performance and capture the performance drivers for the various business processes in our complex business. Advocate for data modeling depth, rigor, and consistency across the data and business teams, and coach data scientists and engineers on the principles of effective data modeling. What Are We Looking For:\nAt Kitopi, we value alignment with our mission and principles. 3+ years of experience in data modeling at a high-growth consumer product company or similar. Deep familiarity with relevant technologies is a plus.
108	65	57	2	1	2	https://justjoin.it/offers/emagine-polska-data-engineer-with-aws-krakow	Senior	22000	32000	You will collaborate closely with Agile teams, business partners, and stakeholders to drive the development and improvement of Manufacturing Intelligence (MI) products. Possess proficiency in building CI/CD pipelines and coding/scripting skills (Bash, Python, or similar). Have hands-on experience with AWS services such as Lambda, Glue, IAM, Kinesis, MKS, Step Functions, DMS, RDS, Managed Grafana, SNS, S3, CloudWatch, etc.
109	66	63	2	2	2	https://justjoin.it/offers/sigmoidal-machine-learning-engineer-nlp--krakow-data	Senior	7000	9500	Hey!Are you ready to unleash your genius and make an impact like never before? Utilize your expertise in implementing a custom approach to topic modeling. Take part in the fine-tuning and pre-training of language models like GPT or BERT, specifically tailored to address various NLP tasks.
110	3	59	2	1	2	https://justjoin.it/offers/cloudfide-data-engineer-krakow-365175	Senior	21800	30240	ABOUT USAt CLOUDFIDE, we do everything with data and contribute to pivotal projects for Fortune 500 companies. Our collaborative culture champions your professional growth. Conceptual and analytical skills - the ability to define, analyze and document complex business and technical requirements. HERE'S WHY YOU'LL LOVE CLOUDFIDE\n\nFLEXIBILITY: Enjoy the freedom of working from anywhere, and have a genuine say on our tools, tech, and solutions. COLLABORATION: Be part of our diverse, passionate team, where every voice matters. EQUAL OPPORTUNITY CLOUDFIDE is an Equal Opportunity Employer.
112	68	65	2	1	2	https://justjoin.it/offers/do-ok-s-a--pl-pgsql-developer-with-python-krakow-data	Senior	18000	22000	We are looking for a seasoned PL/pgSQL Developer with Python, someone who’s open-minded. If you like advising clients on possible technical solutions and are interested in deep architecture work, come work with us on more ambitious, opinionated, and performant solutions.
113	69	66	2	1	2	https://justjoin.it/offers/prime-force-operations-specialist-architect-krakow-data	Senior	18000	27000	We are looking for an Operations Specialist / Architect to join our project team. The system you would work on is built on top of MongoDB, OpenSearch, and Kafka, and deployed in a Kubernetes environment.
114	70	7	2	1	2	https://justjoin.it/offers/tesco-technology-senior-data-engineer-fulfillment	Senior	26000	40000	Company DescriptionTesco Technology is multi-functional and specialist team that drives operational excellence of services improves scale for our systems and processes globally and creates business leading capabilities. We are an agile team of an industry-leading team of engineers. As Tech Hub we cooperate within the group of Tesco Technology Hubs located in the UK, Poland, Hungary, and India. Managing critical data related to customer orders, suppliers, and products to ensure the seamless flow of our fulfillment operations. If you're excited about optimizing our data architecture for the future, we encourage you to apply and shape the future of our data operations.
115	71	67	2	1	2	https://justjoin.it/offers/getindata-part-of-xebia-senior-data-engineer-flink-krakow-387348	Senior	26880	33600	👩‍💻 👨‍💻 GetInData | Part of Xebia is a leading data company working for international Clients, delivering innovative projects related to Data, AI, Cloud, Analytics, ML/LLM, and GenAI. Our Clients are both fast-growing scaleups and large corporations that are industry leaders. Data & AI projects that we run and the company's philosophy of sharing knowledge and ideas in this field make GetInData | Part of Xebia not only a great place to work but also a place that provides you with a real opportunity to boost your career. Certifications\nCo-financing sport card\nCo-financing health care\nAll equipment needed for work
116	72	28	2	1	2	https://justjoin.it/offers/sunscrapers-senior-data-engineer-analyst-krakow-data	Senior	30000	40000	Are you ready to take on the challenge?We're looking for a Senior Data Engineer/Analyst to join our team in Warsaw or remotely. Join us in our mission to help clients grow and innovate through a comprehensive tech stack and robust data-related projects.
117	73	68	2	1	2	https://justjoin.it/offers/novomatic-business-intelligence-developer-krakow	Senior	11500	23000	Nasz zespół BI Developerów na co dzień zajmuje się efektywnym pozyskiwaniem i transformowaniem danych w odpowiedzi na wymagania i zapotrzebowanie Klienta. Nasze dzisiejsze wyzwania, to poszukiwanie korelacji pomiędzy danymi z różnych źródeł, wzbogacanie ich o wymiary dotąd nie uznawane za interesujące, umiejętne wykorzystanie ML i innych zaawansowanych technik analizy.
118	74	69	2	1	2	https://justjoin.it/offers/dcv-technologies-senior-data-engineer-big-data-engineer-hybrid-krakow	Senior	22280	25400	Willingness to learn and quick to adapt to changing requirements. Experienced in analysing business requirements and turning them into effective functional solutions.
\.


--
-- TOC entry 3419 (class 0 OID 16473)
-- Dependencies: 228
-- Data for Name: offer_skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offer_skill (offer_id, skill_id) FROM stdin;
20	1
20	2
20	3
20	4
20	5
20	6
40	3
40	2
40	1
40	4
40	6
40	5
41	7
41	8
41	9
42	10
42	11
42	12
42	13
43	14
43	15
43	16
43	17
43	18
43	19
43	20
44	21
44	22
44	23
44	24
44	25
44	26
44	27
45	10
45	28
45	29
46	30
46	14
46	23
46	31
46	10
47	23
47	32
47	10
47	33
47	30
48	34
48	35
48	21
48	36
48	10
48	37
48	38
48	39
48	40
48	41
49	10
49	42
49	33
49	36
50	43
50	23
50	3
50	30
50	44
51	45
51	28
51	11
51	46
52	47
52	48
52	10
52	34
52	35
52	39
52	49
52	13
52	50
52	33
53	10
53	13
53	51
53	36
53	23
53	11
53	39
53	52
54	23
54	10
54	53
54	30
54	54
54	55
54	12
54	39
54	33
55	56
55	57
55	58
56	59
56	14
56	23
56	3
56	60
56	61
56	43
56	30
57	62
57	63
57	10
57	64
57	65
57	66
57	67
57	28
57	68
57	69
58	23
58	70
58	32
58	71
58	33
58	10
59	23
59	52
59	35
59	10
59	72
59	34
59	49
60	47
60	73
60	34
61	74
61	75
61	76
61	77
61	10
61	78
61	14
61	23
61	28
62	41
62	10
62	79
62	50
62	80
63	34
63	73
63	52
63	50
64	23
64	10
64	81
64	11
64	28
65	10
65	52
65	11
65	82
65	35
65	73
66	83
66	84
66	85
66	86
66	87
66	88
66	23
66	10
66	63
66	28
67	89
67	57
67	90
67	91
67	33
67	23
67	2
67	32
67	92
67	93
68	56
68	48
68	10
68	30
69	10
69	23
69	94
70	10
70	21
70	34
70	36
70	35
70	37
70	38
70	40
70	39
70	41
71	95
71	96
71	97
71	10
71	98
71	99
72	47
72	100
72	101
72	23
72	102
72	103
72	14
72	51
73	10
73	28
73	49
73	23
73	50
73	36
73	33
73	104
74	105
74	23
74	10
74	33
75	56
75	34
75	72
75	79
75	36
75	13
75	12
76	106
76	107
76	108
76	11
76	10
77	109
77	110
77	111
77	112
77	113
77	114
77	115
78	116
78	117
78	2
78	118
78	57
78	15
78	42
78	5
78	33
78	89
79	45
79	23
79	10
80	119
80	10
80	28
80	62
80	74
81	120
81	2
81	121
81	122
81	123
82	124
82	72
82	35
82	10
82	125
82	79
83	124
83	72
83	79
83	125
83	35
83	10
84	47
84	100
84	101
84	102
84	51
84	14
84	23
84	103
85	33
85	36
85	10
85	23
85	30
85	52
85	126
85	72
85	94
85	39
86	127
86	128
86	87
86	23
86	112
86	42
87	36
87	33
87	10
87	109
87	129
88	15
88	130
88	36
88	23
88	33
88	10
89	131
89	23
89	50
89	10
89	55
89	39
90	2
90	132
90	133
90	134
91	62
91	23
91	10
91	45
92	23
92	35
92	52
92	10
92	72
92	34
92	49
92	54
93	135
93	136
93	111
93	23
93	72
94	104
94	14
95	48
95	35
95	10
95	49
95	52
95	34
95	33
95	50
95	13
95	39
96	137
96	138
96	23
96	139
96	140
96	126
96	36
96	141
97	10
97	142
97	33
97	23
97	14
97	143
97	49
97	41
97	144
97	145
98	56
98	4
98	23
98	43
98	115
98	146
98	44
98	147
99	14
99	148
99	149
99	150
99	151
99	4
99	152
100	153
100	10
100	23
100	13
100	1
100	154
100	155
100	57
100	156
101	14
101	2
101	148
101	151
101	150
101	149
101	4
101	152
102	10
102	93
102	126
102	34
102	157
102	14
102	158
102	23
103	21
104	52
104	11
104	10
104	35
104	82
104	73
104	159
104	49
105	23
105	105
106	31
106	14
106	160
106	161
106	162
106	163
106	10
106	23
106	164
107	31
107	45
107	107
107	84
107	56
107	165
107	15
107	14
108	10
108	126
108	21
108	36
108	56
108	166
109	10
109	167
109	63
109	28
109	45
109	168
110	10
110	60
110	23
110	169
110	170
110	13
110	171
110	47
111	37
111	30
111	56
111	10
111	36
112	172
112	173
112	10
112	174
112	175
112	166
112	176
112	177
113	178
113	96
113	179
113	180
113	109
113	181
113	177
113	12
113	51
114	34
114	73
114	52
114	50
114	51
115	182
115	183
115	48
115	184
115	49
115	47
116	23
116	10
116	185
116	36
116	33
116	54
116	55
117	4
117	105
117	93
118	23
118	186
118	52
118	73
\.


--
-- TOC entry 3412 (class 0 OID 16413)
-- Dependencies: 221
-- Data for Name: position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."position" (id, title) FROM stdin;
1	Scala Big Data Engineer
2	Spark Engineer
3	Data Engineer
4	ServiceNow Data Analyst
5	Senior MLOps Engineer
6	Lead Data Analyst
7	Senior ETL Developer
8	Data Analyst
9	Software Development Engineer II - Data (Fulfillment)
10	Big Data Engineer
11	Data & Reporting Senior Developer
12	Database Administrator
13	DWH Architect (Data Modeling)
14	Software Development Engineer II - Data Engineering (Forecasting)
15	Power BI Developer
16	Data Engineer in Microsoft Azure Cloud
17	Senior Data Engineer
18	Power BI Consultant
19	Specjalista ds. baz danych Oracle (Oracle Database Specialist)
20	Dynamics 365 Agile Business Analyst
21	Machine Learning Engineer
22	Snowflake Developer
23	DataOps Engineer
24	Specjalista Hurtowni Danych
25	Data Scientist (100% remote)
26	Data Engineer (Databricks)
27	Data Warehouse Developer
28	SQL BI Developer
29	NLP Engineer
30	DWH Analyst
31	Big Data Engineer (Spark & Hadoop)
32	Data Scientist
33	Cloud Data Developer
34	Data Engineer (Fulfillment)
35	Experienced Machine Learning Engineer
36	Web-scrapper (Mid/Senior)
37	Azure Platform Manager
38	Startup Sr Data Engineer
39	Senior DBA
40	Software Engineer - Data Platforms (Principal)
41	Senior Data Scientist
42	Data Engineer (Snowflake)
43	Data Solution Architect
44	Data Engineer with .NET skills
45	Senior Development DBA (Oracle + SQL Server)
46	Business Intelligence Engineer with Azure and Power BI
47	Power Platform Developer
48	Senior Data Scientist z j.niemieckim
49	Senior Data Engineer z j.niemieckim
50	Software Engineer - Data Platforms (Expert)
51	Oracle APEX Developer
52	Data Architect (Data Unit)
53	Program Manager (with BI experience)
54	[Remote] Lead Data Analyst
55	Senior Oracle Siebel Developer
56	PostgreSQL Administrator
57	Senior PHP Software Engineer
58	Functional D365 Administrator (Partly in Paris)
59	Business Intelligence (Power BI) Developer
60	Power BI Developer (Partly in Paris)
61	Senior Data Architect
62	Data Engineer III Forecast
63	Tableau Developer (REMOTE, $40/h, PartTime, 10h/week)
64	Senior Data Analyst
65	Data Engineer with AWS
66	Machine Learning Engineer (NLP)
67	ETL/Python Backend Developer
68	PL/pgSQL Developer with Python
69	Operations Specialist/Architect
70	Senior Data Engineer (Fulfillment)
71	Senior Data Engineer (Flink)
72	Senior Data Engineer/Analyst
73	Business Intelligence Developer
74	Senior Data Engineer ||  Big Data Engineer
\.


--
-- TOC entry 3414 (class 0 OID 16422)
-- Dependencies: 223
-- Data for Name: skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skill (id, skill_name) FROM stdin;
1	DAX
2	Power BI
3	T-SQL
4	MS SQL
5	MS Azure
6	Microsoft Azure
7	Oracle SQL
8	Oracle DB
9	Enterprise
10	Python
11	PySpark
12	Azure
13	Databricks
14	English
15	Data modeling
16	Testing
17	Agile
18	Business Analysis
19	Microsoft 365
20	DevOps tools
21	Data
22	Data Visualization Tools
23	SQL
24	web analytics
25	Problem-solving
26	Google Data Tools
27	Statistical analysis
28	Machine Learning
29	Computer Vision
30	ETL
31	Polish
32	Data Warehouse
33	Snowflake
34	Scala
35	Big Data
36	AWS
37	RDBMS
38	Apache Hadoop
39	Docker
40	Go
41	BigQuery
42	Git
43	SSIS
44	Powershell
45	Data Science
46	AML
47	Apache Spark
48	Cloud
49	Airflow
50	Kafka
51	Kubernetes
52	Spark
53	Pandas
54	DBT
55	Terraform
56	Data Warehousing
57	Azure Data Factory
58	Azure SQL DB
59	BI
60	DWH
61	SSAS
62	Statistics
63	NLP
64	unit tests
65	Deep Learning
66	transformers
67	LLM Orchestration
68	TensorFlow
69	PyTorch
70	visio/erwin
71	PowerBi
72	Java
73	Hadoop
74	R
75	presentation skills
76	Communication Skills
77	SPSS
78	Analytical skills
79	GCP
80	dataform
81	Google Cloud
82	Hive
83	Web scraping
84	Data analysis
85	NoSQL
86	Scrapy
87	JavaScript
88	BeautifulSoup
89	Azure DevOps
90	Business Skills
91	Azure Services
92	Business Intelligence
93	ETL tools
94	DevOps
95	MySQL
96	MongoDB
97	AWS RDS
98	Shell Scripting
99	Amazon AWS
100	Apache Beam
101	Java/Scala/Python
102	AWS / GCP
103	Kafka/BigQuery/Airflow
104	PostreSQL
105	Tableau
106	.Net
107	Data Engineering
108	C#
109	Databases
110	SQL Server
111	Oracle
112	PL/SQL
113	Oracle Data Guard
114	database architecture
115	TSQL
116	Azure Data Services
117	Azure Data Lake Storage
118	Azure Analytics Services
119	NumFOCUS stack
120	Dataverse
121	Power Apps
122	Power Platform
123	Power Automate
124	Niemiecki
125	Kotlin
126	CI/CD
127	Oracle APEX
128	Dynamic Actions
129	MDM
130	DynamoDB
131	PubSub
132	BI systems
133	Data Query
134	Adobe CC
135	Siebel
136	REST API
137	PHP
138	ORM
139	Symfony
140	CQRS
141	DDD
142	ETL Pipelines
143	Google Cloud Platform
144	ToughSpot
145	Affinity CRM
146	MDS
147	VerticaAnsi.SQL
148	Team Player
149	Proactivity
150	Critical thinking
151	Software Architecture
152	French
153	Microsoft BI
154	MQ
155	RLS
156	Azure Synapse
157	Data Integration
158	Data Mapping
159	Design Patterns
160	Reporting
161	Analytics
162	Data Visualization
163	FBT
164	A/B testing
165	Data Pipelines
166	Bash
167	rag
168	LLM
169	Data Lake
170	Microsoft Azure Cloud
171	Apache Airflow
172	PL/pgSQL
173	GraphQL
174	API Design
175	Hasura
176	makefile
177	Linux
178	Web Applications
179	Continuous Integration
180	Continuous Delivery
181	Networking
182	Java / Python
183	Apache Flink
184	Apache Kafka
185	Analytical Thinking
186	SDLC
\.


--
-- TOC entry 3410 (class 0 OID 16404)
-- Dependencies: 219
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.source (id, source_name) FROM stdin;
1	it.pracuj.pl
2	justjoin.it
\.


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 216
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 2, true);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 214
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_id_seq', 69, true);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 224
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_id_seq', 3, true);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 226
-- Name: offer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.offer_id_seq', 118, true);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 220
-- Name: position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_id_seq', 74, true);


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 222
-- Name: skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skill_id_seq', 186, true);


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 218
-- Name: source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.source_id_seq', 2, true);


--
-- TOC entry 3243 (class 2606 OID 16402)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 16393)
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- TOC entry 3251 (class 2606 OID 16438)
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 16447)
-- Name: offer offer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 16477)
-- Name: offer_skill offer_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer_skill
    ADD CONSTRAINT offer_skill_pkey PRIMARY KEY (offer_id, skill_id);


--
-- TOC entry 3247 (class 2606 OID 16420)
-- Name: position position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 16429)
-- Name: skill skill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 16411)
-- Name: source source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_pkey PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 16458)
-- Name: offer offer_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3257 (class 2606 OID 16453)
-- Name: offer offer_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company(id);


--
-- TOC entry 3258 (class 2606 OID 16463)
-- Name: offer offer_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.currency(id);


--
-- TOC entry 3259 (class 2606 OID 16448)
-- Name: offer offer_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_position_id_fkey FOREIGN KEY (position_id) REFERENCES public."position"(id);


--
-- TOC entry 3261 (class 2606 OID 16478)
-- Name: offer_skill offer_skill_offer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer_skill
    ADD CONSTRAINT offer_skill_offer_id_fkey FOREIGN KEY (offer_id) REFERENCES public.offer(id);


--
-- TOC entry 3262 (class 2606 OID 16483)
-- Name: offer_skill offer_skill_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer_skill
    ADD CONSTRAINT offer_skill_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skill(id);


--
-- TOC entry 3260 (class 2606 OID 16468)
-- Name: offer offer_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.source(id);


-- Completed on 2024-05-21 14:05:12

--
-- PostgreSQL database dump complete
--

