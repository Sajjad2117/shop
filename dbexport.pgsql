--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: customer_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_address (
    id bigint NOT NULL,
    country character varying(50),
    province character varying(50),
    city character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    postcode character varying(50) NOT NULL,
    address_line character varying(200) NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.customer_address OWNER TO postgres;

--
-- Name: customer_address_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_address_customer (
    id bigint NOT NULL,
    address_id bigint NOT NULL,
    customer_id bigint NOT NULL
);


ALTER TABLE public.customer_address_customer OWNER TO postgres;

--
-- Name: customer_address_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_address_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_address_customer_id_seq OWNER TO postgres;

--
-- Name: customer_address_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_address_customer_id_seq OWNED BY public.customer_address_customer.id;


--
-- Name: customer_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_address_id_seq OWNER TO postgres;

--
-- Name: customer_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_address_id_seq OWNED BY public.customer_address.id;


--
-- Name: customer_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_customer (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    mobile character varying(10),
    profile_image character varying(100),
    amount_of_shopping integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    CONSTRAINT customer_customer_amount_of_shopping_check CHECK ((amount_of_shopping >= 0))
);


ALTER TABLE public.customer_customer OWNER TO postgres;

--
-- Name: customer_customer_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_customer_groups (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.customer_customer_groups OWNER TO postgres;

--
-- Name: customer_customer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_groups_id_seq OWNER TO postgres;

--
-- Name: customer_customer_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_groups_id_seq OWNED BY public.customer_customer_groups.id;


--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer_customer.id;


--
-- Name: customer_customer_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_customer_user_permissions (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.customer_customer_user_permissions OWNER TO postgres;

--
-- Name: customer_customer_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_user_permissions_id_seq OWNER TO postgres;

--
-- Name: customer_customer_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_user_permissions_id_seq OWNED BY public.customer_customer_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: order_discountcode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_discountcode (
    id bigint NOT NULL,
    code character varying(200),
    amount smallint NOT NULL,
    created timestamp with time zone NOT NULL,
    expire_date timestamp with time zone NOT NULL,
    customer_id bigint,
    is_active boolean NOT NULL,
    CONSTRAINT order_discountcode_amount_check CHECK ((amount >= 0))
);


ALTER TABLE public.order_discountcode OWNER TO postgres;

--
-- Name: order_discountcode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_discountcode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_discountcode_id_seq OWNER TO postgres;

--
-- Name: order_discountcode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_discountcode_id_seq OWNED BY public.order_discountcode.id;


--
-- Name: order_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_order (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    status character varying(30) NOT NULL,
    customer_id bigint,
    discount_id bigint,
    address_id bigint,
    total_price integer,
    CONSTRAINT order_order_total_price_check CHECK ((total_price >= 0))
);


ALTER TABLE public.order_order OWNER TO postgres;

--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO postgres;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public.order_order.id;


--
-- Name: order_order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_order_products (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    orderitem_id bigint NOT NULL
);


ALTER TABLE public.order_order_products OWNER TO postgres;

--
-- Name: order_order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_products_id_seq OWNER TO postgres;

--
-- Name: order_order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_order_products_id_seq OWNED BY public.order_order_products.id;


--
-- Name: order_orderitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_orderitem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    product character varying(200) NOT NULL
);


ALTER TABLE public.order_orderitem OWNER TO postgres;

--
-- Name: order_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_orderitem_id_seq OWNER TO postgres;

--
-- Name: order_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_orderitem_id_seq OWNED BY public.order_orderitem.id;


--
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    id bigint NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- Name: product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_category_id_seq OWNER TO postgres;

--
-- Name: product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_category_id_seq OWNED BY public.product_category.id;


--
-- Name: product_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_product (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    description text NOT NULL,
    price numeric(8,2) NOT NULL,
    image character varying(100),
    number integer,
    date_added timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    category_id bigint NOT NULL,
    CONSTRAINT product_product_number_check CHECK ((number >= 0))
);


ALTER TABLE public.product_product OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product_product.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: customer_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_address ALTER COLUMN id SET DEFAULT nextval('public.customer_address_id_seq'::regclass);


--
-- Name: customer_address_customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_address_customer ALTER COLUMN id SET DEFAULT nextval('public.customer_address_customer_id_seq'::regclass);


--
-- Name: customer_customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer ALTER COLUMN id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Name: customer_customer_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_groups ALTER COLUMN id SET DEFAULT nextval('public.customer_customer_groups_id_seq'::regclass);


--
-- Name: customer_customer_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.customer_customer_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: order_discountcode id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_discountcode ALTER COLUMN id SET DEFAULT nextval('public.order_discountcode_id_seq'::regclass);


--
-- Name: order_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order ALTER COLUMN id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- Name: order_order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order_products ALTER COLUMN id SET DEFAULT nextval('public.order_order_products_id_seq'::regclass);


--
-- Name: order_orderitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_orderitem ALTER COLUMN id SET DEFAULT nextval('public.order_orderitem_id_seq'::regclass);


--
-- Name: product_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category ALTER COLUMN id SET DEFAULT nextval('public.product_category_id_seq'::regclass);


--
-- Name: product_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product ALTER COLUMN id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Customer	6	add_customer
22	Can change Customer	6	change_customer
23	Can delete Customer	6	delete_customer
24	Can view Customer	6	view_customer
25	Can add Address	7	add_address
26	Can change Address	7	change_address
27	Can delete Address	7	delete_address
28	Can view Address	7	view_address
29	Can add Discount 	8	add_discountcode
30	Can change Discount 	8	change_discountcode
31	Can delete Discount 	8	delete_discountcode
32	Can view Discount 	8	view_discountcode
33	Can add Order	9	add_order
34	Can change Order	9	change_order
35	Can delete Order	9	delete_order
36	Can view Order	9	view_order
37	Can add Order history	10	add_orderhistory
38	Can change Order history	10	change_orderhistory
39	Can delete Order history	10	delete_orderhistory
40	Can view Order history	10	view_orderhistory
41	Can add Category	11	add_category
42	Can change Category	11	change_category
43	Can delete Category	11	delete_category
44	Can view Category	11	view_category
45	Can add Product	12	add_product
46	Can change Product	12	change_product
47	Can delete Product	12	delete_product
48	Can view Product	12	view_product
49	Can add Order item	13	add_orderitem
50	Can change Order item	13	change_orderitem
51	Can delete Order item	13	delete_orderitem
52	Can view Order item	13	view_orderitem
\.


--
-- Data for Name: customer_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_address (id, country, province, city, phone, postcode, address_line, updated_at) FROM stdin;
2	ایران	آذربایجان شرقی	عجب شیر	09149202645	5547148956	سعادت آباد- خیابان امیرکبیر- کوچه مکتب شریف - پلاک 10	2021-10-05 16:08:59.717794+03:30
3	ایران	تهران	تهران	09149202654	5547148856	دولت آباد- فلکه دوم- کوچه آلاله - پلاک 20	2021-10-05 16:15:07.539073+03:30
\.


--
-- Data for Name: customer_address_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_address_customer (id, address_id, customer_id) FROM stdin;
1	2	1
2	3	3
\.


--
-- Data for Name: customer_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_customer (id, password, last_login, is_superuser, username, first_name, last_name, date_joined, email, mobile, profile_image, amount_of_shopping, created, updated, is_active, is_staff) FROM stdin;
11	pbkdf2_sha256$260000$k1KcjSH0IMv4oXISwfbl7S$6p9PMiVtnabqIz9hMEa3ptywmvXdA12Sk4anQ/6TiiM=	2021-10-08 14:30:29.330183+03:30	f	erfan			2021-10-08 14:30:11.442104+03:30	erfan@gmail.com	\N		0	2021-10-08 14:30:11.443068+03:30	2021-10-08 14:30:12.02459+03:30	t	f
12	pbkdf2_sha256$260000$UQuRatbAo3tttW88oZ0VfK$iLbmxLQ6Ix11WJ+AGcrYWzHgBvzo5ajt7FwoXD8XTUo=	\N	f	sasan			2021-10-08 14:35:01.222747+03:30	sasan@gmail.com	\N		0	2021-10-08 14:35:01.222747+03:30	2021-10-08 14:35:01.635118+03:30	t	f
1	pbkdf2_sha256$260000$rRSYyVWYrCy0qXXUfI7DHW$e5/w1+tbNuR2nDVPdKlwwy4nijpHHZ8AHS3A8OM0AFY=	2021-10-12 01:46:23.298179+03:30	t	sajjad	sajjad	yadollahzadeh	2021-09-25 10:14:38.193352+03:30	sajjad@gmail.com	\N	customer/user_images/tv1.jpg	0	2021-09-25 10:14:38.538712+03:30	2021-10-08 14:48:26.659428+03:30	t	t
3	pbkdf2_sha256$260000$6QU1W3t35AHwyui4Iq5DlJ$ZQ4kenkut4wUdqfaxdjvIjvAyIHCDatszflm4vomtYg=	2021-10-08 14:26:47.682336+03:30	f	mamad			2021-09-28 17:29:28.090939+03:30	mamad@gmail.com	\N		0	2021-09-28 17:29:28.091884+03:30	2021-09-28 17:29:28.595229+03:30	t	f
\.


--
-- Data for Name: customer_customer_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_customer_groups (id, customer_id, group_id) FROM stdin;
\.


--
-- Data for Name: customer_customer_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_customer_user_permissions (id, customer_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-09-25 10:21:10.20166+03:30	1	کالای دیجیتال	1	[{"added": {}}]	11	1
2	2021-09-25 10:21:47.352047+03:30	2	سامسونگ	1	[{"added": {}}]	11	1
3	2021-09-25 10:22:57.98853+03:30	3	گوشی موبایل	1	[{"added": {}}]	11	1
4	2021-09-25 10:23:08.02855+03:30	4	اپل	1	[{"added": {}}]	11	1
5	2021-09-25 10:23:33.801713+03:30	1	کالای دیجیتال	2	[]	11	1
6	2021-09-25 10:23:44.54337+03:30	4	اپل	2	[]	11	1
7	2021-09-25 10:24:00.354576+03:30	3	گوشی موبایل	2	[]	11	1
8	2021-09-25 10:24:02.057137+03:30	2	سامسونگ	2	[{"changed": {"fields": ["Parent"]}}]	11	1
9	2021-09-25 10:24:16.768359+03:30	1	کالای دیجیتال	2	[]	11	1
10	2021-09-25 10:24:22.996958+03:30	2	سامسونگ	2	[]	11	1
11	2021-09-25 10:25:03.951732+03:30	3	گوشی موبایل	2	[]	11	1
12	2021-09-25 10:25:06.671177+03:30	5	شیائومی	1	[{"added": {}}]	11	1
13	2021-09-25 10:33:36.398328+03:30	1	گوشی موبایل سامسونگ مدل Galaxy A32 SM-A325F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 6 گیگابایت	1	[{"added": {}}]	12	1
14	2021-09-25 10:35:25.089961+03:30	2	گوشی موبایل سامسونگ مدل Galaxy A12 SM-A125F/DS دو سیم کارت ظرفیت 64 گیگابایت	1	[{"added": {}}]	12	1
15	2021-09-25 10:37:18.13856+03:30	3	گوشی موبایل سامسونگ مدل Galaxy A21S SM-A217F/DS دو سیم‌کارت ظرفیت 64 گیگابایت و رم 4 گیگابایت	1	[{"added": {}}]	12	1
16	2021-09-25 10:38:35.570177+03:30	4	گوشی موبایل سامسونگ مدل A52 SM-A525F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 8 گیگابایت	1	[{"added": {}}]	12	1
17	2021-09-25 10:40:44.844331+03:30	5	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت	1	[{"added": {}}]	12	1
18	2021-09-25 10:42:26.23145+03:30	6	گوشی موبایل اپل مدل iPhone 12 A2404 دو سیم‌ کارت ظرفیت 128 گیگابایت	1	[{"added": {}}]	12	1
19	2021-09-25 10:46:04.830907+03:30	6	مد و پوشاک	1	[{"added": {}}]	11	1
20	2021-09-25 10:46:49.508107+03:30	7	لباس مردانه	1	[{"added": {}}]	11	1
21	2021-09-25 10:46:53.732857+03:30	8	پیراهن	1	[{"added": {}}]	11	1
22	2021-09-25 10:47:02.99518+03:30	7	لباس مردانه	2	[]	11	1
23	2021-09-25 10:47:04.463502+03:30	8	پیراهن	2	[]	11	1
24	2021-09-25 10:48:54.580495+03:30	7	پیراهن مردانه مدل bn10000	1	[{"added": {}}]	12	1
25	2021-09-25 10:49:45.888576+03:30	8	پیراهن مردانه پازوواليانت مدل M3	1	[{"added": {}}]	12	1
26	2021-09-25 10:52:18.951136+03:30	9	خانه و آشپزخانه	1	[{"added": {}}]	11	1
27	2021-09-25 10:53:29.112191+03:30	10	صوتی و تصویری	1	[{"added": {}}]	11	1
28	2021-09-25 10:53:32.422166+03:30	11	تلویزیون	1	[{"added": {}}]	11	1
29	2021-09-25 10:54:28.754793+03:30	9	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ	1	[{"added": {}}]	12	1
30	2021-09-25 10:55:32.790343+03:30	10	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ	1	[{"added": {}}]	12	1
31	2021-09-25 10:58:30.831382+03:30	1	کد تخفیف روز پدر -- 10%	1	[{"added": {}}]	8	1
32	2021-09-25 10:59:27.732538+03:30	2	کد تخفیف نوروز -- 20%	1	[{"added": {}}]	8	1
33	2021-09-25 11:01:17.676345+03:30	1	Address	1	[{"added": {}}]	7	1
34	2021-09-25 11:01:56.230954+03:30	1	sajjad	1	[{"added": {}}]	9	1
35	2021-09-25 11:02:34.269133+03:30	2	sajjad	1	[{"added": {}}]	9	1
36	2021-09-25 11:58:43.367093+03:30	11	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ	1	[{"added": {}}]	12	1
37	2021-09-25 12:00:58.47852+03:30	1	گوشی موبایل سامسونگ مدل Galaxy A32 SM-A325F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 6 گیگابایت	2	[{"changed": {"fields": ["Image"]}}]	12	1
38	2021-09-25 12:02:00.457219+03:30	2	گوشی موبایل سامسونگ مدل Galaxy A12 SM-A125F/DS دو سیم کارت ظرفیت 64 گیگابایت	2	[{"changed": {"fields": ["Image"]}}]	12	1
39	2021-09-25 12:02:09.742567+03:30	2	گوشی موبایل سامسونگ مدل Galaxy A12 SM-A125F/DS دو سیم کارت ظرفیت 64 گیگابایت	2	[]	12	1
40	2021-09-25 12:02:14.015432+03:30	1	گوشی موبایل سامسونگ مدل Galaxy A32 SM-A325F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 6 گیگابایت	2	[]	12	1
41	2021-09-25 12:02:24.670011+03:30	3	گوشی موبایل سامسونگ مدل Galaxy A21S SM-A217F/DS دو سیم‌کارت ظرفیت 64 گیگابایت و رم 4 گیگابایت	2	[{"changed": {"fields": ["Image"]}}]	12	1
42	2021-09-25 12:02:40.4912+03:30	4	گوشی موبایل سامسونگ مدل A52 SM-A525F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 8 گیگابایت	2	[{"changed": {"fields": ["Image"]}}]	12	1
43	2021-09-25 12:02:49.577394+03:30	4	گوشی موبایل سامسونگ مدل A52 SM-A525F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 8 گیگابایت	2	[]	12	1
44	2021-09-25 12:03:01.474083+03:30	5	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت	2	[{"changed": {"fields": ["Image"]}}]	12	1
45	2021-09-25 12:03:12.645098+03:30	6	گوشی موبایل اپل مدل iPhone 12 A2404 دو سیم‌ کارت ظرفیت 128 گیگابایت	2	[{"changed": {"fields": ["Image"]}}]	12	1
46	2021-09-25 12:03:23.533881+03:30	7	پیراهن مردانه مدل bn10000	2	[{"changed": {"fields": ["Image"]}}]	12	1
47	2021-09-25 12:03:33.339723+03:30	8	پیراهن مردانه پازوواليانت مدل M3	2	[{"changed": {"fields": ["Image"]}}]	12	1
48	2021-09-25 12:03:46.566582+03:30	9	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
49	2021-09-25 12:03:54.575826+03:30	10	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
50	2021-09-25 12:04:02.957315+03:30	11	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
51	2021-09-27 05:13:17.427463+03:30	2	roan	2	[{"changed": {"fields": ["Is staff"]}}]	6	1
52	2021-09-27 05:32:41.705805+03:30	8	پیراهن مردانه پازوواليانت مدل M3	2	[{"changed": {"fields": ["Image"]}}]	12	1
53	2021-09-27 05:33:54.862802+03:30	9	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
54	2021-09-27 05:34:58.021778+03:30	10	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
55	2021-09-27 05:37:00.665421+03:30	11	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
56	2021-09-27 05:55:19.813004+03:30	9	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
57	2021-09-27 06:06:22.107481+03:30	11	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
58	2021-09-27 06:06:30.64218+03:30	10	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
59	2021-09-27 06:06:40.676234+03:30	9	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
60	2021-09-27 06:06:52.907268+03:30	8	پیراهن مردانه پازوواليانت مدل M3	2	[{"changed": {"fields": ["Image"]}}]	12	1
61	2021-09-27 06:07:03.86215+03:30	7	پیراهن مردانه مدل bn10000	2	[{"changed": {"fields": ["Image"]}}]	12	1
62	2021-09-27 06:25:37.253581+03:30	11	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
63	2021-09-27 06:25:46.66207+03:30	10	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
64	2021-09-27 06:25:55.726245+03:30	9	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
65	2021-09-27 06:26:05.610162+03:30	8	پیراهن مردانه پازوواليانت مدل M3	2	[{"changed": {"fields": ["Image"]}}]	12	1
66	2021-09-27 06:26:15.262871+03:30	7	پیراهن مردانه مدل bn10000	2	[{"changed": {"fields": ["Image"]}}]	12	1
67	2021-09-27 06:32:03.465998+03:30	11	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
68	2021-09-27 06:32:12.444126+03:30	10	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
69	2021-09-27 06:32:22.12383+03:30	9	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ	2	[{"changed": {"fields": ["Image"]}}]	12	1
70	2021-09-27 06:34:49.442733+03:30	8	پیراهن مردانه پازوواليانت مدل M3	2	[{"changed": {"fields": ["Image"]}}]	12	1
71	2021-09-27 06:34:58.554954+03:30	7	پیراهن مردانه مدل bn10000	2	[{"changed": {"fields": ["Image"]}}]	12	1
72	2021-09-27 13:39:36.089885+03:30	3	موبایل	2	[{"changed": {"fields": ["Name"]}}]	11	1
73	2021-09-27 13:39:51.803087+03:30	2	گوشی موبایل سامسونگ مدل Galaxy A12 SM-A125F/DS دو سیم کارت ظرفیت 64 گیگابایت	2	[{"changed": {"fields": ["Category"]}}]	12	1
74	2021-09-27 13:39:59.804322+03:30	11	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ	2	[]	12	1
75	2021-09-27 13:40:24.187322+03:30	6	گوشی موبایل اپل مدل iPhone 12 A2404 دو سیم‌ کارت ظرفیت 128 گیگابایت	2	[{"changed": {"fields": ["Category"]}}]	12	1
76	2021-09-27 13:40:32.703002+03:30	5	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت	2	[{"changed": {"fields": ["Category"]}}]	12	1
77	2021-09-27 13:40:39.236881+03:30	5	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت	2	[]	12	1
78	2021-09-27 13:40:46.205166+03:30	4	گوشی موبایل سامسونگ مدل A52 SM-A525F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 8 گیگابایت	2	[{"changed": {"fields": ["Category"]}}]	12	1
79	2021-09-27 13:40:52.955229+03:30	3	گوشی موبایل سامسونگ مدل Galaxy A21S SM-A217F/DS دو سیم‌کارت ظرفیت 64 گیگابایت و رم 4 گیگابایت	2	[{"changed": {"fields": ["Category"]}}]	12	1
80	2021-09-27 13:41:01.987424+03:30	2	گوشی موبایل سامسونگ مدل Galaxy A12 SM-A125F/DS دو سیم کارت ظرفیت 64 گیگابایت	2	[]	12	1
81	2021-09-27 13:41:07.923732+03:30	1	گوشی موبایل سامسونگ مدل Galaxy A32 SM-A325F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 6 گیگابایت	2	[{"changed": {"fields": ["Category"]}}]	12	1
82	2021-09-27 13:41:19.732429+03:30	4	اپل	3		11	1
83	2021-09-27 13:41:30.850459+03:30	9	خانه و آشپزخانه	3		11	1
84	2021-09-27 13:42:13.63706+03:30	2	سامسونگ	3		11	1
85	2021-09-27 13:42:24.082435+03:30	5	شیائومی	3		11	1
86	2021-09-27 13:43:01.969614+03:30	8	پیراهن	2	[{"changed": {"fields": ["Parent"]}}]	11	1
87	2021-09-27 13:43:04.549941+03:30	7	پیراهن مردانه مدل bn10000	2	[]	12	1
88	2021-09-27 13:43:10.42324+03:30	8	پیراهن	2	[]	11	1
89	2021-09-27 13:43:18.251305+03:30	8	پیراهن	2	[]	11	1
90	2021-09-27 13:43:29.38039+03:30	6	مد و پوشاک	3		11	1
91	2021-09-27 13:43:55.734119+03:30	3	موبایل	2	[{"changed": {"fields": ["Parent"]}}]	11	1
92	2021-09-27 13:43:58.371497+03:30	6	گوشی موبایل اپل مدل iPhone 12 A2404 دو سیم‌ کارت ظرفیت 128 گیگابایت	2	[]	12	1
93	2021-09-27 13:44:03.689297+03:30	3	موبایل	2	[]	11	1
94	2021-09-27 13:44:05.385824+03:30	5	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت	2	[]	12	1
95	2021-09-27 13:44:11.344203+03:30	3	موبایل	2	[]	11	1
96	2021-09-27 13:44:13.747368+03:30	4	گوشی موبایل سامسونگ مدل A52 SM-A525F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 8 گیگابایت	2	[]	12	1
97	2021-09-27 13:44:20.171162+03:30	3	موبایل	2	[]	11	1
98	2021-09-27 13:44:23.78843+03:30	4	گوشی موبایل سامسونگ مدل A52 SM-A525F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 8 گیگابایت	2	[]	12	1
99	2021-09-27 13:44:30.572557+03:30	3	موبایل	2	[]	11	1
100	2021-09-27 13:44:35.101681+03:30	3	موبایل	2	[]	11	1
101	2021-09-27 13:44:36.925305+03:30	3	گوشی موبایل سامسونگ مدل Galaxy A21S SM-A217F/DS دو سیم‌کارت ظرفیت 64 گیگابایت و رم 4 گیگابایت	2	[]	12	1
102	2021-09-27 13:44:44.062747+03:30	3	موبایل	2	[]	11	1
103	2021-09-27 13:44:45.607158+03:30	2	گوشی موبایل سامسونگ مدل Galaxy A12 SM-A125F/DS دو سیم کارت ظرفیت 64 گیگابایت	2	[]	12	1
104	2021-09-27 13:44:51.342315+03:30	1	کالای دیجیتال	3		11	1
105	2021-09-27 13:45:05.998505+03:30	12	تلویزیون	1	[{"added": {}}]	11	1
191	2021-10-12 01:48:51.829435+03:30	32	sajjad	3		9	1
106	2021-09-27 13:47:51.746034+03:30	13	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ	1	[{"added": {}}]	12	1
107	2021-09-27 13:47:51.749038+03:30	12	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ	1	[{"added": {}}]	12	1
108	2021-09-27 13:48:21.173607+03:30	12	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ	3		12	1
109	2021-09-27 13:49:08.658418+03:30	14	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ	1	[{"added": {}}]	12	1
110	2021-09-27 13:49:46.064164+03:30	15	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ	1	[{"added": {}}]	12	1
111	2021-10-05 16:08:59.968021+03:30	2	Address	1	[{"added": {}}]	7	1
112	2021-10-05 16:10:02.73296+03:30	1	code10 -- 10%	2	[{"changed": {"fields": ["Code", "Expire date"]}}]	8	1
113	2021-10-05 16:11:23.633715+03:30	3	code20 -- 20%	1	[{"added": {}}]	8	1
114	2021-10-05 16:12:53.928233+03:30	1	Address	3		7	1
115	2021-10-05 16:13:33.940158+03:30	4	code30 -- 30%	1	[{"added": {}}]	8	1
116	2021-10-05 16:15:07.552084+03:30	3	Address	1	[{"added": {}}]	7	1
117	2021-10-06 08:03:54.194012+03:30	1	sajjad	3		9	1
118	2021-10-06 08:04:05.402104+03:30	2	کد تخفیف نوروز -- 20%	3		8	1
119	2021-10-06 08:05:43.462187+03:30	5	code50 -- 50%	1	[{"added": {}}]	8	1
120	2021-10-06 22:16:18.918573+03:30	10	ali	3		6	1
121	2021-10-06 22:16:35.192273+03:30	9	amir3	3		6	1
122	2021-10-06 22:16:40.675172+03:30	8	amir2	3		6	1
123	2021-10-06 22:16:46.16011+03:30	7	amir	3		6	1
124	2021-10-06 22:16:51.817253+03:30	6	ehsan	3		6	1
125	2021-10-06 22:16:56.408342+03:30	5	karim	3		6	1
126	2021-10-06 22:17:00.928415+03:30	4	erfan	3		6	1
127	2021-10-06 22:17:05.947936+03:30	2	roan	3		6	1
128	2021-10-07 10:29:49.798751+03:30	2	sajjad	3		9	1
129	2021-10-07 10:29:57.222445+03:30	1	code10 -- 10%	3		8	1
130	2021-10-07 10:30:01.923687+03:30	3	code20 -- 20%	3		8	1
131	2021-10-07 10:30:07.816998+03:30	4	code30 -- 30%	3		8	1
132	2021-10-07 10:30:12.379112+03:30	5	code50 -- 50%	3		8	1
133	2021-10-07 10:30:44.703259+03:30	6	code10 -- 10%	1	[{"added": {}}]	8	1
134	2021-10-07 10:31:46.868317+03:30	7	code20 -- 20%	1	[{"added": {}}]	8	1
135	2021-10-07 10:32:19.48973+03:30	8	code30 -- 30%	1	[{"added": {}}]	8	1
136	2021-10-07 10:32:42.327322+03:30	9	code50 -- 50%	1	[{"added": {}}]	8	1
137	2021-10-07 10:33:14.314193+03:30	10	code40 -- 40%	1	[{"added": {}}]	8	1
138	2021-10-07 15:53:33.039869+03:30	10	sajjad	3		9	1
139	2021-10-07 16:43:17.956865+03:30	1	None--2	1	[{"added": {}}]	13	1
140	2021-10-07 16:43:24.180524+03:30	2	None--1	1	[{"added": {}}]	13	1
141	2021-10-07 16:43:36.100226+03:30	11	sajjad	2	[{"changed": {"fields": ["Products", "Discount"]}}]	9	1
142	2021-10-07 16:44:04.809115+03:30	11	sajjad	2	[]	9	1
143	2021-10-07 16:54:36.761999+03:30	3	None--2	1	[{"added": {}}]	13	1
144	2021-10-07 16:54:57.248455+03:30	12	sajjad	1	[{"added": {}}]	9	1
145	2021-10-07 23:16:43.540369+03:30	13	sajjad	3		9	1
146	2021-10-07 23:16:48.665971+03:30	12	sajjad	3		9	1
147	2021-10-07 23:16:52.938803+03:30	11	sajjad	3		9	1
148	2021-10-07 23:39:17.749684+03:30	16	sajjad	3		9	1
149	2021-10-07 23:39:22.559001+03:30	15	sajjad	3		9	1
150	2021-10-07 23:39:26.922917+03:30	14	sajjad	3		9	1
151	2021-10-08 00:05:23.361993+03:30	24	sajjad	3		9	1
152	2021-10-08 00:05:29.225254+03:30	23	sajjad	3		9	1
153	2021-10-08 00:05:34.13366+03:30	22	sajjad	3		9	1
154	2021-10-08 00:05:43.122727+03:30	21	sajjad	3		9	1
155	2021-10-08 00:05:43.147749+03:30	20	sajjad	3		9	1
156	2021-10-08 00:05:43.213808+03:30	19	sajjad	3		9	1
157	2021-10-08 00:05:43.26986+03:30	18	sajjad	3		9	1
158	2021-10-08 00:05:43.272861+03:30	17	sajjad	3		9	1
159	2021-10-08 09:42:24.457372+03:30	27	sajjad	3		9	1
160	2021-10-08 09:42:24.824694+03:30	26	sajjad	3		9	1
161	2021-10-08 09:42:24.85372+03:30	25	sajjad	3		9	1
162	2021-10-08 12:16:28.586306+03:30	30	sajjad	3		9	1
163	2021-10-08 12:16:28.716495+03:30	29	sajjad	3		9	1
164	2021-10-08 12:21:11.32439+03:30	3	null--2	3		13	1
165	2021-10-08 12:21:11.33335+03:30	2	null--1	3		13	1
166	2021-10-08 12:21:11.336398+03:30	1	null--2	3		13	1
167	2021-10-08 12:21:33.885772+03:30	14	پیراهن مردانه پازوواليانت مدل M3--3	3		13	1
168	2021-10-08 12:21:33.894782+03:30	13	پیراهن مردانه پازوواليانت مدل M3--2	3		13	1
169	2021-10-08 12:21:33.896788+03:30	12	پیراهن مردانه پازوواليانت مدل M3--2	3		13	1
170	2021-10-08 12:21:40.241526+03:30	8	پیراهن مردانه پازوواليانت مدل M3--3	3		13	1
171	2021-10-08 12:21:58.444037+03:30	31	mamad	3		9	1
172	2021-10-08 12:22:03.09322+03:30	28	sajjad	3		9	1
173	2021-10-08 12:22:10.157617+03:30	11	گوشی موبایل سامسونگ مدل Galaxy A21S SM-A217F/DS دو سیم‌کارت ظرفیت 64 گیگابایت و رم 4 گیگابایت--2	3		13	1
174	2021-10-08 12:22:10.165625+03:30	10	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ--3	3		13	1
175	2021-10-08 12:22:10.167627+03:30	9	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ--2	3		13	1
176	2021-10-08 12:22:10.168628+03:30	7	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت--3	3		13	1
177	2021-10-08 12:22:10.171632+03:30	6	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ--2	3		13	1
178	2021-10-08 12:22:10.174633+03:30	5	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ--2	3		13	1
179	2021-10-08 12:22:10.175634+03:30	4	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ--3	3		13	1
180	2021-10-12 01:48:50.556155+03:30	43	sajjad	3		9	1
181	2021-10-12 01:48:51.800321+03:30	42	sajjad	3		9	1
182	2021-10-12 01:48:51.803314+03:30	41	sajjad	3		9	1
183	2021-10-12 01:48:51.806283+03:30	40	sajjad	3		9	1
184	2021-10-12 01:48:51.810353+03:30	39	sajjad	3		9	1
185	2021-10-12 01:48:51.814345+03:30	38	sajjad	3		9	1
186	2021-10-12 01:48:51.817358+03:30	37	sajjad	3		9	1
187	2021-10-12 01:48:51.819354+03:30	36	sajjad	3		9	1
188	2021-10-12 01:48:51.822304+03:30	35	sajjad	3		9	1
189	2021-10-12 01:48:51.824353+03:30	34	sajjad	3		9	1
190	2021-10-12 01:48:51.827358+03:30	33	sajjad	3		9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	customer	customer
7	customer	address
8	order	discountcode
9	order	order
10	order	orderhistory
11	product	category
12	product	product
13	order	orderitem
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-09-25 10:13:58.044269+03:30
2	contenttypes	0002_remove_content_type_name	2021-09-25 10:13:58.06429+03:30
3	auth	0001_initial	2021-09-25 10:13:58.511748+03:30
4	auth	0002_alter_permission_name_max_length	2021-09-25 10:13:58.530712+03:30
5	auth	0003_alter_user_email_max_length	2021-09-25 10:13:58.552727+03:30
6	auth	0004_alter_user_username_opts	2021-09-25 10:13:58.5858+03:30
7	auth	0005_alter_user_last_login_null	2021-09-25 10:13:58.599769+03:30
8	auth	0006_require_contenttypes_0002	2021-09-25 10:13:58.615784+03:30
9	auth	0007_alter_validators_add_error_messages	2021-09-25 10:13:58.629812+03:30
10	auth	0008_alter_user_username_max_length	2021-09-25 10:13:58.644812+03:30
11	auth	0009_alter_user_last_name_max_length	2021-09-25 10:13:58.655867+03:30
12	auth	0010_alter_group_name_max_length	2021-09-25 10:13:58.687851+03:30
13	auth	0011_update_proxy_permissions	2021-09-25 10:13:58.697861+03:30
14	auth	0012_alter_user_first_name_max_length	2021-09-25 10:13:58.70987+03:30
15	customer	0001_initial	2021-09-25 10:13:59.580657+03:30
16	admin	0001_initial	2021-09-25 10:13:59.819932+03:30
17	admin	0002_logentry_remove_auto_add	2021-09-25 10:13:59.853963+03:30
18	admin	0003_logentry_add_action_flag_choices	2021-09-25 10:13:59.883926+03:30
19	product	0001_initial	2021-09-25 10:14:00.265337+03:30
20	order	0001_initial	2021-09-25 10:14:01.215123+03:30
21	sessions	0001_initial	2021-09-25 10:14:01.501447+03:30
22	product	0002_remove_category_parent	2021-09-27 15:53:36.773502+03:30
23	customer	0002_auto_20210930_1143	2021-09-30 11:43:30.26319+03:30
24	order	0002_auto_20210930_1143	2021-09-30 11:43:31.613469+03:30
25	order	0003_order_address	2021-10-05 13:08:01.16582+03:30
26	order	0004_alter_order_discount	2021-10-07 15:49:06.68567+03:30
27	order	0005_order_total_price	2021-10-07 23:26:43.015361+03:30
28	order	0006_auto_20211007_2343	2021-10-07 23:43:22.55338+03:30
29	order	0007_order_total_price_with_discount	2021-10-11 22:46:40.704596+03:30
30	order	0008_remove_order_total_price_with_discount	2021-10-12 00:23:27.829387+03:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
zspntghdumcd6e3enb4sx05cwesw5sr7	.eJxVjTsOgzAQRO-yNbJs_MFQps8Z0Hp3CYQIJAwV4u4BiYZqpDdPMzskzKOs0OxgPDRgoYDqzBKOAlrc1r7dsiztwCc08GAJaZTpKviL02dWNE_rMiR1Kepus3rPLL_X7T4Gesz99eUDcdQak2MuY_QUYl1zDEGc2NoJa2YTYpcqQtuJNlgKE1IylfHWwfEH7Ew_Mg:1mY6MW:tBImuQyVJiv-4M38lXgq7werZOrUoUJtkDwB84bQ0do	2021-10-20 16:19:32.418435+03:30
df0sbpws43dook4h5ygrdzbdca44365k	eyJjYXJ0Ijp7fX0:1mVb7J:T6yK6n2QlON0dvGp2H0lUQTxixh4gY72pXsJnJIMUYo	2021-10-13 18:33:29.333386+03:30
pj84o7l4rxk1cu1r7ak5s2npmqlrqo6z	.eJxVjDEOgzAQBP9ydWTZYBtDmZ43WOe7IyaJQDJQIf6eINHQ7szsDoRlhW4_HhBxW3PcFilxZOjAwG1LSB-ZTsBvnF6zonlay5jUqaiLLqqfWb7Py70dZFzyv66cJw5aY7LMVQiOfGhbDt6Llbq1wprZ-DCkhrAeRBushAkpmca42sLxAzKyO7A:1mWYab:onji3xqN4UO6ncmu8Ff1dyafw2E7dgBXqJfdGIPS7K4	2021-10-16 10:03:41.574631+03:30
e3omcbzc53yiy5h5fw5zllydpl12m5bn	.eJyrVkpKLM5OLVGyqlYyUbJSMlLSUTIEMYxBDFOoiBmUNgfSJkq1tQBg9gvM:1mXGMe:jawjmCe_u6d2tWsROMAA6So9diIi2lx5URgRgNMVhXA	2021-10-18 08:48:12.373359+03:30
q9vscvofacxezw60rwhgrczxk4mulrpz	eyJiYXNrZXQiOnt9fQ:1mXGhj:3lgEyc1YGjeizWm9otyBkD25R6k-HAv5JHSCH5iJy1I	2021-10-18 09:09:59.599128+03:30
a7a104h1kk19ml711a7k4br64ugs3gma	.eJxVjEEOwiAQRe_C2hCgQMGle89AhpmpVA0kpV0Z765NutDtf-_9l0iwrSVtnZc0kzgLLU6_WwZ8cN0B3aHemsRW12XOclfkQbu8NuLn5XD_Dgr08q2N80hBKciWyITg0IcYKXjPlodomRSR9mHKI8IwsdJgmBAw61G7wYr3B-tfOGQ:1mYTEZ:jVovUmT4edH72MXA7iFVErzDBowZlS0mbJaKiN61vuI	2021-10-21 16:44:51.875554+03:30
6z82aaahtr6olm8dotea4poc4lqh124o	eyJjYXJ0Ijp7IjYiOiIxIiwiMTMiOiIxIn19:1mWicp:-I92xkpt2Gu3ZnuukClj-FMr8RpM6mu9DjqdNm-3Yy4	2021-10-16 20:46:39.359063+03:30
rbct0k079b7tpcor5izqga6zyu689vj2	.eJxVjDEOgzAMRe_iuYoSEoLp2L1nQI5tCqUCicCEuHtBYmjX_95_GzS0Ll2zZp2bXuAODm6_WyIedDyBvGl8TYancZn7ZE7FXDSb5yT6eVzuX6Cj3B3voowsaC2lIFIglhyxrgVj1KC-DipWxEVsU8XkW7WOChUmTq5ypQ9HNFEedIH7BngEPez7F07vPa0:1mYY4F:XinBKI4bZxM28ul6x7iHJXC4QpoWDY9dDRqHGruZBAU	2021-10-21 21:54:31.409097+03:30
zbd5velu5q6v5oavsk9z6127ng6casno	.eJxVjDEOgzAQBP9ydWTZ2BhDmZ43oPPdEQgRSNhUiL8HJIqk3ZmdHTrc8tBtSdZuZGjAwON3i0iTzBfgN86vRdEy53WM6lLUTZNqF5bP83b_AgOm4XwXpScOWmN0zEUIJflQ1xy8Fye2dsKa2fjQx4rQ9qINFsKEFE1lSuvOaMQ0SYZmB2OvIhzHF4wkPdg:1mYYAS:m4VuimeaPaV3AFup3ZP3uwWDbqTd7biK7nXtkdQuinw	2021-10-21 22:00:56.872025+03:30
zgznap844c2rwef5wnr2owjiq4b42x1l	eyJjYXJ0Ijp7fX0:1mWWmH:kBToJPvQz8ZBF-nv8QHx__k5vDvwx3TtA1C5k4-3ZTw	2021-10-16 08:07:37.167854+03:30
1footfjhtkdszet7dojyh3ga3il2t7e5	.eJyrVkpOLCpRsqpWMjRWslIyVNJRMoPShiYwhimYUaujlJRYnJ0KVm2OrhiqphYA7kUR7g:1mWjhc:1JIav_ZYNukWkWfXpyvRT0fP3a3ttZBjBrlExj3tUo8	2021-10-16 21:55:40.613961+03:30
wbl96h2w63g27zpxsvhf5nf0xglffhvt	.eJxVjrEOgzAMRP_FM4oSEkJg7M43ICc2hVKBRGBC_HuTioXpne9O1p3gMc68Q3uChRZKKEDpJHQSmSbR3bf58yqgx2Mf-yPy1k-UTAUPz2OYeckBfXB5ryKsy75NXuSKuNMoupX4-7q7jwcjxjGPqWwgJyV6Q1Q6VwXrmoactWxYN4ZJEinrBl8H1ANLhSVTwOBVrSpt4PoBbVJDMg:1mXcqL:HggGlYouRswyJCqLXonLL2F_GGUtHvJbf-uspPIqqlI	2021-10-19 08:48:21.46311+03:30
rnu2a1fi3xovodikvjgwx6rbwllkn9y6	.eJxVjEEOwiAQRe_C2hCgQMGle89AhpmpVA0kpV0Z765NutDtf-_9l0iwrSVtnZc0kzgLLU6_WwZ8cN0B3aHemsRW12XOclfkQbu8NuLn5XD_Dgr08q2N80hBKciWyITg0IcYKXjPlodomRSR9mHKI8IwsdJgmBAw61G7wYr3B-tfOGQ:1mYZc3:du7SGAj-_OV_bUF3fuQnUx3Albt751oNGJ5bOMY6FDU	2021-10-21 23:33:31.10059+03:30
swopeof6gq5mmchf08ijmaui2jkxtc9q	.eJxVjbEKhDAQRP9lawmJiTFaXn_fIJvd9fQ8FEysxH8_BRurgTePmR0ipkkytDsYCy1YKKA-s4SjgA63PHRbkrUb-YQGHiwiTTJfBX9x_iyKljmvY1SXou42qffC8nvd7mNgwDRcX5UnDlpjdMxlCBX50DQcvBcntnHCmtn40Mea0PaiDZbChBRNbSrr4PgD6tg_MA:1mXdGD:6QlaNzUG9fs3eOAvPtB8l-_VTY8WGPRG67liG7iyjp0	2021-10-19 09:15:05.710535+03:30
1r3baq9jq1xrjakg9dn83v24wvwt1q1p	.eJxVzz0OgzAMBeC7eEZRQn4IHbv3DMiJTaFUIBGYUO_e0GZoJ0v-3rPkAwKmiTe4HKDhAgoqMHkaeFUQcf2AskXUN5Kpw30buj3x2o1U9GcXME48n0APnO-LiMu8rWMQZ0QUTeK2ED-vJft3YMA05HZtXSQvJQZDVHtvo_NtS945NqxbwySJlPN9aCLqnqXCmiliDKpRVucv3vURRSQ:1mX39G:1xCMAvR8_hPctKNeS2bOKtDdRn1RJ0LkvIAhbV7XYzM	2021-10-17 18:41:30.171537+03:30
4te8ovaiuliy8djkrjmhl00tzgau8u5z	.eJxVjEEOgyAQRe_CuiGgiOiye89AhpmxWhtIBFfGu1cTF-32v_ffLjxsZfJb5tXPJHqhxeN3C4ALxwvQG-IrSUyxrHOQlyJvmuWQiD_P2_0LTJCn8101FskpBcEQVc41aF3XkbOWDdedYVJE2roxtAj1yEpDxYSAQbe6qc0ZDZAXLqLfj-MLpw88gA:1mYECO:bkOQuM7VcIRp_zouG-rAahLHog_oOkRz6lW6w-_OwVI	2021-10-21 00:41:36.68624+03:30
xhybzydaugcy4km0y3fphng15jj2jhqz	.eJxVjb0OgzAQg9_lZhQl5IfA2J1nQJfcUSgVSAQmxLuXVCxM_mRb9gEB08QbNAcoCw1oKMDfqvQFZQbzh7OADvdt6PbEazfSZSp4eAHjxHMO6IPzexFxmbd1DCJXxJ0m0S7E39fdfQwMmIb8ZV0kLyUGQ1R6b6PzdU3eOTasa8MkiZTzfagi6p6lwpIpYgyqUlYbOH-MS0I9:1mXgME:YfN2zkStp-0cd89gtrX6tKi8VPJ3I9XmKPK7g0SRb0A	2021-10-19 12:33:30.621492+03:30
ols0a3zn7imtu97xx23aa47bt5jeiu0x	.eJxVjDsOgzAQRO_iOrK8-IOhTJ8zoLV3CYQIJGwqxN1jFIqkG72ZebvocMtDtyVeu5FEK0DcflnAOPF8FvTC-bnIuMx5HYM8J_Jqk3wsxO_7tf0TDJiG8q6si-SVwmCIKu9tdL5pyDvHhnVjmBQRON-HOqLuWQFWTBFjgBqsNkUaME2cRbsLsMWoCwJzqkv4guP4ALb4QLY:1mYNSv:SAtyhbCrv6uMgcT_fMwjIP7Cr1ijaaH5Cr-rFb-sx4U	2021-10-21 10:35:17.863572+03:30
eaet8t7hdjxit068xhdzk4fg9pgkajt2	.eJxVjEEOwiAQRe_C2hCgQMGle89AhpmpVA0kpV0Z765NutDtf-_9l0iwrSVtnZc0kzgLLU6_WwZ8cN0B3aHemsRW12XOclfkQbu8NuLn5XD_Dgr08q2N80hBKciWyITg0IcYKXjPlodomRSR9mHKI8IwsdJgmBAw61G7wYr3B-tfOGQ:1ma3c5:XA9mc6oBz-SDM1sSzvdxOmSCj95CDG-D5lGTAx2x_AQ	2021-10-26 01:47:41.473772+03:30
\.


--
-- Data for Name: order_discountcode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_discountcode (id, code, amount, created, expire_date, customer_id, is_active) FROM stdin;
6	code10	10	2021-10-07 10:30:44.645207+03:30	2021-11-30 10:30:23+03:30	1	t
7	code20	20	2021-10-07 10:31:46.864314+03:30	2021-10-07 10:33:39+03:30	1	t
8	code30	30	2021-10-07 10:32:19.485729+03:30	2021-11-10 10:32:12+03:30	1	t
9	code50	50	2021-10-07 10:32:42.323321+03:30	2021-11-10 10:32:31+03:30	3	t
10	code40	40	2021-10-07 10:33:14.311162+03:30	2021-10-07 11:30:00+03:30	3	t
\.


--
-- Data for Name: order_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_order (id, created, updated, status, customer_id, discount_id, address_id, total_price) FROM stdin;
44	2021-10-11 22:47:55.753359+03:30	2021-10-11 22:47:55.753359+03:30	ready to send	1	\N	2	3080780
45	2021-10-11 23:03:53.484181+03:30	2021-10-11 23:03:53.484181+03:30	ready to send	1	\N	2	306490
46	2021-10-11 23:57:05.627659+03:30	2021-10-11 23:57:05.627659+03:30	ready to send	1	\N	2	207740
47	2021-10-12 00:02:29.325955+03:30	2021-10-12 00:02:29.325955+03:30	ready to send	1	\N	2	448000
48	2021-10-12 00:16:55.554152+03:30	2021-10-12 00:16:55.554152+03:30	ready to send	1	\N	2	207740
49	2021-10-12 00:23:50.883191+03:30	2021-10-12 00:23:50.883191+03:30	ready to send	1	\N	2	207740
50	2021-10-12 01:47:40.735104+03:30	2021-10-12 01:47:40.735104+03:30	ready to send	1	\N	2	2890750
\.


--
-- Data for Name: order_order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_order_products (id, order_id, orderitem_id) FROM stdin;
46	44	47
47	44	48
48	44	49
49	44	50
50	45	51
51	45	52
52	46	53
53	47	54
54	48	55
55	49	56
56	50	57
57	50	58
\.


--
-- Data for Name: order_orderitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_orderitem (id, quantity, product) FROM stdin;
15	2	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ
16	4	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت
17	2	پیراهن مردانه مدل bn10000
18	2	گوشی موبایل اپل مدل iPhone 12 A2404 دو سیم‌ کارت ظرفیت 128 گیگابایت
19	2	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ
20	3	پیراهن مردانه پازوواليانت مدل M3
21	4	گوشی موبایل سامسونگ مدل A52 SM-A525F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 8 گیگابایت
22	3	پیراهن مردانه پازوواليانت مدل M3
23	3	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت
24	3	گوشی موبایل سامسونگ مدل A52 SM-A525F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 8 گیگابایت
25	3	پیراهن مردانه پازوواليانت مدل M3
26	2	گوشی موبایل سامسونگ مدل A52 SM-A525F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 8 گیگابایت
27	3	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت
28	2	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ
29	2	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ
30	1	پیراهن مردانه مدل bn10000
31	2	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ
32	3	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت
33	2	گوشی موبایل سامسونگ مدل Galaxy A21S SM-A217F/DS دو سیم‌کارت ظرفیت 64 گیگابایت و رم 4 گیگابایت
34	2	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ
35	2	گوشی موبایل اپل مدل iPhone 12 A2404 دو سیم‌ کارت ظرفیت 128 گیگابایت
36	3	پیراهن مردانه پازوواليانت مدل M3
37	2	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ
38	2	گوشی موبایل سامسونگ مدل A52 SM-A525F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 8 گیگابایت
39	2	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ
40	2	پیراهن مردانه پازوواليانت مدل M3
41	4	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت
42	2	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ
43	2	پیراهن مردانه مدل bn10000
44	2	گوشی موبایل اپل مدل iPhone 12 A2404 دو سیم‌ کارت ظرفیت 128 گیگابایت
45	3	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ
46	1	گوشی موبایل اپل مدل iPhone 12 A2404 دو سیم‌ کارت ظرفیت 128 گیگابایت
47	2	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ
48	4	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ
49	2	پیراهن مردانه پازوواليانت مدل M3
50	3	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت
51	2	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ
52	1	پیراهن مردانه پازوواليانت مدل M3
53	2	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ
54	2	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ
55	2	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ
56	2	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ
57	3	پیراهن مردانه پازوواليانت مدل M3
58	5	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category (id, name) FROM stdin;
8	پیراهن
3	موبایل
12	تلویزیون
\.


--
-- Data for Name: product_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_product (id, name, description, price, image, number, date_added, date_updated, is_active, category_id) FROM stdin;
2	گوشی موبایل سامسونگ مدل Galaxy A12 SM-A125F/DS دو سیم کارت ظرفیت 64 گیگابایت	دو سیم کارت ظرفیت 64 گیگابایت	392000.00	product/GalaxyA21_oPYXv6I.jpg	20	2021-09-25 10:35:25.086959+03:30	2021-09-27 13:44:45.604109+03:30	t	3
13	تلویزیون ال ای دی ایکس ویژن مدل 32XT580 سایز 32 اینچ	تلویزیون ال ای دی ایکس ویژن	518900.00	product/tv1.jpg	8	2021-09-27 13:47:51.652948+03:30	2021-09-27 13:47:51.652948+03:30	t	12
14	تلویزیون ال ای دی هوشمند اسنوا مدل SSD-65SA620U سایز 65 اینچ	لویزیون ال ای دی هوشمند اسنوا	224000.00	product/tv3.jpg	10	2021-09-27 13:49:08.654463+03:30	2021-09-27 13:49:08.654463+03:30	t	12
15	تلویزیون ال ای دی هوشمند جی پلاس مدل GTV-50LU722S سایز 50 اینچ	تلویزیون ال ای دی هوشمند جی پلاس	103870.00	product/tv2.jpg	5	2021-09-27 13:49:46.06116+03:30	2021-09-27 13:49:46.06116+03:30	t	12
1	گوشی موبایل سامسونگ مدل Galaxy A32 SM-A325F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 6 گیگابایت	دو سیم‌کارت ظرفیت 128 گیگابایت و رم 6 گیگابایت	668700.00	product/GalaxyA21.jpg	10	2021-09-25 10:33:36.336251+03:30	2021-09-27 13:41:07.92173+03:30	t	3
7	پیراهن مردانه مدل bn10000	پیراهن مردانه	89320.00	product/pirahan.jpg	15	2021-09-25 10:48:54.576463+03:30	2021-09-27 13:43:04.54794+03:30	t	8
6	گوشی موبایل اپل مدل iPhone 12 A2404 دو سیم‌ کارت ظرفیت 128 گیگابایت	دو سیم‌ کارت ظرفیت 128 گیگابایت	238890.00	product/iPhone12_c51oY4I.jpg	10	2021-09-25 10:42:26.226444+03:30	2021-09-27 13:43:58.368493+03:30	t	3
5	گوشی موبایل اپل مدل iPhone 11 A2223 دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت	دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت	199980.00	product/iPhone12.jpg	8	2021-09-25 10:40:44.840326+03:30	2021-09-27 13:44:05.382821+03:30	t	3
4	گوشی موبایل سامسونگ مدل A52 SM-A525F/DS دو سیم‌کارت ظرفیت 128 گیگابایت و رم 8 گیگابایت	دو سیم‌کارت ظرفیت 128 گیگابایت و رم 8 گیگابایت	999000.00	product/GalaxyA21_APS4zM4.jpg	5	2021-09-25 10:38:35.566145+03:30	2021-09-27 13:44:23.785424+03:30	t	3
3	گوشی موبایل سامسونگ مدل Galaxy A21S SM-A217F/DS دو سیم‌کارت ظرفیت 64 گیگابایت و رم 4 گیگابایت	دو سیم‌کارت ظرفیت 64 گیگابایت و رم 4 گیگابایت	477900.00	product/GalaxyA21_jV0Oc26.jpg	30	2021-09-25 10:37:18.134555+03:30	2021-09-27 13:44:36.922275+03:30	t	3
8	پیراهن مردانه پازوواليانت مدل M3	پیراهن مردانه پازوواليانت	98750.00	product/prrahan2.jpg	7	2021-09-25 10:49:45.884574+03:30	2021-09-27 06:34:49.43873+03:30	t	8
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: customer_address_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_address_customer_id_seq', 2, true);


--
-- Name: customer_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_address_id_seq', 3, true);


--
-- Name: customer_customer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_groups_id_seq', 1, false);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 12, true);


--
-- Name: customer_customer_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 191, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- Name: order_discountcode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_discountcode_id_seq', 10, true);


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_order_id_seq', 50, true);


--
-- Name: order_order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_order_products_id_seq', 57, true);


--
-- Name: order_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_orderitem_id_seq', 58, true);


--
-- Name: product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_id_seq', 12, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 15, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: customer_address_customer customer_address_customer_address_id_customer_id_e8b98398_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_address_customer
    ADD CONSTRAINT customer_address_customer_address_id_customer_id_e8b98398_uniq UNIQUE (address_id, customer_id);


--
-- Name: customer_address_customer customer_address_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_address_customer
    ADD CONSTRAINT customer_address_customer_pkey PRIMARY KEY (id);


--
-- Name: customer_address customer_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT customer_address_pkey PRIMARY KEY (id);


--
-- Name: customer_customer customer_customer_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer
    ADD CONSTRAINT customer_customer_email_key UNIQUE (email);


--
-- Name: customer_customer_groups customer_customer_groups_customer_id_group_id_7b37e958_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_groups
    ADD CONSTRAINT customer_customer_groups_customer_id_group_id_7b37e958_uniq UNIQUE (customer_id, group_id);


--
-- Name: customer_customer_groups customer_customer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_groups
    ADD CONSTRAINT customer_customer_groups_pkey PRIMARY KEY (id);


--
-- Name: customer_customer customer_customer_mobile_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer
    ADD CONSTRAINT customer_customer_mobile_key UNIQUE (mobile);


--
-- Name: customer_customer customer_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer
    ADD CONSTRAINT customer_customer_pkey PRIMARY KEY (id);


--
-- Name: customer_customer_user_permissions customer_customer_user_p_customer_id_permission_i_d54c5202_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_user_permissions
    ADD CONSTRAINT customer_customer_user_p_customer_id_permission_i_d54c5202_uniq UNIQUE (customer_id, permission_id);


--
-- Name: customer_customer_user_permissions customer_customer_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_user_permissions
    ADD CONSTRAINT customer_customer_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: customer_customer customer_customer_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer
    ADD CONSTRAINT customer_customer_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: order_discountcode order_discountcode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_discountcode
    ADD CONSTRAINT order_discountcode_pkey PRIMARY KEY (id);


--
-- Name: order_order order_order_discount_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_discount_id_key UNIQUE (discount_id);


--
-- Name: order_order order_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_pkey PRIMARY KEY (id);


--
-- Name: order_order_products order_order_products_order_id_orderitem_id_d20ca830_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order_products
    ADD CONSTRAINT order_order_products_order_id_orderitem_id_d20ca830_uniq UNIQUE (order_id, orderitem_id);


--
-- Name: order_order_products order_order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order_products
    ADD CONSTRAINT order_order_products_pkey PRIMARY KEY (id);


--
-- Name: order_orderitem order_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_orderitem
    ADD CONSTRAINT order_orderitem_pkey PRIMARY KEY (id);


--
-- Name: product_category product_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_name_key UNIQUE (name);


--
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- Name: product_product product_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: customer_address_customer_address_id_deac720c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_address_customer_address_id_deac720c ON public.customer_address_customer USING btree (address_id);


--
-- Name: customer_address_customer_customer_id_77ef22f7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_address_customer_customer_id_77ef22f7 ON public.customer_address_customer USING btree (customer_id);


--
-- Name: customer_customer_email_3a520497_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_customer_email_3a520497_like ON public.customer_customer USING btree (email varchar_pattern_ops);


--
-- Name: customer_customer_groups_customer_id_cc388c92; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_customer_groups_customer_id_cc388c92 ON public.customer_customer_groups USING btree (customer_id);


--
-- Name: customer_customer_groups_group_id_a005825a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_customer_groups_group_id_a005825a ON public.customer_customer_groups USING btree (group_id);


--
-- Name: customer_customer_mobile_7b526389_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_customer_mobile_7b526389_like ON public.customer_customer USING btree (mobile varchar_pattern_ops);


--
-- Name: customer_customer_user_permissions_customer_id_0dffe549; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_customer_user_permissions_customer_id_0dffe549 ON public.customer_customer_user_permissions USING btree (customer_id);


--
-- Name: customer_customer_user_permissions_permission_id_b5679413; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_customer_user_permissions_permission_id_b5679413 ON public.customer_customer_user_permissions USING btree (permission_id);


--
-- Name: customer_customer_username_0781c93f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_customer_username_0781c93f_like ON public.customer_customer USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: order_discountcode_customer_id_4fad7ec9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_discountcode_customer_id_4fad7ec9 ON public.order_discountcode USING btree (customer_id);


--
-- Name: order_order_address_id_f6eb43ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_order_address_id_f6eb43ad ON public.order_order USING btree (address_id);


--
-- Name: order_order_customer_id_5bbbd957; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_order_customer_id_5bbbd957 ON public.order_order USING btree (customer_id);


--
-- Name: order_order_products_order_id_3dc8807b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_order_products_order_id_3dc8807b ON public.order_order_products USING btree (order_id);


--
-- Name: order_order_products_orderitem_id_7a493af6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_order_products_orderitem_id_7a493af6 ON public.order_order_products USING btree (orderitem_id);


--
-- Name: product_category_name_905278b8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX product_category_name_905278b8_like ON public.product_category USING btree (name varchar_pattern_ops);


--
-- Name: product_product_category_id_0c725779; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX product_product_category_id_0c725779 ON public.product_product USING btree (category_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_address_customer customer_address_cus_address_id_deac720c_fk_customer_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_address_customer
    ADD CONSTRAINT customer_address_cus_address_id_deac720c_fk_customer_ FOREIGN KEY (address_id) REFERENCES public.customer_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_address_customer customer_address_cus_customer_id_77ef22f7_fk_customer_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_address_customer
    ADD CONSTRAINT customer_address_cus_customer_id_77ef22f7_fk_customer_ FOREIGN KEY (customer_id) REFERENCES public.customer_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_customer_groups customer_customer_gr_customer_id_cc388c92_fk_customer_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_groups
    ADD CONSTRAINT customer_customer_gr_customer_id_cc388c92_fk_customer_ FOREIGN KEY (customer_id) REFERENCES public.customer_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_customer_groups customer_customer_groups_group_id_a005825a_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_groups
    ADD CONSTRAINT customer_customer_groups_group_id_a005825a_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_customer_user_permissions customer_customer_us_customer_id_0dffe549_fk_customer_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_user_permissions
    ADD CONSTRAINT customer_customer_us_customer_id_0dffe549_fk_customer_ FOREIGN KEY (customer_id) REFERENCES public.customer_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_customer_user_permissions customer_customer_us_permission_id_b5679413_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_customer_user_permissions
    ADD CONSTRAINT customer_customer_us_permission_id_b5679413_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_customer_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_customer_customer_id FOREIGN KEY (user_id) REFERENCES public.customer_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_discountcode order_discountcode_customer_id_4fad7ec9_fk_customer_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_discountcode
    ADD CONSTRAINT order_discountcode_customer_id_4fad7ec9_fk_customer_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_address_id_f6eb43ad_fk_customer_address_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_address_id_f6eb43ad_fk_customer_address_id FOREIGN KEY (address_id) REFERENCES public.customer_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_customer_id_5bbbd957_fk_customer_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_customer_id_5bbbd957_fk_customer_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_discount_id_3234c5db_fk_order_discountcode_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_discount_id_3234c5db_fk_order_discountcode_id FOREIGN KEY (discount_id) REFERENCES public.order_discountcode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order_products order_order_products_order_id_3dc8807b_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order_products
    ADD CONSTRAINT order_order_products_order_id_3dc8807b_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order_products order_order_products_orderitem_id_7a493af6_fk_order_ord; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order_products
    ADD CONSTRAINT order_order_products_orderitem_id_7a493af6_fk_order_ord FOREIGN KEY (orderitem_id) REFERENCES public.order_orderitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_category_id_0c725779_fk_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_category_id_0c725779_fk_product_category_id FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

