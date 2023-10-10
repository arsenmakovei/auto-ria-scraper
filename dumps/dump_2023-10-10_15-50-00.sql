--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
81	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_35362501.html	Mercedes-Benz Sprinter 1991	1300	400000	 Andrij	(066) 880 67 80	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__518528645f.jpg	4	\N	WDB6013621P079369	2023-10-10 11:20:34.024921
76	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_35338252.html	Mercedes-Benz Sprinter 2017	33200	225000	Ref & Bus	(067) 611 51 19	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__517901365f.jpg	25	\N	\N	2023-10-10 15:49:12.519093
79	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35347813.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1 Kiev	(067) 259 44 32, (067) 372 97 73	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518152001f.jpg	50	\N	\N	2023-10-10 15:49:13.848112
74	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35321845.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Lviv	(067) 321 96 65, (067) 414 69 59	https://cdn4.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__517487994f.jpg	51	\N	\N	2023-10-10 15:49:14.865425
78	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_34253323.html	Mercedes-Benz Sprinter 2018	24200	260000	Ref & Bus	(067) 611 51 19	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__503843524f.jpg	27	\N	WDB9071332N005970	2023-10-10 15:49:16.029559
77	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35327871.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kiev	(067) 259 44 32, (067) 372 97 73	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__517639476f.jpg	51	\N	\N	2023-10-10 15:49:17.088118
75	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35286697.html	Volkswagen ID.4 Crozz 2023	31000	1000	SKM-1 Kiev	(067) 259 44 32, (067) 372 97 73	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__516516750f.jpg	36	\N	\N	2023-10-10 15:49:20.322525
80	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_35354283.html	Mercedes-Benz Sprinter 2018	22800	214000	Ref & Bus	(067) 611 51 19	https://cdn3.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__518314808f.jpg	26	\N	\N	2023-10-10 15:49:22.551945
82	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35044861.html	Volkswagen ID.4 Crozz 2023	30850	1000	АМПЕР АВТО	(067) 465 97 62, (073) 980 88 88	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__510575097f.jpg	14	\N	LFVVB9E68P5001601	2023-10-10 15:49:19.332526
63	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35223811.html	Volkswagen ID.4 Crozz 2023	31500	1000	Elcars	(093) 189 40 46, (067) 293 25 74, (093) 821 80 04, (067) 103 52 58, (093) 189 40 49	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__514932927f.jpg	22	\N	\N	2023-10-10 15:49:31.090361
73	https://auto.ria.com/uk/auto_volkswagen_tiguan_35177119.html	Volkswagen Tiguan 2021	40900	78000	 Сергій Станіславович	(067) 314 04 36, (095) 588 82 02, (096) 640 74 47, (098) 814 69 16	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__513741891f.jpg	218	\N	WVGZZZ5NZMW502576	2023-10-10 15:49:32.443363
62	https://auto.ria.com/uk/auto_bmw_x6_m_35366499.html	BMW X6 M 2021	105000	43000	 Yura	(093) 244 87 50	https://cdn0.riastatic.com/photosnew/auto/photo/bmw_x6-m__518629655f.jpg	114	\N	\N	2023-10-10 15:49:11.282394
72	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35363942.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Lviv	(067) 321 96 65, (067) 414 69 59	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518566818f.jpg	36	\N	\N	2023-10-10 15:49:18.143005
71	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35347621.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1 Lviv	(067) 321 96 65, (067) 414 69 59	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518146862f.jpg	54	\N	\N	2023-10-10 15:49:21.561868
69	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35363891.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kiev	(067) 259 44 32, (067) 372 97 73	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518565158f.jpg	34	\N	\N	2023-10-10 15:49:23.636117
67	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35364053.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kyiv	(067) 726 33 35, (067) 546 41 41	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518569500f.jpg	38	\N	\N	2023-10-10 15:49:24.624119
70	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35364035.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kyiv	(067) 726 33 35, (067) 546 41 41	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518569033f.jpg	36	\N	\N	2023-10-10 15:49:25.588119
68	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35363913.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kyiv	(067) 726 33 35, (067) 546 41 41	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518566213f.jpg	45	\N	\N	2023-10-10 15:49:26.748198
64	https://auto.ria.com/uk/auto_porsche_cayenne_35358795.html	Porsche Cayenne 2016	29500	139000	 Дмитрий	(073) 322 72 27	https://cdn0.riastatic.com/photosnew/auto/photo/porsche_cayenne__518473660f.jpg	36	AB 7777 XA 	WP1AA2A20HKA87913	2023-10-10 15:49:27.987198
66	https://auto.ria.com/uk/auto_porsche_cayenne_35355440.html	Porsche Cayenne 2012	26900	117000	 Богдан Радионов	(073) 470 60 25	https://cdn1.riastatic.com/photosnew/auto/photo/porsche_cayenne__518364281f.jpg	41	AA 6699 PT 	WP1ZZZ92ZDLA04122	2023-10-10 15:49:28.979364
65	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35347693.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1 Kyiv	(067) 546 41 41, (067) 726 33 35	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518148503f.jpg	48	\N	\N	2023-10-10 15:49:30.024365
\.


--
-- Name: used_cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.used_cars_id_seq', 82, true);


--
-- Name: used_cars used_cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.used_cars
    ADD CONSTRAINT used_cars_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

