--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-0+deb12u1)

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
-- Name: used_cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.used_cars (
    id integer NOT NULL,
    url character varying(255),
    title character varying(255),
    price_usd integer,
    odometer integer,
    username character varying(255),
    phone_number character varying(255),
    image_url character varying(255),
    images_count integer,
    car_number character varying(255),
    car_vin character varying(255),
    datetime_found timestamp without time zone
);


ALTER TABLE public.used_cars OWNER TO postgres;

--
-- Name: used_cars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.used_cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.used_cars_id_seq OWNER TO postgres;

--
-- Name: used_cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.used_cars_id_seq OWNED BY public.used_cars.id;


--
-- Name: used_cars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.used_cars ALTER COLUMN id SET DEFAULT nextval('public.used_cars_id_seq'::regclass);


--
-- Data for Name: used_cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.used_cars (id, url, title, price_usd, odometer, username, phone_number, image_url, images_count, car_number, car_vin, datetime_found) FROM stdin;
1	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35347693.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1 Kyiv	(067) 546 41 41, (067) 726 33 35	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518148503f.jpg	48	\N	\N	2023-10-11 19:07:15.226996
2	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35327871.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kiev	(067) 259 44 32, (067) 372 97 73	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__517639476f.jpg	51	\N	\N	2023-10-11 19:07:21.103971
3	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35374649.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Lviv	(067) 321 96 65, (067) 414 69 59	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518834090f.jpg	47	\N	\N	2023-10-11 19:07:23.327114
4	https://auto.ria.com/uk/auto_volkswagen_tiguan_34633467.html	Volkswagen Tiguan 2020	25900	18000	 Гена	(096) 450 91 57	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__512280050f.jpg	57	AB 0930 KH 	3VV3B7AX4LM105896	2023-10-11 19:07:27.656278
5	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35374693.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1	(067) 414 66 50, (067) 726 31 10	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518835228f.jpg	47	\N	\N	2023-10-11 19:07:30.951446
6	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35374618.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kiev	(067) 259 44 32, (067) 372 97 73	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518833437f.jpg	39	\N	\N	2023-10-11 19:07:34.042244
7	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35327782.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Lviv	(067) 321 96 65, (067) 414 69 59	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__517637765f.jpg	41	\N	\N	2023-10-11 19:07:36.144032
8	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35304961.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1 Lviv	(067) 321 96 65, (067) 414 69 59	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__517006296f.jpg	49	\N	\N	2023-10-11 19:07:38.682402
9	https://auto.ria.com/uk/auto_bmw_x6_35372777.html	BMW X6 2020	105000	44000	 Yura	(093) 244 87 50	https://cdn2.riastatic.com/photosnew/auto/photo/bmw_x6__518791237f.jpg	133	\N	WBAGT610x09xxxx31	2023-10-11 19:07:41.131478
10	https://auto.ria.com/uk/auto_volkswagen_id_4_35304101.html	Volkswagen ID.4 2023	31500	1000	SKM-1 Lviv	(067) 321 96 65, (067) 414 69 59	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_id-4__516983466f.jpg	45	\N	\N	2023-10-11 19:07:42.981622
11	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35374763.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kyiv	(067) 546 41 41, (067) 726 33 35	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518837512f.jpg	48	\N	\N	2023-10-11 19:07:44.774767
12	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35304260.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1 Kiev	(067) 259 44 32, (067) 372 97 73	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__516987743f.jpg	55	\N	\N	2023-10-11 19:07:46.335829
13	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35374740.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kyiv	(067) 546 41 41, (067) 726 33 35	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518837125f.jpg	51	\N	\N	2023-10-11 19:07:48.233884
14	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35368445.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1 Kyiv	(067) 546 41 41, (067) 726 33 35	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518678382f.jpg	59	\N	\N	2023-10-11 19:07:50.259075
15	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35264056.html	Volkswagen ID.4 Crozz 2022	27490	1000	ЕлектроКінь	(063) 850 06 06, (067) 850 06 06, (050) 850 06 06	https://cdn4.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__515943509f.jpg	19	\N	\N	2023-10-11 19:07:52.224989
16	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35327999.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kyiv	(067) 546 41 41, (067) 726 33 35	https://cdn4.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__517641919f.jpg	46	\N	\N	2023-10-11 19:07:53.839639
17	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35322587.html	Volkswagen ID.4 Crozz 2023	30000	1000	4Колеса	(067) 155 73 73, (068) 951 38 55	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__517506865f.jpg	25	\N	\N	2023-10-11 19:07:55.332565
18	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35305055.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1	(067) 414 66 50, (067) 726 31 10	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__517009380f.jpg	52	\N	\N	2023-10-11 19:07:57.12713
19	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35237913.html	Volkswagen ID.4 Crozz 2023	29000	1000	SKM-1	(067) 414 66 50, (067) 726 31 10	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__515281690f.jpg	47	\N	\N	2023-10-11 19:07:58.994098
20	https://auto.ria.com/uk/auto_volkswagen_tiguan_35177119.html	Volkswagen Tiguan 2021	40900	78000	 Сергій Станіславович	(067) 314 04 36, (095) 588 82 02, (096) 640 74 47, (098) 814 69 16	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__513741891f.jpg	218	\N	WVGZZZ5NZMW502576	2023-10-11 19:08:00.994534
\.


--
-- Name: used_cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.used_cars_id_seq', 33, true);


--
-- Name: used_cars used_cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.used_cars
    ADD CONSTRAINT used_cars_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

