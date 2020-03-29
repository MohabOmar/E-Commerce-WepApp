--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: checkisadmin(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.checkisadmin(username text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE 
isUserAdmin boolean;
BEGIN
SELECT isadmin INTO isUserAdmin FROM users WHERE username in (uname,email);
IF isUserAdmin THEN RETURN true;
ELSE RETURN false;
END IF;
END;
$$;


ALTER FUNCTION public.checkisadmin(username text) OWNER TO postgres;

--
-- Name: checklogin(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.checklogin(username text, userpassword text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
numberOfusers int;
BEGIN
SELECT COUNT(*) INTO numberOfUsers FROM users WHERE username in (uname, email) AND password = userPassword;
IF numberOfUsers = 0 THEN RETURN false;
ELSE RETURN true;
END IF;
END;
$$;


ALTER FUNCTION public.checklogin(username text, userpassword text) OWNER TO postgres;

--
-- Name: checkuser(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.checkuser(username text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
numberOfUsers int;
BEGIN

SELECT COUNT(*) into numberOfUsers FROM users WHERE uname = UserName;
IF numberOfUsers = 0 THEN RETURN true;
ELSE RETURN false;
END IF;
END;
$$;


ALTER FUNCTION public.checkuser(username text) OWNER TO postgres;

--
-- Name: createadmin(text, text, text, text, text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.createadmin(username text, firstname text, lastname text, birthdate text, userpass text, userjob text, useremail text, useraddress text, userinterests text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
Isuser boolean;
BEGIN
Select checkuser(username) into isuser;
IF Isuser = true THEN
INSERT INTO users (uname,fname,lname,bd,password,job,email, creditlimit, balance, address, interests,isAdmin) VALUES (username, firstName, lastName, birthdate, userPass, userJob,userEmail,0,0, userAddress,userInterests,true);
RETURN true;
ELSE RETURN false;
END IF;
END;
$$;


ALTER FUNCTION public.createadmin(username text, firstname text, lastname text, birthdate text, userpass text, userjob text, useremail text, useraddress text, userinterests text) OWNER TO postgres;

--
-- Name: createclient(text, text, text, text, text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.createclient(username text, firstname text, lastname text, birthdate text, userpass text, userjob text, useremail text, useraddress text, userinterests text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
Isuser boolean;
BEGIN
Select checkuser(username) into isuser;
IF Isuser = true THEN
INSERT INTO users (uname,fname,lname,bd,password,job,email, creditlimit, balance, address, interests, isAdmin) VALUES (username, firstName, lastName, birthdate, userPass, userJob,userEmail,0,0, userAddress,userInterests,false);
RETURN true;
ELSE RETURN false;
END IF;
END;
$$;


ALTER FUNCTION public.createclient(username text, firstname text, lastname text, birthdate text, userpass text, userjob text, useremail text, useraddress text, userinterests text) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cartsaved; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cartsaved (
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer,
    priceafterbuying double precision
);


ALTER TABLE public.cartsaved OWNER TO postgres;

--
-- Name: cartsaved_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cartsaved_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cartsaved_cart_id_seq OWNER TO postgres;

--
-- Name: cartsaved_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cartsaved_cart_id_seq OWNED BY public.cartsaved.cart_id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    categoryid integer NOT NULL,
    categoryname text
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_categoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_categoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_categoryid_seq OWNER TO postgres;

--
-- Name: category_categoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_categoryid_seq OWNED BY public.category.categoryid;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    productkey integer NOT NULL,
    category_id integer,
    productname text,
    price double precision,
    quantityofproduct integer,
    description text,
    image text,
    isavailable boolean
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_productkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_productkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_productkey_seq OWNER TO postgres;

--
-- Name: products_productkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_productkey_seq OWNED BY public.products.productkey;


--
-- Name: usercart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usercart (
    cartid integer NOT NULL,
    user_id integer NOT NULL,
    issubmitted boolean,
    submitteddate timestamp without time zone
);


ALTER TABLE public.usercart OWNER TO postgres;

--
-- Name: usercart_cartid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usercart_cartid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usercart_cartid_seq OWNER TO postgres;

--
-- Name: usercart_cartid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usercart_cartid_seq OWNED BY public.usercart.cartid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    uid integer NOT NULL,
    uname text,
    fname text,
    lname text,
    bd text,
    password text,
    job text,
    email text,
    creditlimit double precision,
    balance double precision,
    address text,
    interests text,
    isadmin boolean
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_uid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_uid_seq OWNER TO postgres;

--
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_uid_seq OWNED BY public.users.uid;


--
-- Name: cartsaved cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartsaved ALTER COLUMN cart_id SET DEFAULT nextval('public.cartsaved_cart_id_seq'::regclass);


--
-- Name: category categoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN categoryid SET DEFAULT nextval('public.category_categoryid_seq'::regclass);


--
-- Name: products productkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN productkey SET DEFAULT nextval('public.products_productkey_seq'::regclass);


--
-- Name: usercart cartid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usercart ALTER COLUMN cartid SET DEFAULT nextval('public.usercart_cartid_seq'::regclass);


--
-- Name: users uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN uid SET DEFAULT nextval('public.users_uid_seq'::regclass);


--
-- Data for Name: cartsaved; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cartsaved (cart_id, product_id, quantity, priceafterbuying) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (categoryid, categoryname) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (productkey, category_id, productname, price, quantityofproduct, description, image, isavailable) FROM stdin;
\.


--
-- Data for Name: usercart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usercart (cartid, user_id, issubmitted, submitteddate) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (uid, uname, fname, lname, bd, password, job, email, creditlimit, balance, address, interests, isadmin) FROM stdin;
1	qazs	amr	walid	13-12-1993	123456	dev	amrwsk@gmail.com	0	0	agouza	sports	t
2								0	0			t
4	mohab							0	0			t
5	ali	mohab	omar	1994-07-01	iti40	dev	alskdlad@gmail.com	0	0	5465465465	no int	t
6	afasfasf							0	0			f
7	123							0	0			t
8	asdasd	asdasd	asdasd	2020-03-12	asdasd	asdasd	asdasd@gmail.com	0	0	asdas	asdasd	t
3	moh	mohamed	ibrahim	1993-12-13	123456	dev	mohamed@gmail.com	0	0	mansoura	front end dev	f
9	q	amr	walid	1993-12-13	123456	1	1212@hotmail.com	0	0	1	1	t
10	w	amr	walid	0001-12-01	123456	4	alskdlad@gmail.com	0	0	454	5454	t
\.


--
-- Name: cartsaved_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cartsaved_cart_id_seq', 1, false);


--
-- Name: category_categoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_categoryid_seq', 1, false);


--
-- Name: products_productkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_productkey_seq', 1, false);


--
-- Name: usercart_cartid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usercart_cartid_seq', 1, false);


--
-- Name: users_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_uid_seq', 10, true);


--
-- Name: cartsaved cartsaved_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartsaved
    ADD CONSTRAINT cartsaved_pkey PRIMARY KEY (cart_id, product_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (categoryid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productkey);


--
-- Name: usercart usercart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usercart
    ADD CONSTRAINT usercart_pkey PRIMARY KEY (cartid, user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(categoryid);


--
-- PostgreSQL database dump complete
--

