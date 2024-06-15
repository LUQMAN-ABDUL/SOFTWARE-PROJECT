--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-11 16:59:40

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

DROP DATABASE "Compt_eng_dept";
--
-- TOC entry 4862 (class 1262 OID 17115)
-- Name: Compt_eng_dept; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Compt_eng_dept" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Ghana.1252';


ALTER DATABASE "Compt_eng_dept" OWNER TO postgres;

\connect "Compt_eng_dept"

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
-- TOC entry 241 (class 1255 OID 17188)
-- Name: calculate_outstanding_fees(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.calculate_outstanding_fees() RETURNS json
    LANGUAGE plpgsql
    AS $$
DECLARE
    result JSON;
BEGIN
    WITH total_paid AS (
        SELECT
            student_id,
            COALESCE(SUM(amount_paid), 0) AS total_paid
        FROM
            FeePayments
        GROUP BY
            student_id
    )
    SELECT json_agg(
        json_build_object(
            'student_id', s.student_id,
            'first_name', s.first_name,
            'last_name', s.last_name,
            'total_paid', COALESCE(tp.total_paid, 0),
            'outstanding_fees', tf.TotalFee - COALESCE(tp.total_paid, 0)
        )
    )
    INTO result
    FROM
        students_info s
    LEFT JOIN
        total_paid tp ON s.student_id = tp.student_id
    LEFT JOIN
        TotalFees tf ON s.student_id = tf.student_id;

    RETURN result;
END;
$$;


ALTER FUNCTION public.calculate_outstanding_fees() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 17487)
-- Name: courseinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courseinfo (
    course_id integer NOT NULL,
    course_name character varying(100),
    course_description text,
    course_credit integer,
    course_code character varying(10)
);


ALTER TABLE public.courseinfo OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17486)
-- Name: courseinfo_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courseinfo_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courseinfo_course_id_seq OWNER TO postgres;

--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 219
-- Name: courseinfo_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courseinfo_course_id_seq OWNED BY public.courseinfo.course_id;


--
-- TOC entry 222 (class 1259 OID 17496)
-- Name: enrollmentinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollmentinfo (
    enrollment_id integer NOT NULL,
    student_id integer,
    course_id integer,
    enrollment_date date
);


ALTER TABLE public.enrollmentinfo OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17495)
-- Name: enrollmentinfo_enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enrollmentinfo_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enrollmentinfo_enrollment_id_seq OWNER TO postgres;

--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 221
-- Name: enrollmentinfo_enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enrollmentinfo_enrollment_id_seq OWNED BY public.enrollmentinfo.enrollment_id;


--
-- TOC entry 218 (class 1259 OID 17466)
-- Name: feepayments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feepayments (
    payment_id integer NOT NULL,
    student_id integer,
    amount_paid numeric(10,2),
    payment_date date
);


ALTER TABLE public.feepayments OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17465)
-- Name: feepayments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feepayments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feepayments_payment_id_seq OWNER TO postgres;

--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 217
-- Name: feepayments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feepayments_payment_id_seq OWNED BY public.feepayments.payment_id;


--
-- TOC entry 224 (class 1259 OID 17513)
-- Name: lecturers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lecturers (
    lecturer_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    email character varying(100),
    phone_number character varying(20)
);


ALTER TABLE public.lecturers OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17512)
-- Name: lecturers_lecturer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lecturers_lecturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lecturers_lecturer_id_seq OWNER TO postgres;

--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 223
-- Name: lecturers_lecturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lecturers_lecturer_id_seq OWNED BY public.lecturers.lecturer_id;


--
-- TOC entry 226 (class 1259 OID 17535)
-- Name: lectures_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectures_info (
    lecture_id integer NOT NULL,
    lecture_name character varying(100),
    course_id integer,
    lecture_date date
);


ALTER TABLE public.lectures_info OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17534)
-- Name: lectures_info_lecture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lectures_info_lecture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lectures_info_lecture_id_seq OWNER TO postgres;

--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 225
-- Name: lectures_info_lecture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lectures_info_lecture_id_seq OWNED BY public.lectures_info.lecture_id;


--
-- TOC entry 216 (class 1259 OID 17444)
-- Name: students_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_info (
    student_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    phone_number character varying(15),
    address text,
    date_of_birth date
);


ALTER TABLE public.students_info OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17443)
-- Name: students_info_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_info_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_info_student_id_seq OWNER TO postgres;

--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 215
-- Name: students_info_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_info_student_id_seq OWNED BY public.students_info.student_id;


--
-- TOC entry 228 (class 1259 OID 17548)
-- Name: taassignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taassignments (
    ta_assignment_id integer NOT NULL,
    lecture_id integer,
    ta_name character varying(100),
    ta_email character varying(100)
);


ALTER TABLE public.taassignments OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17547)
-- Name: taassignments_ta_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taassignments_ta_assignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.taassignments_ta_assignment_id_seq OWNER TO postgres;

--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 227
-- Name: taassignments_ta_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taassignments_ta_assignment_id_seq OWNED BY public.taassignments.ta_assignment_id;


--
-- TOC entry 229 (class 1259 OID 17559)
-- Name: totalfees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.totalfees (
    student_id integer,
    totalfee numeric(10,2) DEFAULT 2000.00
);


ALTER TABLE public.totalfees OWNER TO postgres;

--
-- TOC entry 4671 (class 2604 OID 17490)
-- Name: courseinfo course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courseinfo ALTER COLUMN course_id SET DEFAULT nextval('public.courseinfo_course_id_seq'::regclass);


--
-- TOC entry 4672 (class 2604 OID 17499)
-- Name: enrollmentinfo enrollment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollmentinfo ALTER COLUMN enrollment_id SET DEFAULT nextval('public.enrollmentinfo_enrollment_id_seq'::regclass);


--
-- TOC entry 4670 (class 2604 OID 17469)
-- Name: feepayments payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feepayments ALTER COLUMN payment_id SET DEFAULT nextval('public.feepayments_payment_id_seq'::regclass);


--
-- TOC entry 4673 (class 2604 OID 17516)
-- Name: lecturers lecturer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lecturers ALTER COLUMN lecturer_id SET DEFAULT nextval('public.lecturers_lecturer_id_seq'::regclass);


--
-- TOC entry 4674 (class 2604 OID 17538)
-- Name: lectures_info lecture_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures_info ALTER COLUMN lecture_id SET DEFAULT nextval('public.lectures_info_lecture_id_seq'::regclass);


--
-- TOC entry 4669 (class 2604 OID 17447)
-- Name: students_info student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_info ALTER COLUMN student_id SET DEFAULT nextval('public.students_info_student_id_seq'::regclass);


--
-- TOC entry 4675 (class 2604 OID 17551)
-- Name: taassignments ta_assignment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taassignments ALTER COLUMN ta_assignment_id SET DEFAULT nextval('public.taassignments_ta_assignment_id_seq'::regclass);


--
-- TOC entry 4847 (class 0 OID 17487)
-- Dependencies: 220
-- Data for Name: courseinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courseinfo (course_id, course_name, course_description, course_credit, course_code) FROM stdin;
201	Database Systems	Introduction to database systems and SQL	3	CPEN 211
202	Software Engineering	Introduction to software engineering	3	CPEN 208
203	Data Communication	Overview of data transmission	2	CPEN 212
204	Computer System Design	Overview of system design	3	CPEN 202
205	Linear Circuits	Overview of circuit analysis and design	3	CPEN 206
206	Signals And Systems	Intoduction to signals and systems	3	CPEN 303
207	Linear Algebra	Overview of algbebra	4	SENG 201
208	Basic Electronics	Introduction to basic electronics	3	SENG 103
\.


--
-- TOC entry 4849 (class 0 OID 17496)
-- Dependencies: 222
-- Data for Name: enrollmentinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollmentinfo (enrollment_id, student_id, course_id, enrollment_date) FROM stdin;
1001	11004272	201	2024-03-10
1002	11010910	202	2024-03-16
1003	11275876	203	2024-04-12
1004	10979385	204	2024-05-25
1005	11012330	205	2024-05-18
1006	11049492	206	2024-04-20
1007	11018690	207	2024-05-22
1008	11021544	208	2024-03-26
\.


--
-- TOC entry 4845 (class 0 OID 17466)
-- Dependencies: 218
-- Data for Name: feepayments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feepayments (payment_id, student_id, amount_paid, payment_date) FROM stdin;
1	11004272	1000.00	2024-01-15
2	11010910	500.00	2024-02-15
3	11275876	1200.00	2024-03-20
4	10979385	1400.00	2024-03-25
5	11012330	600.00	2024-02-27
6	11049492	700.00	2024-01-02
7	11018690	800.00	2024-01-05
8	11021544	600.00	2024-01-07
9	11012343	450.00	2024-01-07
10	11014727	350.00	2024-01-07
11	11014977	500.00	2024-01-07
12	11015506	550.00	2024-01-07
13	11023595	700.00	2024-01-07
14	11025159	800.00	2024-01-07
15	11038081	540.00	2024-01-07
16	11049523	740.00	2024-01-07
17	11053386	780.00	2024-01-07
18	11105235	980.00	2024-01-07
19	11112276	1200.00	2024-01-07
20	11116537	560.00	2024-01-07
21	11116804	900.00	2024-01-07
22	11117318	1000.00	2024-01-07
23	11117536	900.00	2024-01-07
24	11117536	700.00	2024-01-07
25	11123762	800.00	2024-01-07
26	11139245	820.00	2024-01-07
27	11139828	930.00	2024-01-07
28	11164744	950.00	2024-01-07
29	11170350	670.00	2024-01-07
30	11172376	770.00	2024-01-07
31	11208328	910.00	2024-01-07
32	11209640	960.00	2024-01-07
33	11213307	780.00	2024-01-07
34	11218951	730.00	2024-01-07
35	11238291	560.00	2024-01-07
36	11246366	660.00	2024-01-07
37	11252855	890.00	2024-01-07
38	11252857	980.00	2024-01-07
39	11253931	670.00	2024-01-07
40	11254079	830.00	2024-01-07
41	11254301	700.00	2024-01-07
42	11254405	600.00	2024-01-07
43	11262592	200.00	2024-01-07
44	11264010	100.00	2024-01-07
45	11285635	300.00	2024-01-07
46	11292620	1400.00	2024-01-07
47	11293871	1500.00	2024-01-07
48	11296641	1200.00	2024-01-07
49	11296662	1300.00	2024-01-07
50	11297849	1200.00	2024-01-07
51	11305528	780.00	2024-01-07
52	11330446	1100.00	2024-01-07
53	11332163	900.00	2024-01-07
54	11333321	700.00	2024-01-07
55	11334401	800.00	2024-01-07
56	11338323	1000.00	2024-01-07
57	11347946	900.00	2024-01-07
58	11348310	1400.00	2024-01-07
59	11353826	1300.00	2024-01-07
60	11356825	1200.00	2024-01-07
61	11358243	1500.00	2024-01-07
62	10975105	800.00	2024-01-07
\.


--
-- TOC entry 4851 (class 0 OID 17513)
-- Dependencies: 224
-- Data for Name: lecturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lecturers (lecturer_id, first_name, last_name, email, phone_number) FROM stdin;
1111	John	Asiamah	johnasiamah@gamail.com	0246677890
1112	Kenneth	Broni	kenbro@gmail.com	0258657790
1113	Agyare	Debrah	agyaredebra@gamail.com	0276690870
1114	Isaac	Aboagye	isaacaboagye@gamail.com	0546707590
1115	Percy	Okae	percyokae@gamail.com	0275678870
1116	Margaret	Richardson	margaretrichardson@gamail.com	0552446098
1117	Godfred	Mills	godfredmills@gamail.com	0501234568
1118	Prosper	Anni	prosperanni@gamail.com	0247082458
\.


--
-- TOC entry 4853 (class 0 OID 17535)
-- Dependencies: 226
-- Data for Name: lectures_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lectures_info (lecture_id, lecture_name, course_id, lecture_date) FROM stdin;
311	Introduction to SQL	201	2024-03-15
312	Database Design	202	2024-01-20
313	Analog to Digital Signal Conversion	203	2024-04-25
314	Nodal Circuit Analysis	204	2024-03-27
315	Basic Algorithm Technique	205	2024-05-18
316	Signal Processing	206	2024-03-05
317	Thevenins and Nortons Theorem	207	2024-03-20
318	Arrays and LinkedList	208	2024-04-23
\.


--
-- TOC entry 4843 (class 0 OID 17444)
-- Dependencies: 216
-- Data for Name: students_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_info (student_id, first_name, last_name, email, phone_number, address, date_of_birth) FROM stdin;
11004272	Ishaan	Bhardwaj	ishbhardwaj@st.ug.edu.gh	0553072737	123 Main St	2000-01-01
11010910	Samia	Soleimani	samiasolei@st.ug.edu.gh	0551068786	719 Elm St	2003-05-02
11275876	Prince	Nyayun	pnyayun@st.ug.edu.gh	0257629963	215 Quarshie St	1999-02-08
10979385	Luqman	Abdulmumin	labdulmumin@st.ug.edu.gh	02777450374	238 Alafia St	2000-05-06
11012330	Arthur	Ebenezer	artheben@st.ug.edu.gh	0246833694	543 Ogbona St	2000-08-02
11049492	Asare	Marvin	asaremav@st.ug.edu.gh	0556833694	321 Baboon St	2001-04-05
11018690	Oblie	Pius	obliepius@st.ug.edu.gh	0541759050	654 Osa St	2002-07-02
11021544	Iddrisu	Tahiru	iddrisutahiru@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11012343	Kumi	Kelvin	kumikelvin@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11014727	Annan Chioma	Praise	annanchioma@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11014977	Mohammed Salihu	Hamisu	mohasalihu@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11015506	Daniel Agyin	Manford	daagyin@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11023595	Nyavor Cyril	Etornam	nyacyrili@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11025159	David Kweku	Ntow	dakweku@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11038081	Agyepong	Kwasi	agyekwasi@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11049523	Peggy Esinam	Somuah	peesinam@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11053386	Amonsah	Samuel	amonsam@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11105235	Andrews Kwarteng	Twum	andkwat@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11112276	Fiavor Isaac	Sedem	fiaisaac@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11116537	Yakubu Tanko	Mohammed	yakutanko@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11116737	Eririe	Jefferey	eririejefi@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11116804	Kafui Kwame	Kemeh	kafuikemeh@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11117318	Nyarko Steven	Abrokwah	nyarkosteven@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11117536	Muhammed Nurul Haqq	Munagah	muhanuru@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11123762	Bernadine Adusei	Okrah	bernaddineokrah@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11139245	Maame Efua	Ayisi	maameefua@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11139828	Ansiogya Philemon	Kwabena	ansiphilemon@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11164744	Antwi Samuel	Anafi	kkofi@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11170350	Nkansah Boadu	Tabi	nkansahtabi@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11172376	Wenide Isaac	Atta	weniataa@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11208328	John Tenkorang	Anim	johnanim@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11209640	Abubakar	Latifa	abulatifah@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11213307	Attu Samuel	Idana	attusamuel@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11218951	Adorboe Prince	Philips	adorboeprince@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11238291	Ninson	Obed	ninsonobed@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11246366	Anewah	Vincent	anewahvincent@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11252855	Quansah	Jeffery	quansahjeff@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11252857	Nuku Tagbor	Joshua	nukujosh@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11253931	Desmond Afelete	Kamasah	desafelete@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11254079	Fordjour Edward	John	fordjouredward@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11254301	Kudiabor	Jonathan	kujonathan@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11254405	Abena Nhyira	Nsaako	abenansaako@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11262592	Dedoo Donatus	Dodzi	dedoododzi@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11264010	Ayertey Vanessa	Esinam	ayerteyvanessa@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11285635	David Tetteh	Ankrah	davidtetteh@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11292620	Sena	Anyomi	senaanyomi@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11293871	Amponsah Jonathan	Boadu	joboadu@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11296641	Asare Baffour	David	bdavid@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11296662	Amevenku K.	Mawuli	amemawuli@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11297849	Isaac Nii	Nortey	isaacnii@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11305528	Nana Fosu	Asamoah	nanafosu@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11330446	Yasmeen Xoladem	Doku	yasxoladem@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11332163	Matthew Kotey	Amponsah	matkotey@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11333321	Fall	Galas	fallgalas@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-11
11334401	Awal	Mohammed	awalmohammed@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-09-19
11338323	Ahmed Fareed	Opare	fareedoparei@st.ug.edu.gh	0265996933	224 Wasabanga St	2005-05-18
11347946	Derick	Amponsah	derrickamponsah@st.ug.edu.gh	0265996933	224 Wasabanga St	2004-06-17
11348310	Freda Elikplim	Apetsi	fredaapetsi@st.ug.edu.gh	0265996933	224 Wasabanga St	2003-03-16
11353826	Dabanka Hayet	Gyasiwa	hayetgyasiwa@st.ug.edu.gh	0265996933	224 Wasabanga St	2002-01-15
11356825	Edward Opoku	Agyemang	edwardagyemang@st.ug.edu.gh	0265996788	224 Pwalugu St	2003-05-12
11358243	Nana Kwasi	Kwakye	nanakkwakye@st.ug.edu.gh	0265996933	224 Nkyi St	2003-09-30
10975105	Daniel Akwertey	Tetteh	danitetteh@st.ug.edu.gh	0265996933	224 Nkyi St	2003-09-30
\.


--
-- TOC entry 4855 (class 0 OID 17548)
-- Dependencies: 228
-- Data for Name: taassignments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taassignments (ta_assignment_id, lecture_id, ta_name, ta_email) FROM stdin;
211	311	Kevin Cudjoe	kelvincudjoe@gmail.com
212	312	Agudey Daniel	agudeydaniel@gmail.com
213	313	Haaris Abdul Waqas	habdulwaqas@gmail.com
214	314	Samuel Ibe	ibesamuel@gmail.com
215	315	Saani Mustapha	saanimustapha@gmail.com
216	316	Samuel Adams	adamssamuel@gmail.com
217	317	Luqman Quarshie	qualuqman@gmail.com
218	318	Nathaniel Adika	adikanat@gmail.com
\.


--
-- TOC entry 4856 (class 0 OID 17559)
-- Dependencies: 229
-- Data for Name: totalfees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.totalfees (student_id, totalfee) FROM stdin;
11004272	2000.00
11010910	2000.00
11275876	2000.00
10979385	2000.00
11012330	2000.00
11049492	2000.00
11018690	2000.00
11021544	2000.00
11012343	2000.00
11014727	2000.00
11014977	2000.00
11015506	2000.00
11023595	2000.00
11025159	2000.00
11038081	2000.00
11049523	2000.00
11053386	2000.00
11105235	2000.00
11112276	2000.00
11116537	2000.00
11116737	2000.00
11116804	2000.00
11117318	2000.00
11117536	2000.00
11123762	2000.00
11139245	2000.00
11139828	2000.00
11164744	2000.00
11170350	2000.00
11172376	2000.00
11208328	2000.00
11209640	2000.00
11213307	2000.00
11218951	2000.00
11238291	2000.00
11246366	2000.00
11252855	2000.00
11252857	2000.00
11253931	2000.00
11254079	2000.00
11254301	2000.00
11254405	2000.00
11262592	2000.00
11264010	2000.00
11285635	2000.00
11292620	2000.00
11293871	2000.00
11296641	2000.00
11296662	2000.00
11297849	2000.00
11305528	2000.00
11330446	2000.00
11332163	2000.00
11333321	2000.00
11334401	2000.00
11338323	2000.00
11347946	2000.00
11348310	2000.00
11353826	2000.00
11356825	2000.00
11358243	2000.00
10975105	2000.00
\.


--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 219
-- Name: courseinfo_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courseinfo_course_id_seq', 1, false);


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 221
-- Name: enrollmentinfo_enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enrollmentinfo_enrollment_id_seq', 1, false);


--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 217
-- Name: feepayments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feepayments_payment_id_seq', 62, true);


--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 223
-- Name: lecturers_lecturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lecturers_lecturer_id_seq', 1, false);


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 225
-- Name: lectures_info_lecture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lectures_info_lecture_id_seq', 1, false);


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 215
-- Name: students_info_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_info_student_id_seq', 1, false);


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 227
-- Name: taassignments_ta_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taassignments_ta_assignment_id_seq', 1, false);


--
-- TOC entry 4682 (class 2606 OID 17494)
-- Name: courseinfo courseinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courseinfo
    ADD CONSTRAINT courseinfo_pkey PRIMARY KEY (course_id);


--
-- TOC entry 4684 (class 2606 OID 17501)
-- Name: enrollmentinfo enrollmentinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollmentinfo
    ADD CONSTRAINT enrollmentinfo_pkey PRIMARY KEY (enrollment_id);


--
-- TOC entry 4680 (class 2606 OID 17471)
-- Name: feepayments feepayments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feepayments
    ADD CONSTRAINT feepayments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 4686 (class 2606 OID 17520)
-- Name: lecturers lecturers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lecturers
    ADD CONSTRAINT lecturers_email_key UNIQUE (email);


--
-- TOC entry 4688 (class 2606 OID 17518)
-- Name: lecturers lecturers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lecturers
    ADD CONSTRAINT lecturers_pkey PRIMARY KEY (lecturer_id);


--
-- TOC entry 4690 (class 2606 OID 17540)
-- Name: lectures_info lectures_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures_info
    ADD CONSTRAINT lectures_info_pkey PRIMARY KEY (lecture_id);


--
-- TOC entry 4678 (class 2606 OID 17451)
-- Name: students_info students_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_info
    ADD CONSTRAINT students_info_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4692 (class 2606 OID 17553)
-- Name: taassignments taassignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taassignments
    ADD CONSTRAINT taassignments_pkey PRIMARY KEY (ta_assignment_id);


--
-- TOC entry 4694 (class 2606 OID 17507)
-- Name: enrollmentinfo enrollmentinfo_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollmentinfo
    ADD CONSTRAINT enrollmentinfo_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courseinfo(course_id);


--
-- TOC entry 4695 (class 2606 OID 17502)
-- Name: enrollmentinfo enrollmentinfo_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollmentinfo
    ADD CONSTRAINT enrollmentinfo_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students_info(student_id);


--
-- TOC entry 4693 (class 2606 OID 17472)
-- Name: feepayments feepayments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feepayments
    ADD CONSTRAINT feepayments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students_info(student_id);


--
-- TOC entry 4696 (class 2606 OID 17541)
-- Name: lectures_info lectures_info_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures_info
    ADD CONSTRAINT lectures_info_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courseinfo(course_id);


--
-- TOC entry 4697 (class 2606 OID 17554)
-- Name: taassignments taassignments_lecture_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taassignments
    ADD CONSTRAINT taassignments_lecture_id_fkey FOREIGN KEY (lecture_id) REFERENCES public.lectures_info(lecture_id);


--
-- TOC entry 4698 (class 2606 OID 17563)
-- Name: totalfees totalfees_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.totalfees
    ADD CONSTRAINT totalfees_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students_info(student_id);


-- Completed on 2024-06-11 16:59:41

--
-- PostgreSQL database dump complete
--

