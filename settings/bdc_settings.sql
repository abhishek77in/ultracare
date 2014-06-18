--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: breasts; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE breasts (
    id integer NOT NULL,
    left_breast text,
    right_breast text,
    impression text,
    advise text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.breasts OWNER TO abhishek;

--
-- Name: breasts_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE breasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.breasts_id_seq OWNER TO abhishek;

--
-- Name: breasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE breasts_id_seq OWNED BY breasts.id;


--
-- Name: doctors; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE doctors (
    id integer NOT NULL,
    name character varying(255),
    degree character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.doctors OWNER TO abhishek;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE doctors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctors_id_seq OWNER TO abhishek;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE doctors_id_seq OWNED BY doctors.id;


--
-- Name: kub_females; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE kub_females (
    id integer NOT NULL,
    left_kidney text,
    right_kidney text,
    urinary_bladder text,
    other text,
    impression text,
    advise text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.kub_females OWNER TO abhishek;

--
-- Name: kub_females_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE kub_females_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kub_females_id_seq OWNER TO abhishek;

--
-- Name: kub_females_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE kub_females_id_seq OWNED BY kub_females.id;


--
-- Name: kub_males; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE kub_males (
    id integer NOT NULL,
    left_kidney text,
    right_kidney text,
    urinary_bladder text,
    prostate text,
    other text,
    impression text,
    advise text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.kub_males OWNER TO abhishek;

--
-- Name: kub_males_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE kub_males_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kub_males_id_seq OWNER TO abhishek;

--
-- Name: kub_males_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE kub_males_id_seq OWNED BY kub_males.id;


--
-- Name: lower_abdomen_females; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE lower_abdomen_females (
    id integer NOT NULL,
    urinary_bladder text,
    uterus text,
    adnexa text,
    other text,
    impression text,
    advise text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.lower_abdomen_females OWNER TO abhishek;

--
-- Name: lower_abdomen_females_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE lower_abdomen_females_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lower_abdomen_females_id_seq OWNER TO abhishek;

--
-- Name: lower_abdomen_females_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE lower_abdomen_females_id_seq OWNED BY lower_abdomen_females.id;


--
-- Name: obstetrics; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE obstetrics (
    id integer NOT NULL,
    pregnancy text,
    average_g_a character varying(255),
    presentation_and_lie character varying(255),
    liquor_volume text,
    cervix_and_o_s text,
    fetal_heart text,
    fetal_head_movement character varying(255),
    fetal_limbs_movement character varying(255),
    fetal_breathing_movement character varying(255),
    placenta character varying(255),
    grade character varying(255),
    e_d_d character varying(255),
    e_f_w character varying(255),
    remarks text,
    advise text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    crl_mm character varying(255),
    crl_weeks character varying(255),
    crl_days character varying(255),
    bpd_mm character varying(255),
    bpd_weeks character varying(255),
    bpd_days character varying(255),
    fl_mm character varying(255),
    fl_weeks character varying(255),
    fl_days character varying(255),
    ac_mm character varying(255),
    ac_weeks character varying(255),
    ac_days character varying(255),
    hc_mm character varying(255),
    hc_weeks character varying(255),
    hc_days character varying(255)
);


ALTER TABLE public.obstetrics OWNER TO abhishek;

--
-- Name: obstetrics_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE obstetrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obstetrics_id_seq OWNER TO abhishek;

--
-- Name: obstetrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE obstetrics_id_seq OWNED BY obstetrics.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE patients (
    id integer NOT NULL,
    name character varying(255),
    age integer,
    sex character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.patients OWNER TO abhishek;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_id_seq OWNER TO abhishek;

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.id;


--
-- Name: report_types; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE report_types (
    id integer NOT NULL,
    reportable_id integer,
    reportable_type character varying(255),
    report_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.report_types OWNER TO abhishek;

--
-- Name: report_types_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE report_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_types_id_seq OWNER TO abhishek;

--
-- Name: report_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE report_types_id_seq OWNED BY report_types.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE reports (
    id integer NOT NULL,
    doctor_id integer,
    patient_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.reports OWNER TO abhishek;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO abhishek;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE reports_id_seq OWNED BY reports.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO abhishek;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    print_settings text,
    default_organ_findings text,
    default_obstetric_findings text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.settings OWNER TO abhishek;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO abhishek;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: testes; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE testes (
    id integer NOT NULL,
    left_testis text,
    right_testis text,
    impression text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.testes OWNER TO abhishek;

--
-- Name: testes_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE testes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testes_id_seq OWNER TO abhishek;

--
-- Name: testes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE testes_id_seq OWNED BY testes.id;


--
-- Name: thyroid_glands; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE thyroid_glands (
    id integer NOT NULL,
    thyroid_left_lobe text,
    thyroid_right_lobe text,
    i_j_v_and_c_a text,
    isthmus text,
    other text,
    impression text,
    advise text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.thyroid_glands OWNER TO abhishek;

--
-- Name: thyroid_glands_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE thyroid_glands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.thyroid_glands_id_seq OWNER TO abhishek;

--
-- Name: thyroid_glands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE thyroid_glands_id_seq OWNED BY thyroid_glands.id;


--
-- Name: upper_abdomen; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE upper_abdomen (
    id integer NOT NULL,
    liver text,
    gall_bladder text,
    pancreas text,
    spleen text,
    left_kidney text,
    right_kidney text,
    ureter text,
    other text,
    impression text,
    advise text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.upper_abdomen OWNER TO abhishek;

--
-- Name: upper_abdomen_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE upper_abdomen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upper_abdomen_id_seq OWNER TO abhishek;

--
-- Name: upper_abdomen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE upper_abdomen_id_seq OWNED BY upper_abdomen.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE versions (
    id integer NOT NULL,
    item_type character varying(255) NOT NULL,
    item_id integer NOT NULL,
    event character varying(255) NOT NULL,
    whodunnit character varying(255),
    object text,
    created_at timestamp without time zone,
    object_changes text
);


ALTER TABLE public.versions OWNER TO abhishek;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versions_id_seq OWNER TO abhishek;

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: whole_abdomen_females; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE whole_abdomen_females (
    id integer NOT NULL,
    liver text,
    gall_bladder text,
    pancreas text,
    spleen text,
    left_kidney text,
    right_kidney text,
    urinary_bladder text,
    uterus text,
    adnexa text,
    other text,
    impression text,
    advise text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.whole_abdomen_females OWNER TO abhishek;

--
-- Name: whole_abdomen_females_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE whole_abdomen_females_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.whole_abdomen_females_id_seq OWNER TO abhishek;

--
-- Name: whole_abdomen_females_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE whole_abdomen_females_id_seq OWNED BY whole_abdomen_females.id;


--
-- Name: whole_abdomen_males; Type: TABLE; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE TABLE whole_abdomen_males (
    id integer NOT NULL,
    liver text,
    gall_bladder text,
    pancreas text,
    spleen text,
    left_kidney text,
    right_kidney text,
    urinary_bladder text,
    prostate text,
    other text,
    impression text,
    advise text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.whole_abdomen_males OWNER TO abhishek;

--
-- Name: whole_abdomen_males_id_seq; Type: SEQUENCE; Schema: public; Owner: abhishek
--

CREATE SEQUENCE whole_abdomen_males_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.whole_abdomen_males_id_seq OWNER TO abhishek;

--
-- Name: whole_abdomen_males_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abhishek
--

ALTER SEQUENCE whole_abdomen_males_id_seq OWNED BY whole_abdomen_males.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY breasts ALTER COLUMN id SET DEFAULT nextval('breasts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY doctors ALTER COLUMN id SET DEFAULT nextval('doctors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY kub_females ALTER COLUMN id SET DEFAULT nextval('kub_females_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY kub_males ALTER COLUMN id SET DEFAULT nextval('kub_males_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY lower_abdomen_females ALTER COLUMN id SET DEFAULT nextval('lower_abdomen_females_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY obstetrics ALTER COLUMN id SET DEFAULT nextval('obstetrics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY report_types ALTER COLUMN id SET DEFAULT nextval('report_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY reports ALTER COLUMN id SET DEFAULT nextval('reports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY testes ALTER COLUMN id SET DEFAULT nextval('testes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY thyroid_glands ALTER COLUMN id SET DEFAULT nextval('thyroid_glands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY upper_abdomen ALTER COLUMN id SET DEFAULT nextval('upper_abdomen_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY whole_abdomen_females ALTER COLUMN id SET DEFAULT nextval('whole_abdomen_females_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abhishek
--

ALTER TABLE ONLY whole_abdomen_males ALTER COLUMN id SET DEFAULT nextval('whole_abdomen_males_id_seq'::regclass);


--
-- Data for Name: breasts; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY breasts (id, left_breast, right_breast, impression, advise, created_at, updated_at) FROM stdin;
\.


--
-- Name: breasts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('breasts_id_seq', 1, false);


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY doctors (id, name, degree, created_at, updated_at) FROM stdin;
\.


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('doctors_id_seq', 1, false);


--
-- Data for Name: kub_females; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY kub_females (id, left_kidney, right_kidney, urinary_bladder, other, impression, advise, created_at, updated_at) FROM stdin;
\.


--
-- Name: kub_females_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('kub_females_id_seq', 1, false);


--
-- Data for Name: kub_males; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY kub_males (id, left_kidney, right_kidney, urinary_bladder, prostate, other, impression, advise, created_at, updated_at) FROM stdin;
\.


--
-- Name: kub_males_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('kub_males_id_seq', 1, false);


--
-- Data for Name: lower_abdomen_females; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY lower_abdomen_females (id, urinary_bladder, uterus, adnexa, other, impression, advise, created_at, updated_at) FROM stdin;
\.


--
-- Name: lower_abdomen_females_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('lower_abdomen_females_id_seq', 1, false);


--
-- Data for Name: obstetrics; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY obstetrics (id, pregnancy, average_g_a, presentation_and_lie, liquor_volume, cervix_and_o_s, fetal_heart, fetal_head_movement, fetal_limbs_movement, fetal_breathing_movement, placenta, grade, e_d_d, e_f_w, remarks, advise, created_at, updated_at, crl_mm, crl_weeks, crl_days, bpd_mm, bpd_weeks, bpd_days, fl_mm, fl_weeks, fl_days, ac_mm, ac_weeks, ac_days, hc_mm, hc_weeks, hc_days) FROM stdin;
\.


--
-- Name: obstetrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('obstetrics_id_seq', 1, false);


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY patients (id, name, age, sex, created_at, updated_at) FROM stdin;
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('patients_id_seq', 1, false);


--
-- Data for Name: report_types; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY report_types (id, reportable_id, reportable_type, report_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: report_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('report_types_id_seq', 1, false);


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY reports (id, doctor_id, patient_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('reports_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY schema_migrations (version) FROM stdin;
20140411182542
20140411182903
20140411183302
20140411183723
20140411184340
20140417155214
20140417181735
20140417190835
20140417193503
20140417195738
20140417201202
20140417201814
20140417202626
20140417205403
20140417210034
20140419131146
20140420134339
20140501101418
20140501105125
20140502153015
20140502154625
20140502163908
20140531065722
20140531130339
20140531193022
20140601070245
20140601071008
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY settings (id, print_settings, default_organ_findings, default_obstetric_findings, created_at, updated_at) FROM stdin;
1	{"heading":"BALRAMPUR DIAGNOSTIC CENTER","sub_heading":"DIAGNOSTICS ULTRASOUND UNIT","address":"Opposite - Memorial Hospital, Balrampur","phone_number":"232436","consultant_1":"Dr. G. D. Goel (MBBS, DCP)","consultant_2":"Dr. Faissal Faizi (MD)"}	{"liver":"Appears NORMAL in size, shape \\u0026 echotexture. No focal lesion or mass seen. Intrahepatic portal redicals are not Dilated. No Sub hepatic fluid seen.","gall_bladder":"Appears NORMAL in size \\u0026 shape. No stone or sludge seen. Walls are normal. Anterior wall of the G.B. appears not thickened. C.B.D. and portal vein is not Dilated.","pancreas":"Appears NORMAL in size and echotexture. Pancreatic duct is not dilated. No calcifications seen.","spleen":"Appears normal in size, shape \\u0026 echotexture. No focal lesion or mass seen.","right_kidney":"Appears NORMAL in size, shape \\u0026 echotexture. Renal parenchymal \\u0026 sinus echoes are normal. No hydronephrotic changes seen. Corticomedullary differentiation is normal. No peri renal ascitic fluid seen.","left_kidney":"Appears NORMAL in size, shape \\u0026 echotexture. Renal parenchymal \\u0026 sinus echoes are normal. No hydronephrotic changes seen. Corticomedullary differentiation is normal. No peri renal ascitic fluid seen.","urinary_bladder":"Partially filled with urine. Wall is smooth \\u0026 regular.","prostate":"Appears NORMAL  in size,shape and weight.","ureter":"Upper part of ureter not dilated.","adnexa":"RT. ADNEXA-NORMAL.\\r\\nLT. ADNEXA-NORMAL.","uterus":"Appears NORMAL in size, Myometrium echotexture is homogenous. No mass, No fibroid seen. Internal os of cervix appears closed.","thyroid_left_lobe":"Appears NORMAL in size, shape \\u0026 echotexture. No focal lesion seen.","thyroid_right_lobe":"Appears NORMAL in size, shape \\u0026 echotexture. No focal lesion seen.","i_j_v_and_c_a":"NORMAL","isthmus":"NORMAL","left_testis":"Appears NORMAL in size and shape \\u0026 homogenous in echotexture.","right_testis":"Appears NORMAL in size and shape \\u0026 homogenous in echotexture.","left_breast":"Appears NORMAL in echotexture. No mass or cyst seen.","right_breast":"Appears NORMAL in echotexture. No mass or cyst seen.","impression":"ORGANS ARE UNDER SCAN WITH IN NORMAL LIMITS."}	{"pregnancy":"Single\\r\\nConfirmed / Viable / Intrauterine","crl_mm":"","crl_weeks":"","crl_days":"","bpd_mm":"","bpd_weeks":"","bpd_days":"","fl_mm":"","fl_weeks":"","fl_days":"","ac_mm":"","ac_weeks":"","ac_days":"","hc_mm":"","hc_weeks":"","hc_days":"","average_g_a":"29 WEEKS O5 DAYS (+- 02 WEEKS)","presentation_and_lie":"VERTEX","liquor_volume":"Appears ADEQUATE in amount.","cervix_and_o_s":"Appears Closed.","fetal_heart":"PULSATING\\r\\nRate by M+mode 158/bpm.","fetal_head_movement":"NORMAL","fetal_limbs_movement":"NORMAL","fetal_breathing_movement":"NORMAL","placenta":"ANTERIOR","grade":"2nd","e_d_d":"06-06-2014(+- 02 WEEKS)","e_f_w":"1430 gms. (+-20%)","remarks":"Appears Single Viable Intrauterine Fetus with Normal Cardiac \\u0026 Somatic Activity. Fetal Heart Pulsation clearly Visible. Movements are Positive.","advise":""}	2014-06-17 07:05:43.32251	2014-06-18 12:21:04.343905
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('settings_id_seq', 1, true);


--
-- Data for Name: testes; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY testes (id, left_testis, right_testis, impression, created_at, updated_at) FROM stdin;
\.


--
-- Name: testes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('testes_id_seq', 1, false);


--
-- Data for Name: thyroid_glands; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY thyroid_glands (id, thyroid_left_lobe, thyroid_right_lobe, i_j_v_and_c_a, isthmus, other, impression, advise, created_at, updated_at) FROM stdin;
\.


--
-- Name: thyroid_glands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('thyroid_glands_id_seq', 1, false);


--
-- Data for Name: upper_abdomen; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY upper_abdomen (id, liver, gall_bladder, pancreas, spleen, left_kidney, right_kidney, ureter, other, impression, advise, created_at, updated_at) FROM stdin;
\.


--
-- Name: upper_abdomen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('upper_abdomen_id_seq', 1, false);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY versions (id, item_type, item_id, event, whodunnit, object, created_at, object_changes) FROM stdin;
\.


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('versions_id_seq', 1, false);


--
-- Data for Name: whole_abdomen_females; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY whole_abdomen_females (id, liver, gall_bladder, pancreas, spleen, left_kidney, right_kidney, urinary_bladder, uterus, adnexa, other, impression, advise, created_at, updated_at) FROM stdin;
\.


--
-- Name: whole_abdomen_females_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('whole_abdomen_females_id_seq', 1, false);


--
-- Data for Name: whole_abdomen_males; Type: TABLE DATA; Schema: public; Owner: abhishek
--

COPY whole_abdomen_males (id, liver, gall_bladder, pancreas, spleen, left_kidney, right_kidney, urinary_bladder, prostate, other, impression, advise, created_at, updated_at) FROM stdin;
\.


--
-- Name: whole_abdomen_males_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abhishek
--

SELECT pg_catalog.setval('whole_abdomen_males_id_seq', 1, false);


--
-- Name: breasts_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY breasts
    ADD CONSTRAINT breasts_pkey PRIMARY KEY (id);


--
-- Name: doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: kub_females_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY kub_females
    ADD CONSTRAINT kub_females_pkey PRIMARY KEY (id);


--
-- Name: kub_males_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY kub_males
    ADD CONSTRAINT kub_males_pkey PRIMARY KEY (id);


--
-- Name: lower_abdomen_females_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY lower_abdomen_females
    ADD CONSTRAINT lower_abdomen_females_pkey PRIMARY KEY (id);


--
-- Name: obstetrics_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY obstetrics
    ADD CONSTRAINT obstetrics_pkey PRIMARY KEY (id);


--
-- Name: patients_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: report_types_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY report_types
    ADD CONSTRAINT report_types_pkey PRIMARY KEY (id);


--
-- Name: reports_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: testes_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY testes
    ADD CONSTRAINT testes_pkey PRIMARY KEY (id);


--
-- Name: thyroid_glands_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY thyroid_glands
    ADD CONSTRAINT thyroid_glands_pkey PRIMARY KEY (id);


--
-- Name: upper_abdomen_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY upper_abdomen
    ADD CONSTRAINT upper_abdomen_pkey PRIMARY KEY (id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: whole_abdomen_females_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY whole_abdomen_females
    ADD CONSTRAINT whole_abdomen_females_pkey PRIMARY KEY (id);


--
-- Name: whole_abdomen_males_pkey; Type: CONSTRAINT; Schema: public; Owner: abhishek; Tablespace: 
--

ALTER TABLE ONLY whole_abdomen_males
    ADD CONSTRAINT whole_abdomen_males_pkey PRIMARY KEY (id);


--
-- Name: index_patients_on_name; Type: INDEX; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE INDEX index_patients_on_name ON patients USING btree (name);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: abhishek; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

