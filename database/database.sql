--
-- PostgreSQL database cluster dump
--

-- Started on 2024-08-04 11:45:15

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:bifVfZAdlnzv3SFnwOgKHw==$lfpit8tYU/2yFRQ4xW58gqkFE6fiQUXtCVJ8CpBn/t4=:zwWZbPkMnGYMydhHYGWX6Ejgot1TWiIMAxLput5bWYo=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-08-04 11:45:15

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

-- Completed on 2024-08-04 11:45:15

--
-- PostgreSQL database dump complete
--

--
-- Database "B2C" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-08-04 11:45:15

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
-- TOC entry 4875 (class 1262 OID 40980)
-- Name: B2C; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "B2C" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE "B2C" OWNER TO postgres;

\connect "B2C"

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
-- TOC entry 7 (class 2615 OID 49178)
-- Name: buyer; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA buyer;


ALTER SCHEMA buyer OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 40981)
-- Name: product; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA product;


ALTER SCHEMA product OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 49179)
-- Name: buyer; Type: TABLE; Schema: buyer; Owner: postgres
--

CREATE TABLE buyer.buyer (
    id text NOT NULL,
    name text NOT NULL,
    mail text NOT NULL,
    phone text NOT NULL,
    "addressline-1" text,
    "addressline-2" text,
    "addressline-3" text,
    city text,
    state text,
    country text,
    pincode text,
    block boolean,
    password text NOT NULL
);


ALTER TABLE buyer.buyer OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 49200)
-- Name: carousel; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.carousel (
    id uuid NOT NULL,
    name text NOT NULL,
    image text NOT NULL,
    url text
);


ALTER TABLE product.carousel OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 40989)
-- Name: category; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.category (
    id uuid NOT NULL,
    name text NOT NULL,
    image text,
    subcategories text
);


ALTER TABLE product.category OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 49193)
-- Name: coupon; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.coupon (
    id uuid NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    amount text NOT NULL,
    buyerid uuid,
    validity date,
    date date NOT NULL
);


ALTER TABLE product.coupon OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 40982)
-- Name: product; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.product (
    id text NOT NULL,
    name text NOT NULL,
    company text NOT NULL,
    qty text NOT NULL,
    price numeric NOT NULL,
    discount text NOT NULL,
    description text NOT NULL,
    date date NOT NULL,
    category text NOT NULL,
    active boolean NOT NULL,
    block boolean NOT NULL,
    subcategory text,
    rating text,
    specific_attributes text,
    images text,
    videos text,
    obj text
);


ALTER TABLE product.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 49186)
-- Name: product_review; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.product_review (
    id uuid NOT NULL,
    buyer_id uuid NOT NULL,
    product_id uuid NOT NULL,
    category_id uuid,
    date date NOT NULL,
    comment text,
    photo text,
    rating text NOT NULL
);


ALTER TABLE product.product_review OWNER TO postgres;

--
-- TOC entry 4866 (class 0 OID 49179)
-- Dependencies: 219
-- Data for Name: buyer; Type: TABLE DATA; Schema: buyer; Owner: postgres
--

COPY buyer.buyer (id, name, mail, phone, "addressline-1", "addressline-2", "addressline-3", city, state, country, pincode, block, password) FROM stdin;
974d5f4f-cefe-4382-a963-61a016751761	patil	patil	9087645678	NaN	NaN	NaN	NaN	NaN	NaN	NaN	f	b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86
e1447680-b475-4aee-a406-c734b499fd10	patil	patilsumeet	9087645678	NaN	NaN	NaN	NaN	NaN	NaN	NaN	f	b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86
\.


--
-- TOC entry 4869 (class 0 OID 49200)
-- Dependencies: 222
-- Data for Name: carousel; Type: TABLE DATA; Schema: product; Owner: postgres
--

COPY product.carousel (id, name, image, url) FROM stdin;
\.


--
-- TOC entry 4865 (class 0 OID 40989)
-- Dependencies: 218
-- Data for Name: category; Type: TABLE DATA; Schema: product; Owner: postgres
--

COPY product.category (id, name, image, subcategories) FROM stdin;
6144a63d-206f-4061-8acb-616e23104d7f	Fashion		6144a63d-206f-4061-8acb-616e23104d7f_0:Clothing,6144a63d-206f-4061-8acb-616e23104d7f_1:Jewelry
3d838315-bcdd-40da-86ca-32a5609335e0	Home & Kitchen		3d838315-bcdd-40da-86ca-32a5609335e0_0:HomeAppliances,3d838315-bcdd-40da-86ca-32a5609335e0_1:Kitchenware
afb11591-66c1-4ed9-b4c0-f5c61d6f6a91	Sports & Outdoors		afb11591-66c1-4ed9-b4c0-f5c61d6f6a91_0:Fitness&Wellness,afb11591-66c1-4ed9-b4c0-f5c61d6f6a91_1:Toys&Games
3c657366-7f9d-40bd-957f-6cc62c58ca03	Toys & Hobbies		3c657366-7f9d-40bd-957f-6cc62c58ca03_0:Games,3c657366-7f9d-40bd-957f-6cc62c58ca03_1:Music
decdcc48-2e3c-4be8-8e51-497c3c24c072	Technology		decdcc48-2e3c-4be8-8e51-497c3c24c072_0:Computing,decdcc48-2e3c-4be8-8e51-497c3c24c072_1:Telecommunications
6468d507-e2bf-46ee-afae-d24eb18f5a6d	Home Appliances		6468d507-e2bf-46ee-afae-d24eb18f5a6d_0:ElectricKettles,6468d507-e2bf-46ee-afae-d24eb18f5a6d_1:Microwaves
bc597baa-71b1-45af-ae9b-b033e22b89fc	Toys		
bf6b6deb-c857-4f97-958c-fa43315855e8	Games		
728b04ec-29f0-4ca5-b668-7ffe44241d4a	Books		
71280176-e707-486c-a063-a71c68da8284	Sports		
1a466a9d-079b-4f6c-a628-a1f6ade661c9	Crafts		
237d718b-c02e-48d9-8bf9-e63cbc5a5d7b	Music		
e144ef59-de9b-4194-949e-dbcf0909391a	Beauty		
2ae823fe-2332-41b1-9ab5-97c358380c96	Food		
59ae90b7-9e49-4be5-8bf2-16e63e2190d7	Garden		
dd5df7d9-1997-401c-afd6-5f4cd98a60a7	Toys & Games		
c6e15e47-a1a3-4a51-97b3-7593bec3da09	Beauty & Personal Care		
d78556d9-a248-442d-8c28-c33d563acf6d	Fitness & Wellness		
f1a6f5c6-a1d6-46e3-b254-e6d2205173be	Gadgets		
b42e17cd-e5b2-4e5c-8227-c74d7eb987f4	Food & Beverages		
e34cc06f-f914-4a36-8ad4-9398939414bc	Kitchenware		
b25d3522-698f-4494-840b-e523485626e6	Health		b25d3522-698f-4494-840b-e523485626e6_0:medcare
07bfcfdf-26ba-4c1d-ad15-5c18ad898296	Electronics		07bfcfdf-26ba-4c1d-ad15-5c18ad898296_1:Televisions,07bfcfdf-26ba-4c1d-ad15-5c18ad898296_0:Mobiles
\.


--
-- TOC entry 4868 (class 0 OID 49193)
-- Dependencies: 221
-- Data for Name: coupon; Type: TABLE DATA; Schema: product; Owner: postgres
--

COPY product.coupon (id, code, name, amount, buyerid, validity, date) FROM stdin;
\.


--
-- TOC entry 4864 (class 0 OID 40982)
-- Dependencies: 217
-- Data for Name: product; Type: TABLE DATA; Schema: product; Owner: postgres
--

COPY product.product (id, name, company, qty, price, discount, description, date, category, active, block, subcategory, rating, specific_attributes, images, videos, obj) FROM stdin;
445eb51b-10b3-4cb5-a288-5c70d7e9a92a	Silver Diamond Necklace	ABC	onDemand	500000	%10	24 Carat Diamond	2024-07-29	6144a63d-206f-4061-8acb-616e23104d7f	t	f	6144a63d-206f-4061-8acb-616e23104d7f_1	NaN	NaN	NaN	NaN	NaN
4e72d15a-8379-4661-bdf2-cf7e28aa752c	Diamond Necklace	ABC	onDemand	500000	%10	24 Carat Diamond	2024-08-03	6144a63d-206f-4061-8acb-616e23104d7f	t	f	6144a63d-206f-4061-8acb-616e23104d7f_1	NaN	NaN	NaN	NaN	NaN
1f3ac81d-11b5-48d5-b132-8f2b363f0cc8	Gold Necklace	ABC	10	500000	%10	22 Carat Gold	2024-08-03	6144a63d-206f-4061-8acb-616e23104d7f	t	f	6144a63d-206f-4061-8acb-616e23104d7f_1	NaN	NaN	NaN	NaN	NaN
105ed57e-5292-49c5-9b6f-d4e410263d66	Silver Necklace	ABC	10	50000	%10	 	2024-08-03	6144a63d-206f-4061-8acb-616e23104d7f	t	f	6144a63d-206f-4061-8acb-616e23104d7f_1	NaN	NaN	NaN	NaN	NaN
\.


--
-- TOC entry 4867 (class 0 OID 49186)
-- Dependencies: 220
-- Data for Name: product_review; Type: TABLE DATA; Schema: product; Owner: postgres
--

COPY product.product_review (id, buyer_id, product_id, category_id, date, comment, photo, rating) FROM stdin;
\.


--
-- TOC entry 4714 (class 2606 OID 49185)
-- Name: buyer buyer_pkey; Type: CONSTRAINT; Schema: buyer; Owner: postgres
--

ALTER TABLE ONLY buyer.buyer
    ADD CONSTRAINT buyer_pkey PRIMARY KEY (id);


--
-- TOC entry 4720 (class 2606 OID 49206)
-- Name: carousel carousel_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.carousel
    ADD CONSTRAINT carousel_pkey PRIMARY KEY (id);


--
-- TOC entry 4712 (class 2606 OID 40995)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 4718 (class 2606 OID 49199)
-- Name: coupon coupon_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.coupon
    ADD CONSTRAINT coupon_pkey PRIMARY KEY (id);


--
-- TOC entry 4710 (class 2606 OID 40988)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 4716 (class 2606 OID 49192)
-- Name: product_review product_review_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.product_review
    ADD CONSTRAINT product_review_pkey PRIMARY KEY (id);


-- Completed on 2024-08-04 11:45:15

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-08-04 11:45:15

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
-- TOC entry 9 (class 2615 OID 32801)
-- Name: Admin; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Admin";


ALTER SCHEMA "Admin" OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 16414)
-- Name: Buyer; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA "Buyer";


ALTER SCHEMA "Buyer" OWNER TO pg_database_owner;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA "Buyer"; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA "Buyer" IS 'This database contains all the tables related to customer';


--
-- TOC entry 8 (class 2615 OID 24594)
-- Name: Product; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Product";


ALTER SCHEMA "Product" OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: Seller; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA "Seller";


ALTER SCHEMA "Seller" OWNER TO pg_database_owner;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA "Seller"; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA "Seller" IS 'standard public schema';


--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 32816)
-- Name: T2_Tickets; Type: TABLE; Schema: Admin; Owner: postgres
--

CREATE TABLE "Admin"."T2_Tickets" (
    "TicketID" text NOT NULL,
    "Status" text NOT NULL,
    "Date" date NOT NULL,
    "SellerID" text,
    "Title" text,
    "Description" text,
    "CategoryID" text,
    "ProductID" text
);


ALTER TABLE "Admin"."T2_Tickets" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32823)
-- Name: T3_Coupons; Type: TABLE; Schema: Admin; Owner: postgres
--

CREATE TABLE "Admin"."T3_Coupons" (
    "CouponCode" text NOT NULL,
    "CouponName" text,
    "Discount" text,
    "Validity" date,
    "AccessToken" text
);


ALTER TABLE "Admin"."T3_Coupons" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 32780)
-- Name: T1_SignedUp; Type: TABLE; Schema: Buyer; Owner: postgres
--

CREATE TABLE "Buyer"."T1_SignedUp" (
    "BuyerID" text NOT NULL,
    "Name" text,
    "MailID" text NOT NULL,
    "Phone" numeric NOT NULL,
    "Password" text
);


ALTER TABLE "Buyer"."T1_SignedUp" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32787)
-- Name: T2_Cart; Type: TABLE; Schema: Buyer; Owner: postgres
--

CREATE TABLE "Buyer"."T2_Cart" (
    "BuyerID" text NOT NULL,
    "Products" text
);


ALTER TABLE "Buyer"."T2_Cart" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 32794)
-- Name: T3_Registered; Type: TABLE; Schema: Buyer; Owner: postgres
--

CREATE TABLE "Buyer"."T3_Registered" (
    "BuyerID" text NOT NULL,
    "AddressLine-01" text NOT NULL,
    "AddressLine-02" text,
    "AddressLine-03" text,
    "City" text NOT NULL,
    "State" text NOT NULL,
    "PinCode" numeric NOT NULL,
    "Blocked" boolean
);


ALTER TABLE "Buyer"."T3_Registered" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24595)
-- Name: T1_Product_Information; Type: TABLE; Schema: Product; Owner: postgres
--

CREATE TABLE "Product"."T1_Product_Information" (
    "ProductID" text NOT NULL,
    "SellerID" text NOT NULL,
    "DateOfCreation" date,
    "Qty" numeric,
    "OutOfStock" text,
    "Active" text,
    "Name" text,
    "UnitPrice" numeric,
    "Type" text,
    "Material" text,
    "Discount" text,
    "Description" text,
    "CategoryID" text,
    "Blocked" boolean
);


ALTER TABLE "Product"."T1_Product_Information" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32809)
-- Name: T2_CategoryTable; Type: TABLE; Schema: Product; Owner: postgres
--

CREATE TABLE "Product"."T2_CategoryTable" (
    "CategoryID" text NOT NULL,
    "CategoryName" text NOT NULL,
    "SubCategories" text,
    "Blocked" boolean NOT NULL
);


ALTER TABLE "Product"."T2_CategoryTable" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24602)
-- Name: T3_Product_Reviews; Type: TABLE; Schema: Product; Owner: postgres
--

CREATE TABLE "Product"."T3_Product_Reviews" (
    "ProductID" text NOT NULL,
    "SellerID" text NOT NULL,
    "BuyerID" text NOT NULL,
    "Review" text,
    "Rating" numeric
);


ALTER TABLE "Product"."T3_Product_Reviews" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 40973)
-- Name: T4_Orders; Type: TABLE; Schema: Product; Owner: postgres
--

CREATE TABLE "Product"."T4_Orders" (
    "OrderID" text NOT NULL,
    "SellerID" text NOT NULL,
    "BuyerID" text NOT NULL,
    "InternalTransactionID" text NOT NULL,
    "ExternalTransactionID" text NOT NULL,
    "Products" text NOT NULL,
    "Status" text NOT NULL
);


ALTER TABLE "Product"."T4_Orders" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16398)
-- Name: T1_SignedUp; Type: TABLE; Schema: Seller; Owner: postgres
--

CREATE TABLE "Seller"."T1_SignedUp" (
    "SellerID" text NOT NULL,
    "Seller_Referral_Code" text,
    "MailID" text NOT NULL,
    "Phone" numeric NOT NULL,
    "Password" text,
    "Name" text
);


ALTER TABLE "Seller"."T1_SignedUp" OWNER TO postgres;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE "T1_SignedUp"; Type: COMMENT; Schema: Seller; Owner: postgres
--

COMMENT ON TABLE "Seller"."T1_SignedUp" IS 'This table contains the list of users who have signed up in our system. They haven''t registered yet';


--
-- TOC entry 220 (class 1259 OID 16406)
-- Name: T2_Registered; Type: TABLE; Schema: Seller; Owner: postgres
--

CREATE TABLE "Seller"."T2_Registered" (
    "SellerID" text NOT NULL,
    "PanID" text NOT NULL,
    "Aadhar" numeric NOT NULL,
    "CompanyName" text NOT NULL,
    "BankAccountNumber" numeric NOT NULL,
    "GSTIN" text NOT NULL,
    "CompanyAddress" text NOT NULL,
    "Country" text NOT NULL,
    "CompanyDescription" text,
    "Blocked" boolean NOT NULL,
    "Name" text NOT NULL
);


ALTER TABLE "Seller"."T2_Registered" OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE "T2_Registered"; Type: COMMENT; Schema: Seller; Owner: postgres
--

COMMENT ON TABLE "Seller"."T2_Registered" IS 'The Table contains all the users who have registered as vendors wth our system';


--
-- TOC entry 221 (class 1259 OID 24580)
-- Name: T3_BankDetails; Type: TABLE; Schema: Seller; Owner: postgres
--

CREATE TABLE "Seller"."T3_BankDetails" (
    "SellerID" text NOT NULL,
    "BankAccountNumber" text NOT NULL,
    "BankName" text NOT NULL,
    "BankBranch" text NOT NULL,
    "IFSC" text NOT NULL
);


ALTER TABLE "Seller"."T3_BankDetails" OWNER TO postgres;

--
-- TOC entry 4911 (class 0 OID 32816)
-- Dependencies: 228
-- Data for Name: T2_Tickets; Type: TABLE DATA; Schema: Admin; Owner: postgres
--

COPY "Admin"."T2_Tickets" ("TicketID", "Status", "Date", "SellerID", "Title", "Description", "CategoryID", "ProductID") FROM stdin;
76f4a4a5-2c14-43c6-bfc2-0a88bb8756ad	Active	2024-07-10	e8527274-569a-4a0c-88a4-2b3bf7df0175	Test Ticket	This is a Test Ticket	\N	\N
689b04de-fb84-421d-b053-c77e23db83e6	Active	2024-07-11	c077ae5a-4fd3-4a15-a600-27c68df00716	Test Ticket 02	This is a Test Ticket 02	\N	\N
9532a31a-8301-4c41-b00d-0388aff6deb1	Active	2024-07-11	4f350e3a-93d7-4547-b17f-697e6958b1b3	Test Ticket 03	This is a Test Ticket 03	\N	\N
\.


--
-- TOC entry 4912 (class 0 OID 32823)
-- Dependencies: 229
-- Data for Name: T3_Coupons; Type: TABLE DATA; Schema: Admin; Owner: postgres
--

COPY "Admin"."T3_Coupons" ("CouponCode", "CouponName", "Discount", "Validity", "AccessToken") FROM stdin;
1234566789acbsc	TestCoupon	%10	2024-08-01	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJDb3Vwb25Db2RlIjoiMTIzNDU2Njc4OWFjYnNjIiwiaWF0IjoxNzIxMDM1MDg5LCJleHAiOjMxNTYzNDUyMjF9.iEx8jcfr6sUOYJBZzOvPpiYZvZCqhVJdnnrg4VYGkJ8
\.


--
-- TOC entry 4907 (class 0 OID 32780)
-- Dependencies: 224
-- Data for Name: T1_SignedUp; Type: TABLE DATA; Schema: Buyer; Owner: postgres
--

COPY "Buyer"."T1_SignedUp" ("BuyerID", "Name", "MailID", "Phone", "Password") FROM stdin;
22e9556b-57e1-4730-9049-c0ff79777cf3	Aaliyah Johnson	aaliyah.johnson@email.com	1234567890	f46f8ec119cee3a152c1a5c73801ab7ea6daed73bfd0fc2401bd3a354edb79d46160404a2e657c59888ab6f8d328aa76d67dffcdd608260185121a59ca8f8d96
46168b3a-b2b3-404d-847f-d05849a04536	Bao Nguyen	bao.nguyen@email.com	2345678901	86503d6f44dccf471f6ef3f903a3371755e82aa566cc4692e9e8f679fa54790addc7d20e9e10a9c42ef3cbb3d672fcd535f6714378697ddddf0b8db6524c3294
8f8e499c-97cb-4539-8b2f-586973ab0b80	Carla Garcia	carla.garcia@email.com	3456789012	6aa044bba112bf3106067fcf2d4e5a45f805857c5e972c4d9e701e01b609f37e860260135e5441ebfe5d2e875782f4b242f8fa53516ef4fcc83ea67440dc1c48
c794ad24-cdb2-4635-89d6-b57d6f9ac6a5	Diego Rodriguez	diego.rodriguez@email.com	4567890123	4ab44ef330f6f039bebd4e2ea22a05a377dd1f3831f063e2f4ec877c3a18c2d6b04acc15ed2db053a3a31aa991071acd51370ab80df5ccf35b38bf9c72b08344
f76c17ee-f8d8-4bd6-afe5-d84d3d944443	Elena Martinez	elena.martinez@email.com	5678901234	3308c2896e25439d4114102e9fd48386a6094edb8a1b0efa76ec6418626d6eea5d6dcea427b769281a466871375a4c0199a47f0095ea8a194972fd49e5676322
a72629fd-6de0-422f-bbe8-97ca806b34a1	Farah Ahmed	farah.ahmed@email.com	6789012345	f09ae1d9c7b74bf2984022d9840f6d0431e4ae247d6a67d945d3676157385c1eea5fe3a85534710d6fb1cd3f8a308fd72c02f6e7bca58ac12ed1dd5b383bdb55
c12bfd0d-0690-44f4-ab3e-ac5278bae912	Gianluca Rossi	gianluca.rossi@email.com	7890123456	6e93677c1cea23ebf6f4a4a440b4eca3e5fdc4fb2d4188e40f2f03339980d2cad5f6e22cb1b577361b574f61a752a74e24943862d6df1fb8b5f260a86d803cff
d96ff15b-889c-42b8-8360-ccc348d80cbe	Hana Kim	hana.kim@email.com	8901234567	51cb11bb6a2400bfa3bf2b8f5cb7f2424a94ec4b7063cc8d84c747d3b6e70b177b43725cf5d3109e54583bed47ccdbb2eadcdb84baec25590adb659c33f6d115
9678efad-e579-4ab5-bce0-6f9927a392b3	Ibrahim Ali	ibrahim.ali@email.com	9012345678	8fa92b26767dd329f54c9da0a063a33ec26ee18588068686a64e71deef68c2a29ba4348291f086571033ead48b5ab1708d14fef461e60a58ddbe5125d12d44f8
b9dca593-b12a-46f7-86b3-878612375ce3	Karen Lopez	karen.lopez@email.com	1234567890	e2c21ce05475c725b0db9b5e57627c0d28c3008578d12b07fd902cddd6ca5ce9340e7c10e2ecd2a089ab17e637ffd3bfc401ed8454394c2d5476422b031510c8
89e76a24-c3fd-4a49-a8f0-97c640430a0f	Leo Mendez	leo.mendez@email.com	2345678901	94eda5b730c4fe1c27cd6993b9a7ea1d448948941bee8c82ed03478dde84a910012156023382b7d69a5c0a651cbfb3cdcf1f375b3c61706276db3368d23db74e
090f44e1-31c7-49fa-a3ca-e027b70da801	Mira Singh	mira.singh@email.com	3456789012	928a48ddc19829c5e7a0cc367b727d37fdaf0ec836f725ed9c9bda48dbd668137b8b244d38b02e95b692f2695ceeacab6d1b339e1c901f3747aa9858b4ab9cf5
285c609b-fd4b-4a08-999b-7c5dc7c95f53	Nia White	nia.white@email.com	4567890123	6a511e9f5cf8c1cc457250297fa44c48a6b94542cb120f70ae693378d0cd7b3fbf1bb4d8b457c7d554a27c9c7a98539e663ab1e863b8872a9095d48af00e2596
dc5a4750-f3d1-4eb1-9af7-b8ccb2b4af43	Oliver Thompson	oliver.thompson@email.com	5678901234	b33b9dac5fbd22b6445ab75db0bddcafb42c9a0447e3fdfe6dc8ce2af384b63bd1cf1a87e41703e030a6bf1dcf7f1389aaf800a42e205905b7ea7d5da5d4fedb
c29272d3-4036-4846-9c9c-9cfb9c385906	Phoebe Wilson	phoebe.wilson@email.com	6789012345	0f62938a178ec657f17b4a716c77a453f14a7e561d8e47c0b26dc2ebfcb2c0b3d9d45e4f1c736adf0bf94766b3c58df2a84e1c66448d543f0a1028f319ccfad1
7a2eb455-0a1c-4141-a9ea-f0a54c9ccb2a	Quentin James	quentin.james@email.com	7890123456	744f590e78621c38c4c5b98fda575c1e479e0a86412c89865f1b7493a846a8574b4500c0c4011ba45f29c38469ce7a5bf16c2e1f7e1dd3e2d1ddff5f14bf85bb
96010001-c2c7-4592-a752-73b6728a3ac7	Rania Ahmed	rania.ahmed@email.com	8901234567	7af236ce0a632b79d6f8896537d60163c5e8aca30712055c781c3bc404ee00fa469160565a7fe7fb5031696625ff20a497ed6043d3cbecf50f8382b3286a1ae5
2279f382-d322-4410-a1f3-35398f6ebc02	Sophie Brown	sophie.brown@email.com	9012345678	fc361d664173546bcfe533f9877d46df394ea86cf5ffe5fba496908ebcd35871d3965c5aad1419d8e945a34882db63d89d625c7dff4078883e97e2738d5a5519
e5248270-9705-4eb7-a5f4-e9237e95aee7	Uma Patel	uma.patel@email.com	1234567890	096c9660c601f8659ac8fcd43f5998faf21e7815635ad322552c411b70abfa196a12432589e1241c154f8e4655e7045ad8a3008ccef9d8ee7862f38a0ca84a8e
db30c441-7a7a-4fa7-aac3-35a1cb1cb21d	Victor Nguyen	victor.nguyen@email.com	2345678901	a372e130d20d15123a24161aca6aa268ad188cc79e60c4f48caa9beb639005888a60404687053dc518b688e3c68d01294281458c3d9df38a565ff69d72446b39
c9742fac-fd97-4270-b14e-c61f26ab7fcc	Wen Chen	wen.chen@email.com	3456789012	1f782b69eb33a19a766b9c94e17523d1d2c29bb41f9356d5ba7367142470ff78a2498572b80cbb50ffc4058b91ce9dd6e8a3dffcde12a841c77bba1d4766313b
f75782f6-fd4d-4c16-996f-f4fc1bcef6a9	Xiao Wang	xiao.wang@email.com	4567890123	12bd338572262b700a5121cdcedbc78a068882601f9dc5b84637198f5b88c2265a86b1b07a3dcb012046ec2c85e658c1919660883641ad8e14b4321783dcf1ee
6e2369bd-8383-452c-bfc6-90fc11b584fa	Yasmine Harris	yasmine.harris@email.com	5678901234	a7a4d9b31dc51ae5eeca5f1c1b060fedd784ff9140ccbc36adcecded0b5eb7a41c7abce6fec68c886b59d176bdd2147480694fb36204002dd2e047f8ff8a8de0
2fb58e0e-ee65-4c73-a37b-22897042b371	Zara Ali	zara.ali@email.com	6789012345	cde29224871f54cbd37d0845d1af5759b95030f28e735e446cf8004663a99e13e36b017dc42879bd23f1ed70a031602a69a60bd2d3eef8fdb7bdaeaad17be75b
98eb3c12-2efb-4450-a6c3-00e4ffc38775	Aarav Patel	aarav.patel@email.com	7890123456	4539f4ecc78a8b7d79fc08b01721ff110b065ccef3a621fd60937f5fa5bd25ae6450001d300186fdaf240e6f1fede180403c2366a3b75a1074e85078eee1657f
0d3bc669-386d-4b01-b18b-9c570413c9ea	Bella Nguyen	bella.nguyen@email.com	8901234567	300f6bcf0f338c9a564e69370f5d3850c5aec68a9ab596669b7e271ec025420b00dfad9e73ef794e1e0d6cd1ebaf54fada8f0543b84780b688809d6577a44a57
451aa693-4f56-4f9a-a382-8385c020ab4d	Charlie Rossi	charlie.rossi@email.com	9012345678	391c1eaced20007764ac3f3f88ac213881c424f3108fe985341e2a687971c1873a08a2ea787ff96f406080fcbbfd58a37d0cf54e45fc9921610879955435c494
dbff6191-a86f-499d-babf-92af4fa2c85a	Eli Mendez	eli.mendez@email.com	1234567890	d1bf4c98c29869142d401b6f7e246622d09f594c0d7b7a5a6a7415efd02bfae342bc1d4d4f03f02ebb2b775a90230d93f9ddf44214272b3df232d27d4579ca80
2e668dc6-2890-4f2c-b312-40486f8f2db7	Fiona Singh	fiona.singh@email.com	2345678901	0d21ea517c4d14a748c2584af1d133b9ada30d661f33ad6bbf609b22fdef9c0aea8a7d48e925064bea78dfce200b4e141be135306c0cc0a0fe10f9a668926696
8b700b58-6610-4d6e-ac38-996c379ad279	Grace White	grace.white@email.com	3456789012	c9c16701df4354da8c5961ef5181aac41139d5309da992453383f09e947ee86c7da0e94143543b87cb788417d2dd51b12e16317e4c4e827ed940cc021b41459c
b5dfea2a-70e8-4a06-87d8-ef2284318e29	Hana Kim	hana.kim@email.com	4567890123	51cb11bb6a2400bfa3bf2b8f5cb7f2424a94ec4b7063cc8d84c747d3b6e70b177b43725cf5d3109e54583bed47ccdbb2eadcdb84baec25590adb659c33f6d115
46eb13fb-a72a-43d3-8a7e-ce78e4fd2b55	Ibrahim Ali	ibrahim.ali@email.com	5678901234	8fa92b26767dd329f54c9da0a063a33ec26ee18588068686a64e71deef68c2a29ba4348291f086571033ead48b5ab1708d14fef461e60a58ddbe5125d12d44f8
d6e64511-8c20-4ef5-b231-2569298ebf75	Jasmine Patel	jasmine.patel@email.com	6789012345	1895a2c162d546218cd9b260795e20225f607a2c29e9c896db8e1efa8eaa5fa75ad8b66ed3cc2fe2d86b28c56008f14b44a77978d1b32ad316163b428c7c8864
a930580e-85e4-41c6-b94e-c384758c77d5	Karen Lopez	karen.lopez@email.com	7890123456	e2c21ce05475c725b0db9b5e57627c0d28c3008578d12b07fd902cddd6ca5ce9340e7c10e2ecd2a089ab17e637ffd3bfc401ed8454394c2d5476422b031510c8
860c108f-3c13-4707-b86a-0ac22d908e4a	Leo Mendez	leo.mendez@email.com	8901234567	94eda5b730c4fe1c27cd6993b9a7ea1d448948941bee8c82ed03478dde84a910012156023382b7d69a5c0a651cbfb3cdcf1f375b3c61706276db3368d23db74e
5423e205-bf2c-4fe2-8b73-00f243a32e09	Mira Singh	mira.singh@email.com	9012345678	928a48ddc19829c5e7a0cc367b727d37fdaf0ec836f725ed9c9bda48dbd668137b8b244d38b02e95b692f2695ceeacab6d1b339e1c901f3747aa9858b4ab9cf5
17cb5a17-4e17-4fd1-993f-77be464cc9a0	Oliver Thompson	oliver.thompson@email.com	1234567890	d2e900573ceda55d7ed25e264e0d945e37b9d4acc8014c31c8aa5fd9722e451ab39cb24dcdf3ae23f4b2faf81daa43816f653761db0fa31466398a45f1c559f1
d19f413c-5861-47e2-988e-5f66eded4b89	Phoebe Wilson	phoebe.wilson@email.com	2345678901	6814ffc683f745a94842726b05c13247cb5a5553b153d9ea709e46815f649b9cc28c56e36282e0f8a1d2808567221cb0c18b8b0a32e0196d3dd13d586f8ce4da
cf7c80f5-452f-4b93-bdfc-4335be84361a	Amina Yusuf	amina.yusuf@email.com	3579842101	931e017924f3f14da993dfe8ddb788eaf5de424f72bc148c0806062fd12bc278114e1f7d2a0e5b31e2bffa482ffbe7919e47c42c462e0d23e717015cd1199926
36db0b07-bbae-484d-b737-1f2563643a66	Bao Nguyen	bao.nguyen@email.com	4680953210	3b65d04e676b94454eb82b114f6bb89ffb0fb8c8218f8eb674d65a1a2a8f2cf156545e5a4eb86f1aba0d49c0e1f8f95d63dbee577334174452d4b0f5edf858b4
b03f7dd9-1722-44d9-8846-e1f3d660362e	Chen Guo	chen.guo@email.com	5791064321	5d15fae7b8526d83a66020010729b9acef969140d562744b5e559805a2087a869ec3ca8762eb483124bcb6225627fd0389d341a8521c842347550ede3a6a3fbe
2472c0ed-f526-495d-8612-41ad85f8d495	Diana Gomez	diana.gomez@email.com	6802175430	6ce1201df8c7d69d58e457d8f1ca3c19378287b618860e0c599403ed94b707e85a2829cd460efb2d37c5b389e92afe8dc6850d5d3563b6652ffd7be8b2775bfd
3e5bd280-7b4e-4b0a-b4d8-e5aaa327acc2	Eduardo Mendoza	eduardo.mendoza@email.com	7913286540	73f3e49ec6bca05fcf40dd519e1a76b0f98e6fde19a443a7f7463cb7122946217e4595803e7d33a0a5f57a1105fe7c95d08f29df4a9934176f4df1a3730b85e4
f119d3e6-cd9b-4e81-9e7d-d6e250235b9a	Fiona	fiona.oconnell@email.com	8024397650	737b25b7e361b0ceb2f06173054542f48c01eef57c7cbb149ffa08c64dc9c72e484580e6acb7dfbd58cda377e63bbc7542ce3cf53dda63c294055de56307054f
4b331f59-c165-4f67-a856-ff17536dc472	Gabriel Kim	gabriel.kim@email.com	9135408760	8fa341c29c0f4d0ad6b8c79ea2e3082305aca2e70b89c364d7941ed704968554377bc25b912c225ca57986bb70c0f0762d2e0bc0f3efeaa732e2ba07e7f87139
823e8044-7a40-4d73-b701-c37bb4559fcb	Hana Ahmed	hana.ahmed@email.com	1234567890	6ae38897983cbf96dbb6c5744ccb822974635bd2098b22a43d2303fe6a42997be71ec49656b1da1a7e1a2f32ad0ac4efdd54dbe5f87952646f9de56eb66c718c
70b8c6b2-7a75-4693-b933-24fd33100f0c	Ibrahim Nguyen	ibrahim.nguyen@email.com	2345678901	b1731f1b7270035948aa0db7a54b16f6ece0481c02dae0e7bdef8f5122981a74376db270358476c7bd6764b4ceb080ddbe8bf9a29060e4c4823bd9b1484fd1ca
e02d58e1-192c-4eb3-b201-9f28e32fb4e3	Jasmine Guo	jasmine.guo@email.com	3456789012	b3a0a3b5a99fda82b0bf18c916b650771c9aa45c632c29ab86d9ecfc0c7ec9053273078366bfb4ce34d82c1d9067f78d8f6810746701e73aae64cb27abb8346c
20bc30b2-585e-4a3a-a06d-362cf5cf209f	Karen Mendoza	karen.mendoza@email.com	4567890123	688a6eae019d5649390844a4cfc6936e0d5f37183e77bdff2581c71ed74575f47154a1d7241903006e1b47063553b6ad77692ec642a94f99c38a44101d12859a
01ec8825-4941-4515-bc9a-7be6fd823774	Leo Kim	leo.kim@email.com	5678901234	8533f70def44609ffebea8c557796071b7b4a3ce400683de56757b7e764f767a337e4f8481030d193083298d2c7160c6793d758dc68de1eec4a23aec8c5dcaa4
537ba35f-7890-48c0-8f9f-27f773a2ef54	Sumeet	sumeetpatil20004@gmail.com	9845766118	d7181adfc2b5f4149c3ebd9b3016e1e7cb910079a98882584344179926e4db7885ed84a369e30aab904bedf5611e3991b8633269b26de990d66ab5da14171d39
\.


--
-- TOC entry 4908 (class 0 OID 32787)
-- Dependencies: 225
-- Data for Name: T2_Cart; Type: TABLE DATA; Schema: Buyer; Owner: postgres
--

COPY "Buyer"."T2_Cart" ("BuyerID", "Products") FROM stdin;
537ba35f-7890-48c0-8f9f-27f773a2ef54	\N
2f7546c3-b01e-409f-9e10-02a07485d61f	\N
d343046a-7999-4c92-8af4-4124c03e2472	\N
55cab95d-0637-4ff9-9828-ed15b3c7737f	\N
3e525f43-0408-4566-9ea6-5b092430bcdf	\N
c0e25f06-02b1-425a-94c4-229c2cbce521	\N
fd6b68f5-43a0-49a0-933b-1581484305ea	\N
b226ad46-5789-4e2e-a410-a8bc2818d33f	\N
3aad729d-464f-4fb6-8e71-2e0c47e3725f	\N
6e89dacc-3f35-4918-be59-71702e696eb5	\N
90e397c3-0983-449f-836e-efd45aedb2d4	\N
4456a9e5-9e87-4523-8c07-bc02cb658512	\N
3475e715-2a41-4295-ba55-31eb8469281c	\N
e4e87087-83e2-4e02-8338-a909cbb424c9	\N
3a2cb408-1d91-4ad4-b71b-f34fdb34ef72	\N
fd7a1ba3-87ae-4cb7-af13-8494a11961f8	\N
2137111f-b405-446e-b1bf-5c691cbfd4e8	\N
aa0b6a04-1095-4a9b-9d40-29808d0d93d0	\N
f54242d7-23ec-4fc7-8c40-e9208caaaa7b	\N
60ba0648-c8be-4787-9d06-6239c5096450	\N
50b200d2-166e-4d41-acab-4daea9838d6a	\N
7c38fb2d-90d7-40af-a4c1-0c4853e09e03	\N
9f5a02d9-f14d-4119-9b29-12e829cf22b9	\N
3ec676d3-f2b2-4928-930e-bce2c1cdbede	\N
152b6db8-b334-4910-9245-f6ecde9d5948	\N
17882d13-ea86-486d-97a8-6729ec92ef93	\N
4026dbb2-1daf-462f-a4b3-2e4b631db5ea	\N
ede221dd-6ec7-483b-a467-a61c67d56ee8	\N
43141215-0fb9-47f6-a734-a16bdb19f6e0	\N
5df2d53c-7273-4ac2-a0f0-7da5ea673eca	\N
31e74260-9be3-47c1-8576-3d46df7d3f23	\N
f6fcd2fc-682c-4d13-84bb-82771ed48a8d	\N
daf6cee8-833f-4f56-8c74-761dcd3bbcac	\N
55e6dd38-d3c4-4ec9-a74f-2313b81c8f50	\N
87a9bf52-5d46-4f67-8965-6ba2a43da96f	\N
54980f31-37d2-460c-845b-839e2cab046e	\N
b608c2a4-88b0-4490-acd4-1fa8517e7f92	\N
1e0cbcf9-e126-4edc-a38b-1405094b7547	\N
01f57fc8-96a0-40c6-85a9-4b050d3ae3cd	\N
da018be6-1574-409c-aca8-502ca5cfdbcb	\N
2cc58c8a-37da-4ec4-95b0-1032f8041647	\N
27c0f6e0-dcda-4a04-882d-c0c0fa23dee3	\N
49c31ffb-e427-4dc6-8587-00f536231b87	\N
4c86fee5-c67f-43cb-937f-c8343a362f69	\N
562ee964-7422-44cc-99b1-9a1686819d08	\N
22e9556b-57e1-4730-9049-c0ff79777cf3	\N
46168b3a-b2b3-404d-847f-d05849a04536	\N
8f8e499c-97cb-4539-8b2f-586973ab0b80	\N
c794ad24-cdb2-4635-89d6-b57d6f9ac6a5	\N
f76c17ee-f8d8-4bd6-afe5-d84d3d944443	\N
a72629fd-6de0-422f-bbe8-97ca806b34a1	\N
c12bfd0d-0690-44f4-ab3e-ac5278bae912	\N
d96ff15b-889c-42b8-8360-ccc348d80cbe	\N
9678efad-e579-4ab5-bce0-6f9927a392b3	\N
b9dca593-b12a-46f7-86b3-878612375ce3	\N
89e76a24-c3fd-4a49-a8f0-97c640430a0f	\N
090f44e1-31c7-49fa-a3ca-e027b70da801	\N
285c609b-fd4b-4a08-999b-7c5dc7c95f53	\N
dc5a4750-f3d1-4eb1-9af7-b8ccb2b4af43	\N
c29272d3-4036-4846-9c9c-9cfb9c385906	\N
7a2eb455-0a1c-4141-a9ea-f0a54c9ccb2a	\N
96010001-c2c7-4592-a752-73b6728a3ac7	\N
2279f382-d322-4410-a1f3-35398f6ebc02	\N
e5248270-9705-4eb7-a5f4-e9237e95aee7	\N
db30c441-7a7a-4fa7-aac3-35a1cb1cb21d	\N
c9742fac-fd97-4270-b14e-c61f26ab7fcc	\N
f75782f6-fd4d-4c16-996f-f4fc1bcef6a9	\N
6e2369bd-8383-452c-bfc6-90fc11b584fa	\N
2fb58e0e-ee65-4c73-a37b-22897042b371	\N
98eb3c12-2efb-4450-a6c3-00e4ffc38775	\N
0d3bc669-386d-4b01-b18b-9c570413c9ea	\N
451aa693-4f56-4f9a-a382-8385c020ab4d	\N
dbff6191-a86f-499d-babf-92af4fa2c85a	\N
2e668dc6-2890-4f2c-b312-40486f8f2db7	\N
8b700b58-6610-4d6e-ac38-996c379ad279	\N
b5dfea2a-70e8-4a06-87d8-ef2284318e29	\N
46eb13fb-a72a-43d3-8a7e-ce78e4fd2b55	\N
d6e64511-8c20-4ef5-b231-2569298ebf75	\N
a930580e-85e4-41c6-b94e-c384758c77d5	\N
860c108f-3c13-4707-b86a-0ac22d908e4a	\N
5423e205-bf2c-4fe2-8b73-00f243a32e09	\N
17cb5a17-4e17-4fd1-993f-77be464cc9a0	\N
d19f413c-5861-47e2-988e-5f66eded4b89	\N
cf7c80f5-452f-4b93-bdfc-4335be84361a	\N
36db0b07-bbae-484d-b737-1f2563643a66	\N
b03f7dd9-1722-44d9-8846-e1f3d660362e	\N
2472c0ed-f526-495d-8612-41ad85f8d495	\N
3e5bd280-7b4e-4b0a-b4d8-e5aaa327acc2	\N
f119d3e6-cd9b-4e81-9e7d-d6e250235b9a	\N
4b331f59-c165-4f67-a856-ff17536dc472	\N
823e8044-7a40-4d73-b701-c37bb4559fcb	\N
70b8c6b2-7a75-4693-b933-24fd33100f0c	\N
e02d58e1-192c-4eb3-b201-9f28e32fb4e3	\N
20bc30b2-585e-4a3a-a06d-362cf5cf209f	\N
01ec8825-4941-4515-bc9a-7be6fd823774	\N
\.


--
-- TOC entry 4909 (class 0 OID 32794)
-- Dependencies: 226
-- Data for Name: T3_Registered; Type: TABLE DATA; Schema: Buyer; Owner: postgres
--

COPY "Buyer"."T3_Registered" ("BuyerID", "AddressLine-01", "AddressLine-02", "AddressLine-03", "City", "State", "PinCode", "Blocked") FROM stdin;
537ba35f-7890-48c0-8f9f-27f773a2ef54	BEML Layout			Bengaluru	Karnataka	560098	f
22e9556b-57e1-4730-9049-c0ff79777cf3	123 Main St	Apt 4B		New York	NY	10001	f
46168b3a-b2b3-404d-847f-d05849a04536	456 Elm St			Chicago	IL	60601	f
c794ad24-cdb2-4635-89d6-b57d6f9ac6a5	23 Maple Ave			Houston	TX	77001	f
f76c17ee-f8d8-4bd6-afe5-d84d3d944443	56 Pine St			Phoenix	AZ	85001	f
a72629fd-6de0-422f-bbe8-97ca806b34a1	89 Cedar Blvd			Philadelphia	PA	19101	f
c12bfd0d-0690-44f4-ab3e-ac5278bae912	13 Birch Lane			San Antonio	TX	78201	f
d96ff15b-889c-42b8-8360-ccc348d80cbe	45 Willow Way			Jacksonville	FL	32001	f
9678efad-e579-4ab5-bce0-6f9927a392b3	78 Cypress Cir			Fort Worth	TX	76101	f
b9dca593-b12a-46f7-86b3-878612375ce3	101 Magnolia Manor			Columbus	OH	43001	f
89e76a24-c3fd-4a49-a8f0-97c640430a0f	222 Cherry Ct			San Diego	CA	92001	f
090f44e1-31c7-49fa-a3ca-e027b70da801	333 Palm Pl			Dallas	TX	75201	f
285c609b-fd4b-4a08-999b-7c5dc7c95f53	444 Magnolia Mews			San Jose	CA	95101	f
dc5a4750-f3d1-4eb1-9af7-b8ccb2b4af43	555 Cedar Crest			Austin	TX	78701	f
c29272d3-4036-4846-9c9c-9cfb9c385906	666 Birch Blvd			Denver	CO	80201	f
7a2eb455-0a1c-4141-a9ea-f0a54c9ccb2a	777 Willow Way			Seattle	WA	98101	f
96010001-c2c7-4592-a752-73b6728a3ac7	888 Cherry Ct			Miami	FL	33001	f
2279f382-d322-4410-a1f3-35398f6ebc02	1010 Magnolia Mews			Atlanta	GA	30301	f
e5248270-9705-4eb7-a5f4-e9237e95aee7	1111 Cedar Crest			Charlotte	NC	28201	f
db30c441-7a7a-4fa7-aac3-35a1cb1cb21d	1212 Birch Blvd			Minneapolis	MN	55401	f
c9742fac-fd97-4270-b14e-c61f26ab7fcc	1313 Willow Way			Portland	OR	97201	f
f75782f6-fd4d-4c16-996f-f4fc1bcef6a9	1414 Cherry Ct			Las Vegas	NV	89101	f
6e2369bd-8383-452c-bfc6-90fc11b584fa	1515 Palm Pl			Detroit	MI	48201	f
2fb58e0e-ee65-4c73-a37b-22897042b371	1616 Magnolia Mews			Philadelphia	PA	19101	f
98eb3c12-2efb-4450-a6c3-00e4ffc38775	1717 Cedar Crest			San Antonio	TX	78201	f
0d3bc669-386d-4b01-b18b-9c570413c9ea	1818 Birch Blvd			Jacksonville	FL	32001	f
451aa693-4f56-4f9a-a382-8385c020ab4d	1919 Willow Way			Houston	TX	77001	f
dbff6191-a86f-499d-babf-92af4fa2c85a	2020 Cherry Ct			Miami	FL	33001	f
2e668dc6-2890-4f2c-b312-40486f8f2db7	2121 Palm Pl			Los Angeles	CA	90001	f
8b700b58-6610-4d6e-ac38-996c379ad279	2222 Magnolia Mews			New York	NY	10001	f
b5dfea2a-70e8-4a06-87d8-ef2284318e29	2323 Cedar Crest			Chicago	IL	60601	f
46eb13fb-a72a-43d3-8a7e-ce78e4fd2b55	2424 Birch Blvd			Phoenix	AZ	85001	f
d6e64511-8c20-4ef5-b231-2569298ebf75	2525 Willow Way			San Jose	CA	95101	f
a930580e-85e4-41c6-b94e-c384758c77d5	2626 Cherry Ct			Dallas	TX	75201	f
860c108f-3c13-4707-b86a-0ac22d908e4a	2727 Palm Pl			Denver	CO	80201	f
5423e205-bf2c-4fe2-8b73-00f243a32e09	2828 Magnolia Mews			Seattle	WA	98101	f
17cb5a17-4e17-4fd1-993f-77be464cc9a0	3030 Cherry Ct			Atlanta	GA	30301	f
d19f413c-5861-47e2-988e-5f66eded4b89	3131 Palm Pl			Charlotte	NC	28201	f
cf7c80f5-452f-4b93-bdfc-4335be84361a	3232 Birch Blvd			Detroit	MI	48202	f
36db0b07-bbae-484d-b737-1f2563643a66	3333 Willow Way			Houston	TX	77002	f
b03f7dd9-1722-44d9-8846-e1f3d660362e	3434 Cherry Ct			Miami	FL	33002	f
2472c0ed-f526-495d-8612-41ad85f8d495	3636 Magnolia Mews			Chicago	IL	60602	f
3e5bd280-7b4e-4b0a-b4d8-e5aaa327acc2	3737 Birch Blvd			San Francisco	CA	94101	f
f119d3e6-cd9b-4e81-9e7d-d6e250235b9a	3838 Willow Way			Miami	FL	33003	f
4b331f59-c165-4f67-a856-ff17536dc472	3939 Cherry Ct			Phoenix	AZ	85002	f
823e8044-7a40-4d73-b701-c37bb4559fcb	4040 Palm Pl			Seattle	WA	98102	f
70b8c6b2-7a75-4693-b933-24fd33100f0c	4141 Magnolia Mews			Dallas	TX	75202	f
e02d58e1-192c-4eb3-b201-9f28e32fb4e3	4242 Birch Blvd			Denver	CO	80202	f
20bc30b2-585e-4a3a-a06d-362cf5cf209f	4343 Willow Way			San Jose	CA	95102	f
01ec8825-4941-4515-bc9a-7be6fd823774	4444 Cherry Ct			Atlanta	GA	30302	f
8f8e499c-97cb-4539-8b2f-586973ab0b80	789 Oak St			Los Angeles	CA	90001	t
\.


--
-- TOC entry 4905 (class 0 OID 24595)
-- Dependencies: 222
-- Data for Name: T1_Product_Information; Type: TABLE DATA; Schema: Product; Owner: postgres
--

COPY "Product"."T1_Product_Information" ("ProductID", "SellerID", "DateOfCreation", "Qty", "OutOfStock", "Active", "Name", "UnitPrice", "Type", "Material", "Discount", "Description", "CategoryID", "Blocked") FROM stdin;
fa94506f-3540-4737-ab57-708fcdc2efc8	8cc202e9-f2e0-4a78-963d-7e95a38755e8	2022-03-15	50	No	Yes	Smartwatch Pro	129.99	Wearable	Plastic,Glass,Metal	0.0	A sleek and stylish smartwatch with advanced features. Compatible with both iOS and Android. \n\nFeatures: \n- Heart rate monitor \n- GPS tracking \n- Sleep analysis \n- Call and message notifications \n- Music control \n- 5ATM water resistance \n- Long battery life \n- Wireless charging \n\nColor options: Black, Silver, Rose Gold \n\nSize: 1.6 inches \n\nCompatibility: Bluetooth 5.0, Wi-Fi, NFC \n\nBattery: 300mAh \n\nWeight: 45 grams \n\nDimensions: 46.6 x 46.6 x 13.5 mm \n\nBox contents: Smartwatch, Charging cable, User manual \n\nWarranty: 1 year \n\nPackage dimensions: 10 x 10 x 2 cm \n\nShipping weight: 50 g \n\nManufacturer: Tech Innovations Inc. \n\nCountry of origin: China \n\nSKU: SWP-BK \n\nBrand: Smartwatch Pro \n\nRating: 4.5/5 \n\nCustomer reviews: 1000 \n\nPrice: $129.99 \n\n	c97e0d6c-fb7d-45ed-8318-8550a36c78de	f
4bee4f14-5272-4c2a-8f02-6ca773ed8320	c077ae5a-4fd3-4a15-a600-27c68df00716	2022-03-17	75	No	Yes	Eco-Friendly Handbag	49.99	Accessory	Recycled Leather,Cotton Lining	10.0	A stylish and sustainable handbag made from recycled leather and cotton lining. \n\nFeatures: \n- Spacious main compartment \n- Adjustable shoulder strap \n- Two side pockets \n- One internal pocket \n- Zip closure \n- Vegan-friendly \n\nSize: 12 x 10 x 6 inches \n\nColor options: Brown, Black, Grey \n\nWeight: 1.5 lbs \n\nDimensions: 30.5 x 25.4 x 15.2 cm \n\nBox contents: Handbag, Dust bag, User manual \n\nWarranty: 1 year \n\nPackage dimensions: 12 x 10 x 6 inches \n\nShipping weight: 1.5 lbs \n\nManufacturer: Green Fashion Co. \n\nCountry of origin: Vietnam \n\nSKU: HB-RE \n\nBrand: Eco-Friendly Handbag \n\nRating: 4.3/5 \n\nCustomer reviews: 800 \n\nPrice: $49.99 \n\n	12d8bb4d-ba18-4193-94e5-854342c1dec0	f
fc8b3521-3468-45e5-9482-98fa06f89248	a455cef0-0c1b-4d5e-b4ca-81f6f94cb425	2022-03-18	25	Yes	Yes	Stainless Steel Coffee Maker	69.99	Appliance	Stainless Steel	0.0	A high-quality stainless steel coffee maker with a sleek and modern design. \n\nFeatures: \n- 12-cup capacity \n- Programmable timer \n- Permanent filter \n- Auto-shutoff \n- Removable water reservoir \n- Dishwasher-safe \n\nSize: 12 x 7 x 10 inches \n\nWeight: 3.5 lbs \n\nDimensions: 30.5 x 18 x 25.4 cm \n\nBox contents: Coffee maker, User manual \n\nWarranty: 2 years \n\nPackage dimensions: 12 x 7 x 10 inches \n\nShipping weight: 3.5 lbs \n\nManufacturer: Coffee Maker Inc. \n\nCountry of origin: Taiwan \n\nSKU: CM-SS \n\nBrand: Stainless Steel Coffee Maker \n\nRating: 4.7/5 \n\nCustomer reviews: 600 \n\nPrice: $69.99 \n\n	87c909f9-72fc-44f9-b5fc-b59845a3357a	f
0fa5a535-e78a-4cd1-947f-02c1ef91e697	4f350e3a-93d7-4547-b17f-697e6958b1b3	2022-03-19	100	No	Yes	Portable Camping Stove	39.99	Gadget	Aluminum,Stainless Steel	0.0	A lightweight and portable camping stove perfect for outdoor adventures. \n\nFeatures: \n- Foldable design \n- Compact size \n- Easy-to-use piezo ignition \n- Adjustable heat control \n- Wind-resistant \n- Boil water in minutes \n- Dishwasher-safe \n\nSize: 8 x 7 x 3 inches \n\nWeight: 1.5 lbs \n\nDimensions: 20.3 x 17.8 x 7.6 cm \n\nBox contents: Stove, User manual \n\nWarranty: 1 year \n\nPackage dimensions: 8 x 7 x 3 inches \n\nShipping weight: 1.5 lbs \n\nManufacturer: Outdoor Gear Co. \n\nCountry of origin: Indonesia \n\nSKU: CS-P \n\nBrand: Portable Camping Stove \n\nRating: 4.4/5 \n\nCustomer reviews: 1200 \n\nPrice: $39.99 \n\n	9fbbe97c-9bcd-49a0-9618-1b70da1001cc	f
3ba678bc-4cfd-44b6-8393-dcfac3c6b44e	bf3cb7f7-3243-4303-988c-a34278604185	2022-03-20	50	No	Yes	STEM Building Kit	49.99	Educational	Plastic,Metal	0.0	An engaging and educational STEM building kit for children, fostering creativity and problem-solving skills. \n\nFeatures: \n- 500+ building pieces \n- 150+ challenges \n- 20+ models to build \n- Encourages critical thinking \n- Boosts creativity \n- Develops fine motor skills \n- Adjustable difficulty levels \n\nSize: 12 x 10 x 6 inches \n\nWeight: 2.5 lbs \n\nDimensions: 30.5 x 25.4 x 15.2 cm \n\nBox contents: Building kit, User manual \n\nWarranty: 1 year \n\nPackage dimensions: 12 x 10 x 6 inches \n\nShipping weight: 2.5 lbs \n\nManufacturer: Kids Play Co. \n\nCountry of origin: Mexico \n\nSKU: BK-ST \n\nBrand: STEM Building Kit \n\nRating: 4.6/5 \n\nCustomer reviews: 900 \n\nPrice: $49.99 \n\n	6e7f7ef9-a32a-43a0-8477-5f2dbc17a08e	f
5b31cd4e-a31f-46d8-a569-e202637b62a6	99021480-7d96-4551-a890-5ebf866af2d8	2022-08-15	25	No	Yes	Smartwatch Pro	129.99	Wearable	Stainless Steel	0.0	A sleek and stylish smartwatch with advanced features like heart rate monitor, GPS, and waterproof design. Perfect for fitness enthusiasts and tech lovers. Compatible with both iOS and Android devices. Designed for all-day wear, this smartwatch is a must-have accessory. Powered by a long-lasting battery, it can last up to 5 days on a single charge.	c97e0d6c-fb7d-45ed-8318-8550a36c78de	f
f6f3b843-cd32-416e-b652-7571356c761a	be857b49-9e19-4095-9346-6386076a1713	2022-06-24	17	No	Yes	Wireless Earbuds	149.99	Audio Equipment	Plastic	0.0	A pair of wireless earbuds with noise cancellation, touch controls, and a charging case. Available in black, white, and pink.	ac9c9e1f-59d1-47c2-9f04-7e9963342b57	f
3d5d4d86-c106-43e0-a48f-b9350bb8c3fd	3e330c7e-46b2-4040-bd86-68e474f1ca9f	2022-06-01	25	No	Yes	Elena Rodriguez	19.99	Dress	Cotton	0.0	Elena Rodriguez, a talented fashion designer from Mexico, introduces her latest creation - a stunning cotton dress with intricate embroidery. The dress features a flattering A-line silhouette, adjustable straps, and a knee-length hemline. Perfect for any occasion, this dress is sure to make a statement. Available in sizes S-XL. \n\nInspired by traditional Mexican textiles, Elenas design brings a fresh and modern twist to the classic dress. The intricate embroidery is done by hand, showcasing the artistry and craftsmanship of Mexican artisans. \n\nElenas dress is not only beautiful but also comfortable, made from soft and breathable cotton. It is machine washable and easy to care for, making it a practical and versatile addition to any wardrobe.	12d8bb4d-ba18-4193-94e5-854342c1dec0	f
ddfc4685-d409-4bdb-b1fe-0678fd6d27dd	51085a97-1b1f-4b34-b9b7-52b79261b337	2022-05-15	50	No	Yes	Smartwatch	199.99	Device	Plastic,Glass,Metal	0.0	A sleek and stylish smartwatch with advanced fitness tracking features. Powered by a fast processor and long-lasting battery. Suitable for both Android and iOS devices. Compatible with various strap sizes. Designed for fitness enthusiasts and tech-savvy individuals.	c97e0d6c-fb7d-45ed-8318-8550a36c78de	f
28fce326-5e44-4a0f-82ec-25cef1a1e1f1	8f3a593e-e5d4-4976-9340-67299afcee0f	2022-05-17	20	No	Yes	Air Fryer	99.99	Kitchen Appliance	Stainless Steel	0.0	A compact and versatile air fryer with a digital touchscreen control panel. Cooks food using hot air instead of oil for healthier meals. Features 7 preset cooking functions and a 3.7-quart capacity. Perfect for small kitchens and families. Easy to clean with dishwasher-safe parts.	f3b6bd93-4ed3-47e3-b98a-bf720be3e658	f
2b97df86-238c-483f-a8ca-f3061fd33a78	30e74332-1db0-4798-a530-15c265ab49e0	2022-05-18	30	No	Yes	Linen Blend Shirt	34.99	Clothing	Linen,Cotton	0.0	A comfortable and breathable linen blend shirt for men. Features a classic fit, long sleeves, and a button-down collar. Machine washable and quick-drying. Ideal for casual occasions and warm weather. Available in various sizes from S to XXL.	12d8bb4d-ba18-4193-94e5-854342c1dec0	f
cbb20af8-0b8c-4bf4-b6b1-989571f58686	c23d08b7-f930-4447-9458-ecb6de94610f	2022-03-22	9	No	Yes	Yoga Mat	39.99	Equipment	Eco-Friendly	0.0	A high-quality yoga mat made from eco-friendly materials, perfect for practicing yoga at home or on the go.	1d72814f-6daf-458d-a3c1-1a423dcee2f4	f
27d6a75b-e2f3-43a7-905f-ca74cbcdfae8	646ca2ce-d117-47ea-b6a4-c1c1cea2bae8	2022-05-20	40	No	Yes	Building Blocks Set	14.99	Educational Toy	Plastic	0.0	A colorful and engaging building blocks set for children. Contains 100 pieces of different shapes and sizes. Encourages creativity, problem-solving, and fine motor skills development. Suitable for children aged 18 months and above. Complies with safety standards and made from non-toxic materials.	05cec91d-f1ac-4db5-af0b-f3a441c1d0be	f
756a1a23-92cd-4d21-af9d-abcf27c9a0b2	b14aec21-cf75-4ed2-9b37-16f42088e940	2022-05-22	50	No	Yes	Board Game	29.99	Tabletop Game	Cardboard,Plastic,Paper	0.0	A fun and challenging board game for 2-6 players. Contains 60 cards, 1 game board, and 4 player markers. Promotes strategic thinking, memory, and communication skills. Suitable for ages 8 and above. Easy to learn and play in under 30 minutes.	6d574b8e-1cec-48b7-ba43-219d494bff51	f
01329618-f9d9-4ce3-956f-1490d3bd4862	9655ff52-9979-4497-8da5-a163a340b608	2022-05-24	20	No	Yes	Cookbook	19.99	Hardcover Book	Paper,Cover	0.0	A beautifully illustrated cookbook featuring 100 vegetarian recipes from around the world. Includes easy-to-follow instructions, nutritional information, and full-color photography. Suitable for vegetarians, vegans, and anyone interested in plant-based cuisine. Makes a great gift for foodies and home cooks.	24df1d24-5cf0-4b92-8852-6aef1652f7cf	f
a9858e15-75a9-422b-a1c9-691a22601da9	6d1cc2c6-d1cf-4f70-878b-7198c74f5f37	2022-05-26	30	No	Yes	Yoga Mat	24.99	Fitness Equipment	Rubber	0.0	A high-quality and durable yoga mat made from eco-friendly materials. Provides excellent grip, comfort, and stability for yoga, Pilates, and other floor exercises. Features a non-slip texture, open-cell surface, and a carrying strap. Perfect for home use and travel. Available in various colors.	5923a55e-7a75-40ca-b167-c78efaf90021	f
31ae5e6b-125a-47a6-aee8-d52ccc4f9365	852956cd-23fb-479e-bdbf-51bee767f8eb	2022-05-28	40	No	Yes	Painting Set	14.99	Art Supplies	Acrylic Paints,Brushes,Palette	0.0	A complete painting set for beginners and kids. Contains 12 acrylic paints, 3 flat brushes, and 1 palette. Encourages creativity, self-expression, and fine motor skills development. Suitable for children aged 5 and above. Non-toxic and washable. Complies with safety standards.	912ac7af-7501-4900-8aa3-7ee6d537aa49	f
fbc382bd-fb82-4c77-b586-3cd042245c66	138de16f-ab44-4c7d-a01a-93047c799f8e	2022-05-30	50	No	Yes	Portable Speaker	39.99	Electronic Device	Plastic,Rubber	0.0	A compact and portable Bluetooth speaker with powerful sound and long battery life. Features a waterproof design, voice assistant compatibility, and various connectivity options. Suitable for outdoor activities, parties, and travel. Available in various colors.	dc62f2b4-963c-4df7-ad3d-d3bafcf2ba21	f
b9ecf71c-5ade-42d8-9fa4-41b11b112588	b98fa83f-9ee6-4d13-b1e9-298f265b5b94	2022-06-01	60	No	Yes	Lip Balm	4.99	Cosmetic	Shea Butter,Beeswax,Vitamin E	0.0	A nourishing and hydrating lip balm made from natural ingredients. Contains shea butter, beeswax, and vitamin E. Provides long-lasting moisture, softens and smooths lips, and protects from sun damage. Suitable for all ages and skin types. Cruelty-free and vegan.	6f08d013-3c39-400e-9622-b34aeb9d5392	f
7b87c8f3-fbf7-4007-ac62-63b558d888c7	54ba0380-1c4c-466d-be80-a8ce8f55413a	2022-06-03	70	No	Yes	Organic Coffee	14.99	Ground Coffee	Coffee Beans	0.0	A rich and aromatic organic coffee blend made from 100% Arabica beans. Roasted in small batches for optimal freshness and flavor. Contains no additives, preservatives, or chemicals. Suitable for coffee lovers and health-conscious individuals. Complies with fair trade and organic farming practices.	f66f0ce5-5ecb-4582-9aba-a1c16e502eed	f
ce299367-a507-4258-ba0b-3b529494ed22	6889a995-448d-462e-9157-dfaf5c2e7efc	2022-06-05	80	No	Yes	Seed Packets	2.99	Planting Supplies	Paper,Envelope	0.0	A collection of 12 seed packets for various flowers and vegetables. Contains easy-to-grow varieties suitable for beginners and children. Encourages gardening, sustainability, and self-sufficiency. Suitable for indoor and outdoor use. Complies with organic gardening practices.	1e40d17a-3638-4149-bc0c-f6532f996605	f
ffb8bc35-10a7-4b94-bb61-a4230f275226	7c1db55e-acc4-458b-872d-56978ec3d29b	2022-05-01	15	No	Yes	Smartwatch Pro	299.99	Device	Aluminum Alloy, Glass Fiber Reinforced Polymer	0.0	A sleek and stylish smartwatch with advanced health tracking features, long battery life, and customizable straps. Available in various colors.\n\nDesign: Slim bezel, 1.3-inch touchscreen display, 46mm diameter, 12mm thick, 51g weight.\n\nDisplay: Always-on retina AMOLED display, 454x454 resolution, 326 ppi, 1000 nits peak brightness.\n\nBattery: 410mAh, up to 7 days on a single charge.\n\nSensors: Accelerometer, gyroscope, heart rate sensor, SpO2 sensor, ECG sensor, barometric altimeter, compass, GPS.\n\nConnectivity: Bluetooth 5.2, Wi-Fi, NFC, GPS, 4G LTE (optional).\n\nWater resistance: IP68, 5ATM.\n\nOperating system: Wear OS by Google, compatible with Android 6.0+ and iOS 14.0+.\n\nAdditional features: Google Assistant, Google Pay, music storage and playback, call and text notifications, custom watch faces, customizable straps, sleep tracking, activity tracking, stress tracking, heart rate variability tracking, menstrual cycle tracking, weather information, Google Fit integration, and more.	c97e0d6c-fb7d-45ed-8318-8550a36c78de	f
428dd146-f902-4984-a3b1-c5ac1c00c131	e01ce6f8-aaef-48ad-84bb-feea345710f6	2022-03-15	12	No	Yes	Smartwatch Pro	249.99	Device	Metal	0.0	A sleek and stylish smartwatch with advanced fitness tracking features. Suitable for both Android and iOS devices.	c97e0d6c-fb7d-45ed-8318-8550a36c78de	f
c080de1f-f2b8-49be-9306-b6076d7027df	1a8fc549-1248-4f8c-a6ef-f0a5b31243bd	2022-03-16	7	No	Yes	Eco-Friendly Tote Bag	29.99	Accessory	Recycled Fabric	0.0	A spacious and durable tote bag made from recycled materials. Perfect for daily use and reducing plastic waste.	12d8bb4d-ba18-4193-94e5-854342c1dec0	f
b9904a4e-3a07-40ea-8855-4dfa108da014	fa520daf-5d4d-4895-98b0-733a9240313c	2022-03-17	15	No	Yes	Portable Induction Cooktop	129.99	Appliance	Stainless Steel	0.0	A compact and energy-efficient induction cooktop for quick and easy meal preparation.	87c909f9-72fc-44f9-b5fc-b59845a3357a	f
705cbe7d-7c3e-432a-8366-0a5d38b169d5	92a3e8d7-8d62-4841-89d0-4fd7d234b048	2022-03-18	6	No	Yes	Hydration Pack	79.99	Gear	Durable Fabric	0.0	A versatile hydration pack with a large capacity and multiple storage compartments. Ideal for hiking, biking, or other outdoor activities.	9fbbe97c-9bcd-49a0-9618-1b70da1001cc	f
93d35c78-8d0d-4e9c-81dd-595b2ca5a35e	a4f42cd6-09fe-4426-9553-3ad41c654c12	2022-03-19	21	No	Yes	Cooking for Beginners	19.99	Media	Paper	0.0	A comprehensive cookbook for beginners, featuring simple and delicious recipes for all occasions.	24df1d24-5cf0-4b92-8852-6aef1652f7cf	f
3fb24853-859d-40eb-a48f-c781c85b8ec2	20d00292-7050-4f3c-9506-2674896f4ead	2022-03-20	10	No	Yes	Magnetic Building Set	49.99	Toy	Plastic	0.0	A colorful and engaging magnetic building set that fosters creativity and problem-solving skills in children.	7d7a7064-7142-48a9-8d2c-07b75e3a1ae3	f
49b0317c-2783-42a2-87dd-c2f160bf7cf3	f5b60b82-813d-434e-8ce6-1139896eda98	2022-03-21	18	No	Yes	Natural Skincare Set	69.99	Product	Plant-Based	0.0	A curated set of natural skincare products, free from harsh chemicals and preservatives. Suitable for all skin types.	b9a64d28-4e7f-4163-b96c-b6d78fbaa337	f
12c9d93c-bede-43c0-b612-2510db44cd42	371be290-846b-4a84-b224-d86ecd09b6f0	2022-03-23	14	No	Yes	Smart Speaker	99.99	Device	Plastic	0.0	A versatile smart speaker with voice control, music streaming, and hands-free calling capabilities.	a70d131b-e0fe-4b32-bfb4-246ff4baad1b	f
41c6349a-ec79-4e42-beba-02ef39ccddd8	22d268a1-679d-498f-bdfb-d7cb84ad0f9c	2022-03-24	8	No	Yes	Board Game	29.99	Game	Cardboard	0.0	A classic board game that promotes strategy and teamwork, suitable for players of all ages.	6d574b8e-1cec-48b7-ba43-219d494bff51	f
5f3e7175-b3b7-4902-b38f-b4d578e532dd	14ec97b2-254a-4f41-a779-3127e947b55b	2022-03-25	5	No	Yes	Handmade Scarf	34.99	Accessory	Wool	0.0	A beautifully handcrafted scarf made from soft and warm wool, perfect for keeping warm in colder weather.	12d8bb4d-ba18-4193-94e5-854342c1dec0	f
d2481c1b-b902-4136-88b2-100b7bdfbb7e	499d9ed3-01c9-469a-8787-fec47f90b523	2022-03-26	11	No	Yes	Artisanal Coffee	14.99	Product	Bean	0.0	A premium selection of artisanal coffee beans, roasted to perfection and packed for freshness.	9697e0a5-12b2-47d6-a05c-7998afd49541	f
ef86515a-c268-4dfe-ac21-2013c9d695d0	fd6fab7a-2c53-4720-941c-de910a2c499c	2022-03-27	16	No	Yes	Portable Blender	49.99	Appliance	Stainless Steel	0.0	A powerful and portable blender for making smoothies, shakes, and more on the go.	87c909f9-72fc-44f9-b5fc-b59845a3357a	f
aef6674f-3bb7-41d2-bb4d-7fad40f3fea7	3e7fb37b-d07d-40a9-9755-30db3ab4d809	2022-03-28	4	No	Yes	Camping Stove	89.99	Gear	Stainless Steel	0.0	A lightweight and compact camping stove, perfect for cooking meals during outdoor adventures.	9fbbe97c-9bcd-49a0-9618-1b70da1001cc	f
93576520-fd15-4423-a031-b41f1a08a90d	f4f5a3da-a275-46fc-9950-6040d4dce034	2022-03-29	20	No	Yes	Mystery Novel	17.99	Media	Paper	0.0	An engaging mystery novel filled with suspense, intrigue, and unexpected twists.	24df1d24-5cf0-4b92-8852-6aef1652f7cf	f
fd2fc900-aa30-4c9e-b519-4ecbbfaa18b2	7fdb6b0d-d6a8-4fd5-8a0a-a7dbe80ccd78	2022-03-30	13	No	Yes	Building Blocks Set	34.99	Toy	Plastic	0.0	A colorful and educational building blocks set, designed to promote creativity and problem-solving skills in children.	7d7a7064-7142-48a9-8d2c-07b75e3a1ae3	f
efac8339-efac-4b1f-8dcc-9d3fca59992f	4145d81c-ec2d-4a75-aaac-e0136e9a14e4	2022-03-31	19	No	Yes	Natural Lip Balm	6.99	Product	Plant-Based	0.0	A nourishing and natural lip balm made from plant-based ingredients, suitable for all skin types.	b9a64d28-4e7f-4163-b96c-b6d78fbaa337	f
e1a0b74a-2293-435c-9dea-ddc1440f6ccd	a8877455-b5e1-4ea1-97bd-5e10daf4b5a9	2022-01-01	50	No	Yes	Smartphone X	499.99	Mobile Devices	Plastic, Glass, Metal	0.0	A sleek and powerful smartphone with a large display and long-lasting battery. Designed for multitasking and entertainment. Available in various colors. \nThis smartphone offers a premium experience, with a high-resolution camera and advanced features. It is perfect for those who want to stay connected and productive on the go. \nKey features include a powerful processor, ample storage, and fast charging. \nCompatible with major carriers and networks. \nSpecifications: 6.7-inch OLED display, 128GB storage, 5G connectivity, 48MP camera, 4000mAh battery, Android 12 OS.	c97e0d6c-fb7d-45ed-8318-8550a36c78de	f
8b8f54e3-9a78-448a-a3c0-61129ec49c7b	b394042c-ec67-4853-95e5-984b1047b7ed	2022-06-15	25	No	Yes	Smartwatch Pro	129.99	Wearable	Aluminum Alloy	5.0	Stylish and sleek smartwatch with advanced health tracking features. Compatible with both Android and iOS devices. Available in three colors: black, silver, and rose gold. Fits wrists 140-200mm in circumference.	c97e0d6c-fb7d-45ed-8318-8550a36c78de	f
c4637f2c-6521-40a1-9b02-608fc49ab02a	a7db1709-ff83-4ca2-9bce-f72933ac82bc	2022-05-15	15	No	Yes	Smartphone X1000	899.99	Mobile Devices	Plastic,Glass,Metal	0.0	A sleek smartphone with advanced features and long-lasting battery. Designed for productivity and entertainment.	c97e0d6c-fb7d-45ed-8318-8550a36c78de	f
9e951e05-94f6-4dcf-9031-445b82a2596a	6856928f-541a-48f8-99b5-93c5e8a3fa70	2022-06-01	12	No	Yes	Smart Fridge	1299.99	Refrigerators	Stainless Steel,Glass	5.0	A spacious and energy-efficient fridge with built-in smart technology for easier food management and organization.	f3b6bd93-4ed3-47e3-b98a-bf720be3e658	f
8f78b13e-bb29-4735-804e-97caf82a62bb	fb08c506-30a5-4725-bbb4-b215b773b3cb	2022-07-10	7	Yes	No	Eco-friendly T-shirt	19.99	Clothing	Organic Cotton	10.0	A stylish and sustainable T-shirt made from eco-friendly organic cotton, perfect for everyday wear.	12d8bb4d-ba18-4193-94e5-854342c1dec0	f
a61e6e3e-70a9-4702-9ce1-284de43331d0	7d1d9e2d-a868-47ed-bb8f-78df559254c6	2022-08-15	20	No	Yes	High-Performance Running Shoes	149.99	Footwear	Synthetic	0.0	Lightweight and durable running shoes designed for optimal performance and comfort.	5923a55e-7a75-40ca-b167-c78efaf90021	f
11eaf9a3-62d5-4f5d-9b1d-45bfe2d86850	2e1c5915-8ede-4946-8142-5d2d78d04b7e	2022-09-01	8	Yes	No	Heirloom Porcelain Dinnerware Set	249.99	Tableware	Porcelain	15.0	A timeless and elegant dinnerware set made from high-quality porcelain, perfect for special occasions.	09a1fc84-d87e-4b81-b905-38c47ea650f8	f
4963d9f0-120e-4d7a-b8fd-c614b497a59e	adf871d7-21c9-48a1-8f47-4fad6fb9001f	2022-10-15	18	No	Yes	The Alchemist by Paulo Coelho	9.99	Literature	Paper	0.0	An inspiring and thought-provoking novel about following ones dreams and the journey of self-discovery.	24df1d24-5cf0-4b92-8852-6aef1652f7cf	f
6c2564f9-c187-4389-9204-87184c63d30b	94c627f6-5175-4260-9ef2-43d5189c8ebe	2022-11-01	22	No	Yes	Strategy Board Game	34.99	Board Games	Wood,Cardboard	0.0	A strategic and engaging board game for players of all ages, perfect for family game nights.	6d574b8e-1cec-48b7-ba43-219d494bff51	f
70bd7046-a330-4555-8db5-5a6f40865ad2	7c00b967-9635-4419-a8c0-d42b9c2d68e1	2022-12-15	10	Yes	No	Eco-friendly Stuffed Animal	24.99	Toy	Recycled Fabric	5.0	A cuddly and eco-friendly stuffed animal made from recycled fabric, perfect for childrens playtime.	05cec91d-f1ac-4db5-af0b-f3a441c1d0be	f
9be0521f-5734-47f2-84ac-4f6a4b7f5da4	3ee4c45e-5355-4658-9bec-9b89e263a378	2023-01-01	14	No	Yes	Smart Water Bottle	39.99	Drinkware	Plastic,Stainless Steel	0.0	A smart and functional water bottle with built-in tracking technology for hydration goals.	754af6e7-84dc-4e9f-af79-3711556b43dc	f
8734e03a-5ceb-48f6-a4d4-78cddba792dc	12c3d683-eaeb-4fe8-ab65-388130db454f	2023-02-15	16	No	Yes	Natural Skincare Set	59.99	Cosmetics	Natural Ingredients	0.0	A luxurious and natural skincare set with essentials for radiant and healthy skin.	6f08d013-3c39-400e-9622-b34aeb9d5392	f
\.


--
-- TOC entry 4910 (class 0 OID 32809)
-- Dependencies: 227
-- Data for Name: T2_CategoryTable; Type: TABLE DATA; Schema: Product; Owner: postgres
--

COPY "Product"."T2_CategoryTable" ("CategoryID", "CategoryName", "SubCategories", "Blocked") FROM stdin;
c97e0d6c-fb7d-45ed-8318-8550a36c78de	Electronics	["Gadgets", "Food & Beverages"]	f
12d8bb4d-ba18-4193-94e5-854342c1dec0	Fashion	["Clothing", "Jewelry"]	f
87c909f9-72fc-44f9-b5fc-b59845a3357a	Home & Kitchen	["Home Appliances", "Kitchenware"]	f
9fbbe97c-9bcd-49a0-9618-1b70da1001cc	Sports & Outdoors	["Fitness & Wellness", "Toys & Games"]	f
6e7f7ef9-a32a-43a0-8477-5f2dbc17a08e	Toys & Hobbies	["Games", "Music"]	f
ac9c9e1f-59d1-47c2-9f04-7e9963342b57	Technology	["Computing", "Telecommunications"]	f
f3b6bd93-4ed3-47e3-b98a-bf720be3e658	Home Appliances	["Electric Kettles", "Microwaves"]	f
05cec91d-f1ac-4db5-af0b-f3a441c1d0be	Toys		f
6d574b8e-1cec-48b7-ba43-219d494bff51	Games		f
24df1d24-5cf0-4b92-8852-6aef1652f7cf	Books		f
5923a55e-7a75-40ca-b167-c78efaf90021	Sports		f
912ac7af-7501-4900-8aa3-7ee6d537aa49	Crafts		f
dc62f2b4-963c-4df7-ad3d-d3bafcf2ba21	Music		f
6f08d013-3c39-400e-9622-b34aeb9d5392	Beauty		f
f66f0ce5-5ecb-4582-9aba-a1c16e502eed	Food		f
1e40d17a-3638-4149-bc0c-f6532f996605	Garden		f
7d7a7064-7142-48a9-8d2c-07b75e3a1ae3	Toys & Games		f
b9a64d28-4e7f-4163-b96c-b6d78fbaa337	Beauty & Personal Care		f
1d72814f-6daf-458d-a3c1-1a423dcee2f4	Fitness & Wellness		f
a70d131b-e0fe-4b32-bfb4-246ff4baad1b	Gadgets		f
9697e0a5-12b2-47d6-a05c-7998afd49541	Food & Beverages		f
09a1fc84-d87e-4b81-b905-38c47ea650f8	Kitchenware		f
754af6e7-84dc-4e9f-af79-3711556b43dc	Health		f
\.


--
-- TOC entry 4906 (class 0 OID 24602)
-- Dependencies: 223
-- Data for Name: T3_Product_Reviews; Type: TABLE DATA; Schema: Product; Owner: postgres
--

COPY "Product"."T3_Product_Reviews" ("ProductID", "SellerID", "BuyerID", "Review", "Rating") FROM stdin;
27681745-ba22-424c-97c8-17d1035aa80c	1234	kdkofooew	Product Damage	3.6
\.


--
-- TOC entry 4913 (class 0 OID 40973)
-- Dependencies: 230
-- Data for Name: T4_Orders; Type: TABLE DATA; Schema: Product; Owner: postgres
--

COPY "Product"."T4_Orders" ("OrderID", "SellerID", "BuyerID", "InternalTransactionID", "ExternalTransactionID", "Products", "Status") FROM stdin;
\.


--
-- TOC entry 4902 (class 0 OID 16398)
-- Dependencies: 219
-- Data for Name: T1_SignedUp; Type: TABLE DATA; Schema: Seller; Owner: postgres
--

COPY "Seller"."T1_SignedUp" ("SellerID", "Seller_Referral_Code", "MailID", "Phone", "Password", "Name") FROM stdin;
8cc202e9-f2e0-4a78-963d-7e95a38755e8	\N	user1@example.com	15551234567	bc547750b92797f955b36112cc9bdd5cddf7d0862151d03a167ada8995aa24a9ad24610b36a68bc02da24141ee51670aea13ed6469099a4453f335cb239db5da	John Doe
c077ae5a-4fd3-4a15-a600-27c68df00716	\N	user2@example.com	15552345678	92a891f888e79d1c2e8b82663c0f37cc6d61466c508ec62b8132588afe354712b20bb75429aa20aa3ab7cfcc58836c734306b43efd368080a2250831bf7f363f	Jane Smith
a455cef0-0c1b-4d5e-b4ca-81f6f94cb425	\N	user3@example.com	15553456789	2a64d6563d9729493f91bf5b143365c0a7bec4025e1fb0ae67e307a0c3bed1c28cfb259fc6be768ab0a962b1e2c9527c5f21a1090a9b9b2d956487eb97ad4209	Michael Brown
4f350e3a-93d7-4547-b17f-697e6958b1b3	\N	user4@example.com	15554567890	11961811bd4e11f23648afbd2d5c251d2784827147f1731be010adaf0ab38ae18e5567c6fd1bee50a4cd35fb544b3c594e7d677efa7ca01c2a2cb47f8fb12b17	Emily Johnson
bf3cb7f7-3243-4303-988c-a34278604185	\N	user5@example.com	15555678901	39c6f5329e959b2af0deb0f8dacbcdf5418204f46baed50388f62b047c9223c66ff470031ecd653a49f6eff6fa876811e46f0c269390a8bf61f4f983729e1083	David Lee
99021480-7d96-4551-a890-5ebf866af2d8	\N	user6@example.com	15556789012	011324228a766d0d06e56bd4c61fa8bffa4bc1dd01eb6892f906ef93cb9ba3f4a4243fe40f3e54314115bf0c0eac80bc630ed4dccf7ba6f22b12d9261cca7daa	Sophia Chen
be857b49-9e19-4095-9346-6386076a1713	\N	user7@example.com	15557890123	a7d785790aecb79a4a3bcd5197301ae76897f83a2424a9b84160ed12a5def47f66d5a88ce5e6032be7e0e91b912d92e1b64f97b1d13a5096eec097470dee7764	James Wilson
3e330c7e-46b2-4040-bd86-68e474f1ca9f	\N	user8@example.com	15558901234	219aab6b2cf738d9f370e197ce0151be42ae6095e0d72fa49592865c9d2dde5d2fa72e908ac374cba55426e6d0ed39324fd6de1d5da2641cc7f4491f5edd931f	Olivia Taylor
51085a97-1b1f-4b34-b9b7-52b79261b337	\N	user9@example.com	15559012345	26e261e3003a175c800a2c48f96972793676e8ab464d0e73da50b1c8d359ed4bac5ee660bfe3ee9a9362ad42ca3c9aa793ab4f707b163dfea4d89b64fae0a0b9	Daniel Thompson
8f3a593e-e5d4-4976-9340-67299afcee0f	\N	user10@example.com	15550123456	2ce5f635d25b791d37a92c99f0af6df02a68fa695b74f90685e7d93ed3f5a61a715168541954b4c2feec9fd39fcc4df74fef1b9211e12ca96dc03efba2e6a31e	Alexander White
30e74332-1db0-4798-a530-15c265ab49e0	\N	user11@example.com	15551234567	f272bde3a05d1e2beacff0852af0935518c8e5977ac79413fa89d169c461f6b5d60eeefd6b128470c36c14e4f5a1cf192d01f93caa01dcb55ce6fedf8008173c	Grace Kim
646ca2ce-d117-47ea-b6a4-c1c1cea2bae8	\N	user12@example.com	15552345678	552dc2e616c351e1a6ffaadb32dbacbaaeeb8359a9f6ec33668e9265997c8aa8fa8b501c6759b989742bf0b4e566ecf2079f9359d3224ecef116ce42c4ec07ad	Robert Johnson
b14aec21-cf75-4ed2-9b37-16f42088e940	\N	user13@example.com	15553456789	34ca329b0e0e8310bf012bc3cfd56e2ddf1ac6e734baab744a87fae59ada3e510306d9a701515e99770b20f42e5097a9b476be4835f8e599e3e38ddce521a4fb	Jessica Brown
9655ff52-9979-4497-8da5-a163a340b608	\N	user14@example.com	15554567890	6c83e3c2b8a035bf55c774f4d9e150bfa292b61754883e188b0013a92ef3594e113f087854e3704d14f78079dbb37068c981159e2621f934018496cf730146dc	William Lee
6d1cc2c6-d1cf-4f70-878b-7198c74f5f37	\N	user15@example.com	15555678901	5644ed5463aeb778f5a41b5d25ad30dd4813300fec5e79ac82ae2777e59d596775958947a1607938d2162d3c011321fb876dc69c9345dcecce0df94b1cc601b7	Ava Chen
852956cd-23fb-479e-bdbf-51bee767f8eb	\N	user16@example.com	15556789012	33378b7b66c511efa8340d2f9101260739a0c512348bfe67b348876c874665d332c770d4ea528d9002496c1f574ed916ebdceb6870b5bea9366dc174bc0a7c5c	Mark Wilson
138de16f-ab44-4c7d-a01a-93047c799f8e	\N	user17@example.com	15557890123	3bcb5691e05414034706c825ae61c62ef66d5db3647846e9570ee333c2cf31124b9c106c740d288be78eff4134251d748fbeef175d6ff587d38f8ecc3a3eb31d	Samantha Taylor
b98fa83f-9ee6-4d13-b1e9-298f265b5b94	\N	user18@example.com	15558901234	62eb450f0c46e2fe24002cdcf6c8d3d45a4a7fb01737b7e2df2f9c535ca2e082c7dbd58a91ffd01ece48414862ab49d1e31272e036e34038b9fa69b3b0c92afb	Joseph Thompson
54ba0380-1c4c-466d-be80-a8ce8f55413a	\N	user19@example.com	15559012345	3942229e706b3510f1151e84e49b027d76e06392ce9a7be977977d6b9b70a9e6cb2208dc13f4afeac8ecfd55babcd9af3dc1cc00c13f2a3b648df2ec52cd2488	Sophia White
6889a995-448d-462e-9157-dfaf5c2e7efc	\N	user20@example.com	15550123456	99344ceebc98e13a61869b7f8fd5fa20017e70859be61a08c84c72ed797b3e19d7a7770d1821e91de5db655132acd09bff0473861d00964ba73c8c024f9565d5	Ethan Kim
7c1db55e-acc4-458b-872d-56978ec3d29b	\N	user21@example.com	15551345678	17c8f5af0e37ff674f470d12c00d11eee86b09b83bbda028f2f0679ea2312174cc9bf59e9629112b7b3c3192908e9353d2a98c9ad803de9b56eda7420f1e2c30	Daniel Johnson
e01ce6f8-aaef-48ad-84bb-feea345710f6	\N	user22@example.com	15552456789	ba39897ea8127a48594bf673648c82d051abe4bdb91187c1b642f2b2cd05f4d0afb43fe548443d4cf90a2c9bc50fd3e43dae899424966e4b43273594aba8f6c2	Emily Brown
1a8fc549-1248-4f8c-a6ef-f0a5b31243bd	\N	user23@example.com	15553567890	b69d074573d99562505f9c86c129abafc979d21cb0631e3dd1e6fb6c485f32b4b6a5d61f02a00bbff7c9556083eb62ca25996e8f901983fba5b9a43897fc4b6b	Matthew Lee
fa520daf-5d4d-4895-98b0-733a9240313c	\N	user24@example.com	15554678901	c2ab49664f8d430d287158bf59512def097d9ad726181863aaf0b2a825972548d0c231b6bce5bc87895da32c030b4b4c49144aa437bfa1e7d193208081948601	Grace Chen
92a3e8d7-8d62-4841-89d0-4fd7d234b048	\N	user25@example.com	15555789012	d485052dc979fe091e4b59e67d35856e1c0fd8237ee47aa6d5751babc553043c8584ed6847df9b9480b0841b67e21c4ceb71ab180d1b9a580cdcf0b6881da547	James Wilson
a4f42cd6-09fe-4426-9553-3ad41c654c12	\N	user26@example.com	15556890123	41c6ece128b8ab6b0b36295d9ec0c7eacbb69c04878547f8836271154be22da6199958c7e181b2bfcde1a421650b133ada72bc39bbb6ebcdb17e333a50ed6dab	Olivia Taylor
20d00292-7050-4f3c-9506-2674896f4ead	\N	user27@example.com	15557901234	4c8a5ed406fdd416137f0544d55b176f12d85d3279ac00c7023318b1219f18ff482653eefdb8fcdb5751861c2b727140bd4649ffb096595224dadc3ec2effa9a	Daniel Thompson
f5b60b82-813d-434e-8ce6-1139896eda98	\N	user28@example.com	15558012345	3f2676c76dbff5f7b62d8bfb70e86e683db61e10d89a3cca32b71b48be44770c07da50c10ab09e5026167f5a7e228581bb159d6cb20445cf9f1235858bdce38b	Alexander White
c23d08b7-f930-4447-9458-ecb6de94610f	\N	user29@example.com	15559123456	6941ea4d1ce5e2ca8b771e5af18a4485392269cc72c92aef0e2e34c104045ca34ca99d11d9f14cd28d19ce21f44fe1a0ff15bba365754f413075c76b266a6707	Grace Kim
371be290-846b-4a84-b224-d86ecd09b6f0	\N	user30@example.com	15550134567	b97f5ad2c29c48a6f5bc82ed15b21688aae7c90c03768c01b0b91ae718aee2d57131fecfc37adfe07747d5952f6d89d3c134e1539b77789ec50b59037f0c7e8b	Robert Johnson
22d268a1-679d-498f-bdfb-d7cb84ad0f9c	\N	user31@example.com	15551456789	feec324019ce846fc62f6e3f326ef4b330fdc9dc3abcb15ada877e4b88e47c20b8b93dceae280a0d15d1ddcb345b890c49f8378683d6cb00d4573a6803cfc97f	Jessica Brown
14ec97b2-254a-4f41-a779-3127e947b55b	\N	user32@example.com	15552567890	2154af0222a084d313308f49c1502a635bf1376d9b4bde99dc2182421f81e61cce944d3434b355f1f8c34ab011a57ae6d0da6085bd7e3ba8b9d3943f082d3686	William Lee
499d9ed3-01c9-469a-8787-fec47f90b523	\N	user33@example.com	15553678901	5c143cfb8e94bfecb9de1e533cdedd2d574442f74c2049b39a4fe458c5cd0031ebf382d7fe8198b3a56422f4bf2aa72eca78864c0a386cd8b0a4497cc1c3194c	Ava Chen
fd6fab7a-2c53-4720-941c-de910a2c499c	\N	user34@example.com	15554789012	883fac0f3f1e67f9329f5845b54620e04026aeb8a0cd31332cacf9c5e6fe8b65503264933ee44bab09f1071971bb8eb0918d9ab8faf3dab7e65a9d0830ddeacd	Mark Wilson
3e7fb37b-d07d-40a9-9755-30db3ab4d809	\N	user35@example.com	15555890123	20e9b1c0c6461c08fcf93db0ee33a781c8169481dfb6d4bb53e909482d7d2a415c3c1969a9c9d217935a69e5a0c18f51b6607d66511079e1bbe6cb1cbe56b71d	Samantha Taylor
f4f5a3da-a275-46fc-9950-6040d4dce034	\N	user36@example.com	15556901234	717ec70d2f6b9eb02bf4d5adba01b99cf98d3eb8224097801c71b5225d7e3566f2426354941383da9d0d6537e16ddeb12dbf32275c868fbfe9cc4eea2dc4db65	Joseph Thompson
7fdb6b0d-d6a8-4fd5-8a0a-a7dbe80ccd78	\N	user37@example.com	15557912345	f0d2b11bb7451f23442afaff7388ed1c2f1fa69a506460a814542479b8953d385ef60996b129bd8b5eef17ad3b5ca18782ec471e0d0937a0345d0f5e4b87a8a0	Sophia White
4145d81c-ec2d-4a75-aaac-e0136e9a14e4	\N	user38@example.com	15558923456	641bcf366639a35ac360f0fc727406defe00b4c4ca24f0327a665010cdae99c5b6e5a7e1e8fd96764c9f9ada724d07ce141d0f2e6589bdb7dc71a88cc245e307	Ethan Kim
a8877455-b5e1-4ea1-97bd-5e10daf4b5a9	\N	user39@example.com	15559934567	8655f77b61f337aced205f9a007bd27fff9637c20e8d13aaf1a99d978a2a67ba77b7004f7e79a84272dc900e7e28a8ee7f34b186ae00ade328446e17dd6a8320	Daniel Johnson
b394042c-ec67-4853-95e5-984b1047b7ed	\N	user40@example.com	15550945678	caba222ed86f06cc1465fbcff3c26285f7dda9d5678993d6a871fdd7ebeec64e64e8384a7503a65a58ef1a6eab2a2b2f6781b4cc2ae38d4ba96d0aedc09f10f2	Emily Brown
a7db1709-ff83-4ca2-9bce-f72933ac82bc	\N	user41@example.com	15551956789	0108953fda9dd61be12e58b3624f32b3a6e71717d48d2ed4b7596e5ac67504a1be6fcf754f74c5565f8bc2bbc5fe74febc7035d32eabb137073f0481c0231caf	Matthew Lee
6856928f-541a-48f8-99b5-93c5e8a3fa70	\N	user42@example.com	15552967890	514bcff630af25170221bcc255ad82495b54825660ad1ba9f7f072a8a35ec4883035b62b34b6eedce51d63141e983d797ca9e69cf09c9f96301a47ec96c28bb7	Grace Chen
fb08c506-30a5-4725-bbb4-b215b773b3cb	\N	user43@example.com	15553978901	74a18430b3c0427aa2eeef978e8d131a4d138df76513be814f6332c147ba95f0e3733cca5e5561255c73e4318895cbebbc5b9f80285a5c859f5a35a4510f9ca3	James Wilson
7d1d9e2d-a868-47ed-bb8f-78df559254c6	\N	user44@example.com	15554989012	90820b8ab6d515cef160ff90beeb0c459f526be9eb074375bc54bd4066b45cf289f29d4c2a7dab26e02dea5f7d56db0b22cff57f03264ef046016a3192d7c0f1	Olivia Taylor
2e1c5915-8ede-4946-8142-5d2d78d04b7e	\N	user45@example.com	15555990123	f1de21cd809142e7d1c9bbbe3d24d12e54204c3ccde9697a3666987423104031c22cc8a6994303b47d8c20ed83260be83a3bf0f6d7844f4c09cac6328ca86a58	Joseph Thompson
adf871d7-21c9-48a1-8f47-4fad6fb9001f	\N	user46@example.com	15556901234	838aa77d8c93d5f942e71cbd48ae1a1fa87f1b82207a63d3700639f29e0a078dd10c1fd357b2703d325d34f6d61f789414614f91c94a90ace63b42ab6846f49b	Sophia White
94c627f6-5175-4260-9ef2-43d5189c8ebe	\N	user47@example.com	15557912345	ee0f4e72c7a59bce0bf2575280e6aad398e2c50c9226308c097e93e22f7cb057c77a212a9f0d266717098fa5c206dcab8e1308ba506acc9ddddc656edd4c9fcc	Ethan Kim
7c00b967-9635-4419-a8c0-d42b9c2d68e1	\N	user48@example.com	15558923456	5ffbd7ab03e4c218cc4d477be1fc4cf8ea673b39e3dac2fc3d5f93409c03f4ea0907d977fce72984bdb4ea46985a9975f3d84b907801fb64757eeed64f516cf8	Daniel Johnson
3ee4c45e-5355-4658-9bec-9b89e263a378	\N	user49@example.com	15559934567	f0d7c3d74b142c334095296a1816a73f1a1a21a50726cbee9e4f32c909878e4292b50177022016b0dd61e6c188428a724f1758c8d7dfd16f93dc93e8b0acf0d0	Emily Brown
12c3d683-eaeb-4fe8-ab65-388130db454f	\N	user50@example.com	15550945678	2a66e347e63f016e85c8062358582fcabf7162e4db3b8553e8cc752d9cbf2b58574e45fd6842acf814520d814ef388c94e1f36773648ce5a6059988b33122f9f	Matthew Lee
e8527274-569a-4a0c-88a4-2b3bf7df0175	\N	sumeetpatil20004@gmail.com	111111111	d404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db	Sumeet
\.


--
-- TOC entry 4903 (class 0 OID 16406)
-- Dependencies: 220
-- Data for Name: T2_Registered; Type: TABLE DATA; Schema: Seller; Owner: postgres
--

COPY "Seller"."T2_Registered" ("SellerID", "PanID", "Aadhar", "CompanyName", "BankAccountNumber", "GSTIN", "CompanyAddress", "Country", "CompanyDescription", "Blocked", "Name") FROM stdin;
e8527274-569a-4a0c-88a4-2b3bf7df0175	98498398143	489284824820	ABC	2390390290920909	39189898398	rijrsrj	India	A test Company	f	Sumeet
c077ae5a-4fd3-4a15-a600-27c68df00716	BCDEF6789012	234567890123	EcoFriendly Products	234567890123	BCDEF6789012A1Y0	456 Elm St, Seattle, WA 98101	USA	Manufactures eco-friendly products	f	Jane Smith
a455cef0-0c1b-4d5e-b4ca-81f6f94cb425	CDEF234567890	345678901234	Innovative Healthcare	345678901234	CDEF234567890A2Z0	789 Oak St, Boston, MA 02108	USA	Offers innovative healthcare solutions	f	Michael Brown
4f350e3a-93d7-4547-b17f-697e6958b1b3	DEF6789012345	456789012345	Renewable Energy	456789012345	DEF6789012345A3Z0	321 Pine St, New York, NY 10001	USA	Promotes renewable energy	f	Emily Johnson
bf3cb7f7-3243-4303-988c-a34278604185	EF67890123456	567890123456	SmartCity Solutions	567890123456	EF67890123456A4Z0	654 Cedar St, Chicago, IL 60601	USA	Provides smart city solutions	f	David Lee
99021480-7d96-4551-a890-5ebf866af2d8	FG678901234567	678901234567	GreenTech Innovations	678901234567	FG678901234567A5Z0	567 Maple St, Philadelphia, PA 19101	USA	Innovates in green technology	f	Sophia Chen
3e330c7e-46b2-4040-bd86-68e474f1ca9f	HI67890123456789	890123456789	Emerging Tech Ventures	890123456789	HI67890123456789A7Z0	345 Willow St, Atlanta, GA 30303	USA	Invests in emerging tech	f	Olivia Taylor
51085a97-1b1f-4b34-b9b7-52b79261b337	IJ678901234567890	901234567890	Inclusive Education	901234567890	IJ678901234567890A8Z0	234 Cypress St, Denver, CO 80202	USA	Promotes inclusive education	f	Daniel Thompson
8f3a593e-e5d4-4976-9340-67299afcee0f	JK6789012345678901	12345678901	Healthy Food Initiatives	12345678901	JK6789012345678901A9Z0	123 Magnolia St, Miami, FL 33101	USA	Promotes healthy food	f	Alexander White
30e74332-1db0-4798-a530-15c265ab49e0	KL6789012345678902	123456789012	TechForGood	123456789012	KL6789012345678902A0Z0	567 Spruce St, San Diego, CA 92101	USA	Technology for social good	f	Grace Kim
646ca2ce-d117-47ea-b6a4-c1c1cea2bae8	LM6789012345678903	234567890123	EcoVentures	234567890123	LM6789012345678903A1Z0	789 Fir St, Phoenix, AZ 85001	USA	Eco-friendly business ventures	f	Robert Johnson
b14aec21-cf75-4ed2-9b37-16f42088e940	MN6789012345678904	345678901234	InclusiveTech	345678901234	MN6789012345678904A2Z0	456 Palm St, Minneapolis, MN 55401	USA	Inclusive technology solutions	f	Jessica Brown
9655ff52-9979-4497-8da5-a163a340b608	NO6789012345678905	456789012345	GreenPower	456789012345	NO6789012345678905A3Z0	567 Oak St, Portland, OR 97201	USA	Renewable energy solutions	f	William Lee
6d1cc2c6-d1cf-4f70-878b-7198c74f5f37	PQ6789012345678906	567890123456	SmartWaste	567890123456	PQ6789012345678906A4Z0	654 Cedar St, Seattle, WA 98101	USA	Intelligent waste management solutions	f	Ava Chen
852956cd-23fb-479e-bdbf-51bee767f8eb	QR6789012345678907	678901234567	EcoHousing	678901234567	QR6789012345678907A5Z0	567 Maple St, Baltimore, MD 21201	USA	Eco-friendly housing solutions	f	Mark Wilson
138de16f-ab44-4c7d-a01a-93047c799f8e	RS6789012345678908	789012345678	HealthyLiving	789012345678	RS6789012345678908A6Z0	456 Birch St, Detroit, MI 48202	USA	Promotes healthy living	f	Samantha Taylor
b98fa83f-9ee6-4d13-b1e9-298f265b5b94	ST6789012345678909	890123456789	EcoFarms	890123456789	ST6789012345678909A7Z0	345 Willow St, Boston, MA 02109	USA	Eco-friendly farming solutions	f	Joseph Thompson
8cc202e9-f2e0-4a78-963d-7e95a38755e8	ABCDEF12345	123456789012	GlobalTech Solutions	1234567890	ABCDE12345A1Z0	123 Main St, San Francisco, CA 94111	USA	Provides advanced tech solutions	f	John Doe
be857b49-9e19-4095-9346-6386076a1713	GH6789012345678	789012345678	Sustainable Agriculture	789012345678	GH6789012345678A6Z0	456 Birch St, Houston, TX 77001	USA	Promotes sustainable agriculture	t	James Wilson
54ba0380-1c4c-466d-be80-a8ce8f55413a	TU6789012345678910	901234567890	TechForAll	901234567890	TU6789012345678910A0Z0	234 Cypress St, New Orleans, LA 70112	USA	Technology for all	f	Sophia White
6889a995-448d-462e-9157-dfaf5c2e7efc	UV6789012345678911	12345678901	EcoTourism	12345678901	UV6789012345678911A1Z0	567 Spruce St, Nashville, TN 37201	USA	Eco-friendly tourism	f	Ethan Kim
7c1db55e-acc4-458b-872d-56978ec3d29b	VW6789012345678912	123456789012	InclusiveDesign	123456789012	VW6789012345678912A2Z0	789 Fir St, Las Vegas, NV 89101	USA	Inclusive design solutions	f	Daniel Johnson
e01ce6f8-aaef-48ad-84bb-feea345710f6	XZ6789012345678913	234567890123	GreenTransport	234567890123	XZ6789012345678913A3Z0	654 Palm St, Austin, TX 78701	USA	Renewable transportation solutions	f	Emily Brown
1a8fc549-1248-4f8c-a6ef-f0a5b31243bd	YA6789012345678914	345678901234	SustainableEnergy	345678901234	YA6789012345678914A4Z0	567 Oak St, Denver, CO 80202	USA	Sustainable energy solutions	f	Matthew Lee
fa520daf-5d4d-4895-98b0-733a9240313c	ZB6789012345678915	456789012345	EcoFashion	456789012345	ZB6789012345678915A5Z0	456 Cedar St, Atlanta, GA 30303	USA	Eco-friendly fashion	f	Grace Chen
92a3e8d7-8d62-4841-89d0-4fd7d234b048	AC6789012345678916	567890123456	HealthyLiving	567890123456	AC6789012345678916A6Z0	654 Maple St, Houston, TX 77002	USA	Promotes healthy living	f	James Wilson
a4f42cd6-09fe-4426-9553-3ad41c654c12	AD6789012345678917	678901234567	EcoBuildings	678901234567	AD6789012345678917A7Z0	567 Birch St, Chicago, IL 60602	USA	Eco-friendly building solutions	f	Olivia Taylor
20d00292-7050-4f3c-9506-2674896f4ead	AE6789012345678918	789012345678	TechForAll	789012345678	AE6789012345678918A0Z0	456 Willow St, Philadelphia, PA 19102	USA	Technology for all	f	Daniel Thompson
f5b60b82-813d-434e-8ce6-1139896eda98	AF6789012345678919	890123456789	EcoTourism	890123456789	AF6789012345678919A1Z0	345 Spruce St, San Francisco, CA 94101	USA	Eco-friendly tourism	f	Alexander White
c23d08b7-f930-4447-9458-ecb6de94610f	AG6789012345678920	901234567890	InclusiveDesign	901234567890	AG6789012345678920A2Z0	234 Palm St, New York, NY 10001	USA	Inclusive design solutions	f	Grace Kim
371be290-846b-4a84-b224-d86ecd09b6f0	BI6789012345678921	12345678901	GreenTransport	12345678901	BI6789012345678921A3Z0	654 Oak St, Miami, FL 33101	USA	Renewable transportation solutions	f	Robert Johnson
22d268a1-679d-498f-bdfb-d7cb84ad0f9c	BJ6789012345678922	123456789012	SustainableEnergy	123456789012	BJ6789012345678922A4Z0	567 Maple St, Seattle, WA 98101	USA	Sustainable energy solutions	f	Jessica Brown
14ec97b2-254a-4f41-a779-3127e947b55b	BK6789012345678923	234567890123	EcoFashion	234567890123	BK6789012345678923A5Z0	456 Birch St, Boston, MA 02108	USA	Eco-friendly fashion	f	William Lee
499d9ed3-01c9-469a-8787-fec47f90b523	BL6789012345678924	345678901234	HealthyLiving	345678901234	BL6789012345678924A6Z0	654 Cedar St, Dallas, TX 75201	USA	Promotes healthy living	f	Ava Chen
fd6fab7a-2c53-4720-941c-de910a2c499c	BM6789012345678925	456789012345	EcoBuildings	456789012345	BM6789012345678925A7Z0	567 Willow St, Los Angeles, CA 90001	USA	Eco-friendly building solutions	f	Mark Wilson
3e7fb37b-d07d-40a9-9755-30db3ab4d809	BN6789012345678926	567890123456	TechForAll	567890123456	BN6789012345678926A0Z0	456 Oak St, Atlanta, GA 30303	USA	Technology for all	f	Samantha Taylor
f4f5a3da-a275-46fc-9950-6040d4dce034	BO6789012345678927	678901234567	EcoTourism	678901234567	BO6789012345678927A1Z0	345 Birch St, Denver, CO 80202	USA	Eco-friendly tourism	f	Joseph Thompson
7fdb6b0d-d6a8-4fd5-8a0a-a7dbe80ccd78	BP6789012345678928	789012345678	InclusiveDesign	789012345678	BP6789012345678928A2Z0	234 Willow St, Phoenix, AZ 85001	USA	Inclusive design solutions	f	Sophia White
4145d81c-ec2d-4a75-aaac-e0136e9a14e4	BQ6789012345678929	890123456789	GreenTransport	890123456789	BQ6789012345678929A3Z0	654 Oak St, New Orleans, LA 70112	USA	Renewable transportation solutions	f	Ethan Kim
a8877455-b5e1-4ea1-97bd-5e10daf4b5a9	BR6789012345678930	901234567890	SustainableEnergy	901234567890	BR6789012345678930A4Z0	567 Maple St, San Francisco, CA 94102	USA	Sustainable energy solutions	f	Daniel Johnson
b394042c-ec67-4853-95e5-984b1047b7ed	BS6789012345678931	12345678901	EcoFashion	12345678901	BS6789012345678931A5Z0	456 Birch St, San Diego, CA 92101	USA	Eco-friendly fashion	f	Emily Brown
a7db1709-ff83-4ca2-9bce-f72933ac82bc	BT6789012345678932	123456789012	HealthyLiving	123456789012	BT6789012345678932A6Z0	654 Cedar St, Washington, DC 20001	USA	Promotes healthy living	f	Matthew Lee
6856928f-541a-48f8-99b5-93c5e8a3fa70	BU6789012345678933	234567890123	EcoBuildings	234567890123	BU6789012345678933A7Z0	567 Willow St, Portland, OR 97201	USA	Eco-friendly building solutions	f	Grace Chen
fb08c506-30a5-4725-bbb4-b215b773b3cb	BV6789012345678934	345678901234	TechForAll	345678901234	BV6789012345678934A0Z0	456 Oak St, Baltimore, MD 21201	USA	Technology for all	f	James Wilson
7d1d9e2d-a868-47ed-bb8f-78df559254c6	BW6789012345678935	456789012345	EcoTourism	456789012345	BW6789012345678935A1Z0	345 Birch St, Charlotte, NC 28202	USA	Eco-friendly tourism	f	Olivia Taylor
2e1c5915-8ede-4946-8142-5d2d78d04b7e	BX6789012345678936	567890123456	InclusiveDesign	567890123456	BX6789012345678936A2Z0	234 Willow St, Miami, FL 33101	USA	Inclusive design solutions	f	Joseph Thompson
adf871d7-21c9-48a1-8f47-4fad6fb9001f	BY6789012345678937	678901234567	GreenTransport	678901234567	BY6789012345678937A3Z0	654 Oak St, Seattle, WA 98101	USA	Renewable transportation solutions	f	Sophia White
94c627f6-5175-4260-9ef2-43d5189c8ebe	BZ6789012345678938	789012345678	SustainableEnergy	789012345678	BZ6789012345678938A4Z0	567 Maple St, Boston, MA 02101	USA	Sustainable energy solutions	f	Ethan Kim
7c00b967-9635-4419-a8c0-d42b9c2d68e1	CA6789012345678939	890123456789	EcoFashion	890123456789	CA6789012345678939A5Z0	456 Birch St, Detroit, MI 48201	USA	Eco-friendly fashion	f	Daniel Johnson
3ee4c45e-5355-4658-9bec-9b89e263a378	CB6789012345678940	901234567890	HealthyLiving	901234567890	CB6789012345678940A6Z0	654 Cedar St, Boston, MA 02101	USA	Promotes healthy living	f	Emily Brown
12c3d683-eaeb-4fe8-ab65-388130db454f	CC6789012345678941	12345678901	EcoBuildings	12345678901	CC6789012345678941A7Z0	567 Willow St, Houston, TX 77001	USA	Eco-friendly building solutions	f	Matthew Lee
\.


--
-- TOC entry 4904 (class 0 OID 24580)
-- Dependencies: 221
-- Data for Name: T3_BankDetails; Type: TABLE DATA; Schema: Seller; Owner: postgres
--

COPY "Seller"."T3_BankDetails" ("SellerID", "BankAccountNumber", "BankName", "BankBranch", "IFSC") FROM stdin;
8cc202e9-f2e0-4a78-963d-7e95a38755e8	1234567890	WBI		4928839819839813891
c077ae5a-4fd3-4a15-a600-27c68df00716	234567890123	WBI		4928839819839813891
a455cef0-0c1b-4d5e-b4ca-81f6f94cb425	345678901234	WBI		4928839819839813891
4f350e3a-93d7-4547-b17f-697e6958b1b3	456789012345	WBI		4928839819839813891
bf3cb7f7-3243-4303-988c-a34278604185	567890123456	WBI		4928839819839813891
99021480-7d96-4551-a890-5ebf866af2d8	678901234567	WBI		4928839819839813891
be857b49-9e19-4095-9346-6386076a1713	789012345678	WBI		4928839819839813891
3e330c7e-46b2-4040-bd86-68e474f1ca9f	890123456789	WBI		4928839819839813891
51085a97-1b1f-4b34-b9b7-52b79261b337	901234567890	WBI		4928839819839813891
8f3a593e-e5d4-4976-9340-67299afcee0f	12345678901	WBI		4928839819839813891
30e74332-1db0-4798-a530-15c265ab49e0	123456789012	WBI		4928839819839813891
646ca2ce-d117-47ea-b6a4-c1c1cea2bae8	234567890123	WBI		4928839819839813891
b14aec21-cf75-4ed2-9b37-16f42088e940	345678901234	WBI		4928839819839813891
9655ff52-9979-4497-8da5-a163a340b608	456789012345	WBI		4928839819839813891
6d1cc2c6-d1cf-4f70-878b-7198c74f5f37	567890123456	WBI		4928839819839813891
852956cd-23fb-479e-bdbf-51bee767f8eb	678901234567	WBI		4928839819839813891
138de16f-ab44-4c7d-a01a-93047c799f8e	789012345678	WBI		4928839819839813891
b98fa83f-9ee6-4d13-b1e9-298f265b5b94	890123456789	WBI		4928839819839813891
54ba0380-1c4c-466d-be80-a8ce8f55413a	901234567890	WBI		4928839819839813891
6889a995-448d-462e-9157-dfaf5c2e7efc	12345678901	WBI		4928839819839813891
7c1db55e-acc4-458b-872d-56978ec3d29b	123456789012	WBI		4928839819839813891
e01ce6f8-aaef-48ad-84bb-feea345710f6	234567890123	WBI		4928839819839813891
1a8fc549-1248-4f8c-a6ef-f0a5b31243bd	345678901234	WBI		4928839819839813891
fa520daf-5d4d-4895-98b0-733a9240313c	456789012345	WBI		4928839819839813891
92a3e8d7-8d62-4841-89d0-4fd7d234b048	567890123456	WBI		4928839819839813891
a4f42cd6-09fe-4426-9553-3ad41c654c12	678901234567	WBI		4928839819839813891
20d00292-7050-4f3c-9506-2674896f4ead	789012345678	WBI		4928839819839813891
f5b60b82-813d-434e-8ce6-1139896eda98	890123456789	WBI		4928839819839813891
c23d08b7-f930-4447-9458-ecb6de94610f	901234567890	WBI		4928839819839813891
371be290-846b-4a84-b224-d86ecd09b6f0	12345678901	WBI		4928839819839813891
22d268a1-679d-498f-bdfb-d7cb84ad0f9c	123456789012	WBI		4928839819839813891
14ec97b2-254a-4f41-a779-3127e947b55b	234567890123	WBI		4928839819839813891
499d9ed3-01c9-469a-8787-fec47f90b523	345678901234	WBI		4928839819839813891
fd6fab7a-2c53-4720-941c-de910a2c499c	456789012345	WBI		4928839819839813891
3e7fb37b-d07d-40a9-9755-30db3ab4d809	567890123456	WBI		4928839819839813891
f4f5a3da-a275-46fc-9950-6040d4dce034	678901234567	WBI		4928839819839813891
7fdb6b0d-d6a8-4fd5-8a0a-a7dbe80ccd78	789012345678	WBI		4928839819839813891
4145d81c-ec2d-4a75-aaac-e0136e9a14e4	890123456789	WBI		4928839819839813891
a8877455-b5e1-4ea1-97bd-5e10daf4b5a9	901234567890	WBI		4928839819839813891
b394042c-ec67-4853-95e5-984b1047b7ed	12345678901	WBI		4928839819839813891
a7db1709-ff83-4ca2-9bce-f72933ac82bc	123456789012	WBI		4928839819839813891
6856928f-541a-48f8-99b5-93c5e8a3fa70	234567890123	WBI		4928839819839813891
fb08c506-30a5-4725-bbb4-b215b773b3cb	345678901234	WBI		4928839819839813891
7d1d9e2d-a868-47ed-bb8f-78df559254c6	456789012345	WBI		4928839819839813891
2e1c5915-8ede-4946-8142-5d2d78d04b7e	567890123456	WBI		4928839819839813891
adf871d7-21c9-48a1-8f47-4fad6fb9001f	678901234567	WBI		4928839819839813891
94c627f6-5175-4260-9ef2-43d5189c8ebe	789012345678	WBI		4928839819839813891
7c00b967-9635-4419-a8c0-d42b9c2d68e1	890123456789	WBI		4928839819839813891
3ee4c45e-5355-4658-9bec-9b89e263a378	901234567890	WBI		4928839819839813891
12c3d683-eaeb-4fe8-ab65-388130db454f	12345678901	WBI		4928839819839813891
e8527274-569a-4a0c-88a4-2b3bf7df0175	2390390290920909	IDFC	BLR	209402909209302
\.


--
-- TOC entry 4754 (class 2606 OID 32822)
-- Name: T2_Tickets T2_Tickets_pkey; Type: CONSTRAINT; Schema: Admin; Owner: postgres
--

ALTER TABLE ONLY "Admin"."T2_Tickets"
    ADD CONSTRAINT "T2_Tickets_pkey" PRIMARY KEY ("TicketID");


--
-- TOC entry 4756 (class 2606 OID 32829)
-- Name: T3_Coupons T3_Coupons_pkey; Type: CONSTRAINT; Schema: Admin; Owner: postgres
--

ALTER TABLE ONLY "Admin"."T3_Coupons"
    ADD CONSTRAINT "T3_Coupons_pkey" PRIMARY KEY ("CouponCode");


--
-- TOC entry 4746 (class 2606 OID 32786)
-- Name: T1_SignedUp T1_SignedUp_pkey; Type: CONSTRAINT; Schema: Buyer; Owner: postgres
--

ALTER TABLE ONLY "Buyer"."T1_SignedUp"
    ADD CONSTRAINT "T1_SignedUp_pkey" PRIMARY KEY ("BuyerID");


--
-- TOC entry 4748 (class 2606 OID 32793)
-- Name: T2_Cart T2_Cart_pkey; Type: CONSTRAINT; Schema: Buyer; Owner: postgres
--

ALTER TABLE ONLY "Buyer"."T2_Cart"
    ADD CONSTRAINT "T2_Cart_pkey" PRIMARY KEY ("BuyerID");


--
-- TOC entry 4750 (class 2606 OID 32800)
-- Name: T3_Registered T3_Registered_pkey; Type: CONSTRAINT; Schema: Buyer; Owner: postgres
--

ALTER TABLE ONLY "Buyer"."T3_Registered"
    ADD CONSTRAINT "T3_Registered_pkey" PRIMARY KEY ("BuyerID");


--
-- TOC entry 4742 (class 2606 OID 24601)
-- Name: T1_Product_Information T1_Product_Information_pkey; Type: CONSTRAINT; Schema: Product; Owner: postgres
--

ALTER TABLE ONLY "Product"."T1_Product_Information"
    ADD CONSTRAINT "T1_Product_Information_pkey" PRIMARY KEY ("ProductID", "SellerID");


--
-- TOC entry 4752 (class 2606 OID 32815)
-- Name: T2_CategoryTable T2_CategoryTable_pkey; Type: CONSTRAINT; Schema: Product; Owner: postgres
--

ALTER TABLE ONLY "Product"."T2_CategoryTable"
    ADD CONSTRAINT "T2_CategoryTable_pkey" PRIMARY KEY ("CategoryID");


--
-- TOC entry 4744 (class 2606 OID 24608)
-- Name: T3_Product_Reviews T3_Product_Reviews_pkey; Type: CONSTRAINT; Schema: Product; Owner: postgres
--

ALTER TABLE ONLY "Product"."T3_Product_Reviews"
    ADD CONSTRAINT "T3_Product_Reviews_pkey" PRIMARY KEY ("ProductID", "SellerID", "BuyerID");


--
-- TOC entry 4758 (class 2606 OID 40979)
-- Name: T4_Orders T4_Orders_pkey; Type: CONSTRAINT; Schema: Product; Owner: postgres
--

ALTER TABLE ONLY "Product"."T4_Orders"
    ADD CONSTRAINT "T4_Orders_pkey" PRIMARY KEY ("OrderID");


--
-- TOC entry 4736 (class 2606 OID 24579)
-- Name: T1_SignedUp T1_SignedUp_pkey; Type: CONSTRAINT; Schema: Seller; Owner: postgres
--

ALTER TABLE ONLY "Seller"."T1_SignedUp"
    ADD CONSTRAINT "T1_SignedUp_pkey" PRIMARY KEY ("SellerID");


--
-- TOC entry 4738 (class 2606 OID 24577)
-- Name: T2_Registered T2_Registered_pkey; Type: CONSTRAINT; Schema: Seller; Owner: postgres
--

ALTER TABLE ONLY "Seller"."T2_Registered"
    ADD CONSTRAINT "T2_Registered_pkey" PRIMARY KEY ("Aadhar", "SellerID");


--
-- TOC entry 4740 (class 2606 OID 24586)
-- Name: T3_BankDetails T3_BankDetails_pkey; Type: CONSTRAINT; Schema: Seller; Owner: postgres
--

ALTER TABLE ONLY "Seller"."T3_BankDetails"
    ADD CONSTRAINT "T3_BankDetails_pkey" PRIMARY KEY ("SellerID", "BankAccountNumber");


-- Completed on 2024-08-04 11:45:16

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-08-04 11:45:16

--
-- PostgreSQL database cluster dump complete
--

