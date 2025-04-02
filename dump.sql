--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: root
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO root;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: root
--

COMMENT ON SCHEMA public IS '';


--
-- Name: Day; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public."Day" AS ENUM (
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY'
);


ALTER TYPE public."Day" OWNER TO root;

--
-- Name: UserSex; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public."UserSex" AS ENUM (
    'MALE',
    'FEMALE'
);


ALTER TYPE public."UserSex" OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Admin; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Admin" (
    id text NOT NULL,
    username text NOT NULL
);


ALTER TABLE public."Admin" OWNER TO root;

--
-- Name: Announcement; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Announcement" (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    "classId" integer
);


ALTER TABLE public."Announcement" OWNER TO root;

--
-- Name: Announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Announcement_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Announcement_id_seq" OWNER TO root;

--
-- Name: Announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Announcement_id_seq" OWNED BY public."Announcement".id;


--
-- Name: Assignment; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Assignment" (
    id integer NOT NULL,
    title text NOT NULL,
    "startDate" timestamp(3) without time zone NOT NULL,
    "dueDate" timestamp(3) without time zone NOT NULL,
    "lessonId" integer NOT NULL
);


ALTER TABLE public."Assignment" OWNER TO root;

--
-- Name: Assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Assignment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Assignment_id_seq" OWNER TO root;

--
-- Name: Assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Assignment_id_seq" OWNED BY public."Assignment".id;


--
-- Name: Attendance; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Attendance" (
    id integer NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    present boolean NOT NULL,
    "studentId" text NOT NULL,
    "lessonId" integer NOT NULL
);


ALTER TABLE public."Attendance" OWNER TO root;

--
-- Name: Attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Attendance_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Attendance_id_seq" OWNER TO root;

--
-- Name: Attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Attendance_id_seq" OWNED BY public."Attendance".id;


--
-- Name: Class; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Class" (
    id integer NOT NULL,
    name text NOT NULL,
    capacity integer NOT NULL,
    "supervisorId" text,
    "gradeId" integer NOT NULL
);


ALTER TABLE public."Class" OWNER TO root;

--
-- Name: Class_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Class_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Class_id_seq" OWNER TO root;

--
-- Name: Class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Class_id_seq" OWNED BY public."Class".id;


--
-- Name: Event; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Event" (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "classId" integer
);


ALTER TABLE public."Event" OWNER TO root;

--
-- Name: Event_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Event_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Event_id_seq" OWNER TO root;

--
-- Name: Event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Event_id_seq" OWNED BY public."Event".id;


--
-- Name: Exam; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Exam" (
    id integer NOT NULL,
    title text NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "lessonId" integer NOT NULL
);


ALTER TABLE public."Exam" OWNER TO root;

--
-- Name: Exam_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Exam_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Exam_id_seq" OWNER TO root;

--
-- Name: Exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Exam_id_seq" OWNED BY public."Exam".id;


--
-- Name: Grade; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Grade" (
    id integer NOT NULL,
    level integer NOT NULL
);


ALTER TABLE public."Grade" OWNER TO root;

--
-- Name: Grade_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Grade_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Grade_id_seq" OWNER TO root;

--
-- Name: Grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Grade_id_seq" OWNED BY public."Grade".id;


--
-- Name: Lesson; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Lesson" (
    id integer NOT NULL,
    name text NOT NULL,
    day public."Day" NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "subjectId" integer NOT NULL,
    "classId" integer NOT NULL,
    "teacherId" text NOT NULL
);


ALTER TABLE public."Lesson" OWNER TO root;

--
-- Name: Lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Lesson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Lesson_id_seq" OWNER TO root;

--
-- Name: Lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Lesson_id_seq" OWNED BY public."Lesson".id;


--
-- Name: Parent; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Parent" (
    id text NOT NULL,
    username text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    email text,
    phone text NOT NULL,
    address text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Parent" OWNER TO root;

--
-- Name: Result; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Result" (
    id integer NOT NULL,
    score integer NOT NULL,
    "examId" integer,
    "assignmentId" integer,
    "studentId" text NOT NULL
);


ALTER TABLE public."Result" OWNER TO root;

--
-- Name: Result_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Result_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Result_id_seq" OWNER TO root;

--
-- Name: Result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Result_id_seq" OWNED BY public."Result".id;


--
-- Name: Student; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Student" (
    id text NOT NULL,
    username text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    email text,
    phone text,
    address text NOT NULL,
    img text,
    "bloodType" text NOT NULL,
    sex public."UserSex" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "parentId" text NOT NULL,
    "classId" integer NOT NULL,
    "gradeId" integer NOT NULL,
    birthday timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Student" OWNER TO root;

--
-- Name: Subject; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Subject" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Subject" OWNER TO root;

--
-- Name: Subject_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."Subject_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Subject_id_seq" OWNER TO root;

--
-- Name: Subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."Subject_id_seq" OWNED BY public."Subject".id;


--
-- Name: Teacher; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."Teacher" (
    id text NOT NULL,
    username text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    email text,
    phone text,
    address text NOT NULL,
    img text,
    "bloodType" text NOT NULL,
    sex public."UserSex" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    birthday timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Teacher" OWNER TO root;

--
-- Name: _SubjectToTeacher; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."_SubjectToTeacher" (
    "A" integer NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_SubjectToTeacher" OWNER TO root;

--
-- Name: Announcement id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Announcement" ALTER COLUMN id SET DEFAULT nextval('public."Announcement_id_seq"'::regclass);


--
-- Name: Assignment id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Assignment" ALTER COLUMN id SET DEFAULT nextval('public."Assignment_id_seq"'::regclass);


--
-- Name: Attendance id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Attendance" ALTER COLUMN id SET DEFAULT nextval('public."Attendance_id_seq"'::regclass);


--
-- Name: Class id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Class" ALTER COLUMN id SET DEFAULT nextval('public."Class_id_seq"'::regclass);


--
-- Name: Event id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Event" ALTER COLUMN id SET DEFAULT nextval('public."Event_id_seq"'::regclass);


--
-- Name: Exam id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Exam" ALTER COLUMN id SET DEFAULT nextval('public."Exam_id_seq"'::regclass);


--
-- Name: Grade id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Grade" ALTER COLUMN id SET DEFAULT nextval('public."Grade_id_seq"'::regclass);


--
-- Name: Lesson id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Lesson" ALTER COLUMN id SET DEFAULT nextval('public."Lesson_id_seq"'::regclass);


--
-- Name: Result id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Result" ALTER COLUMN id SET DEFAULT nextval('public."Result_id_seq"'::regclass);


--
-- Name: Subject id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Subject" ALTER COLUMN id SET DEFAULT nextval('public."Subject_id_seq"'::regclass);


--
-- Data for Name: Admin; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Admin" (id, username) FROM stdin;
admin1	admin1
admin2	admin2
\.


--
-- Data for Name: Announcement; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Announcement" (id, title, description, date, "classId") FROM stdin;
4	Announcement 4	Angular Test is Scheduled on April 8th	2025-03-22 22:04:38.517	5
1	Announcement 1	Reading Week is from March 03 - March 07	2025-02-01 22:04:38.5	2
2	Announcement 2	There is no class TOMORROW due to Snow Storm.	2025-02-20 22:04:38.508	3
3	Announcement 3	Happy Holidays...	2025-03-01 22:04:38.512	4
5	Announcement 5	NextJS Project Presentation is on April 1st.	2025-04-01 01:00:00.521	1
6	Announcement 6	Capstone Project Expo is schedules on April 11th at Humber North Campus.	2025-04-02 00:00:00	6
\.


--
-- Data for Name: Assignment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Assignment" (id, title, "startDate", "dueDate", "lessonId") FROM stdin;
1	Assignment 1	2025-03-30 14:42:00	2025-03-31 14:42:00	2
2	Assignment 2	2025-03-30 14:30:00	2025-03-31 14:30:00	3
3	Assignment 3	2025-03-30 14:04:00	2025-03-31 14:04:00	4
4	Assignment 4	2025-03-30 14:37:00	2025-03-31 14:37:00	5
5	Assignment 5	2025-03-30 14:00:00	2025-03-31 14:00:00	6
6	Assignment 6	2025-03-30 14:25:00	2025-03-31 14:25:00	7
7	Assignment 7	2025-03-30 13:42:00	2025-03-31 13:42:00	8
8	Assignment 8	2025-03-30 13:41:00	2025-03-31 13:41:00	9
9	Assignment 9	2025-03-30 14:36:00	2025-03-31 14:36:00	10
10	Assignment 10	2025-03-30 14:10:00	2025-03-31 14:10:00	11
\.


--
-- Data for Name: Attendance; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Attendance" (id, date, present, "studentId", "lessonId") FROM stdin;
1	2025-04-01 22:04:38.423	t	student1	2
4	2025-04-01 22:04:38.423	t	student4	5
3	2025-04-01 22:04:38.423	t	student3	4
6	2025-04-01 22:04:38.423	t	student6	7
8	2025-04-01 22:04:38.423	t	student8	9
5	2025-04-01 22:04:38.423	t	student5	6
9	2025-04-01 22:04:38.423	t	student9	10
10	2025-04-01 22:04:38.423	f	student10	11
7	2025-04-01 22:04:38.423	f	student7	8
2	2025-04-01 22:04:38.423	f	student2	3
\.


--
-- Data for Name: Class; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Class" (id, name, capacity, "supervisorId", "gradeId") FROM stdin;
4	4A	19	teacher10	4
5	5A	20	teacher11	5
6	6A	15	teacher12	6
1	1A	16	teacher13	1
2	2A	17	teacher14	2
3	3A	20	teacher15	3
7	Python 	15	user_2v3T2IvwloBJB3XcQFqoGtcmL3p	5
\.


--
-- Data for Name: Event; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Event" (id, title, description, "startTime", "endTime", "classId") FROM stdin;
1	Event 1	Description for Event 1	2025-03-31 00:04:38.472	2025-03-31 02:04:38.472	2
2	Event 2	Description for Event 2	2025-03-31 01:04:38.479	2025-03-31 03:04:38.479	3
3	Event 3	Description for Event 3	2025-03-31 02:04:38.484	2025-03-31 04:04:38.484	4
4	Event 4	Description for Event 4	2025-03-31 03:04:38.489	2025-03-31 05:04:38.489	5
6	Event 6	NextJS Project Presentation	2025-04-01 14:45:00	2025-04-01 05:25:00	7
5	Event 5	Farewell Party Today!!!!	2025-03-31 12:04:00	2025-03-31 14:04:00	\N
\.


--
-- Data for Name: Exam; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Exam" (id, title, "startTime", "endTime", "lessonId") FROM stdin;
1	Exam 1	2025-03-30 14:42:00	2025-03-30 16:42:00	2
2	Exam 2	2025-03-30 14:30:00	2025-03-30 16:30:00	3
3	Exam 3	2025-03-30 14:04:00	2025-03-30 16:04:00	4
4	Exam 4	2025-03-30 14:37:00	2025-03-30 16:37:00	5
5	Exam 5	2025-03-30 14:00:00	2025-03-30 16:00:00	6
6	Exam 6	2025-03-30 14:25:00	2025-03-30 16:25:00	7
7	Exam 7	2025-03-30 13:42:00	2025-03-30 15:42:00	8
8	Exam 8	2025-03-30 13:41:00	2025-03-30 15:41:00	9
9	Exam 9	2025-03-30 14:36:00	2025-03-30 16:36:00	10
10	Exam 10	2025-03-30 14:10:00	2025-03-30 16:10:00	11
11	Python Exam	2025-04-01 18:00:00	2025-04-01 19:00:00	24
\.


--
-- Data for Name: Grade; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Grade" (id, level) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
\.


--
-- Data for Name: Lesson; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Lesson" (id, name, day, "startTime", "endTime", "subjectId", "classId", "teacherId") FROM stdin;
1	Lesson 1	FRIDAY	2025-03-30 13:42:00	2025-03-30 14:42:00	2	2	teacher2
3	Lesson 3	WEDNESDAY	2025-03-30 13:30:00	2025-03-30 14:30:00	4	4	teacher4
4	Lesson 4	THURSDAY	2025-03-30 13:04:00	2025-03-30 14:04:00	5	5	teacher5
7	Lesson 7	FRIDAY	2025-03-30 13:25:00	2025-03-30 14:25:00	8	2	teacher8
9	Lesson 9	FRIDAY	2025-03-30 12:41:00	2025-03-30 13:41:00	10	4	teacher10
10	Lesson 10	WEDNESDAY	2025-03-30 13:36:00	2025-03-30 14:36:00	1	5	teacher11
11	Lesson 11	WEDNESDAY	2025-03-30 13:10:00	2025-03-30 15:10:00	2	6	teacher12
13	Lesson 13	FRIDAY	2025-03-30 12:35:00	2025-03-30 13:35:00	4	2	teacher14
14	Lesson 14	FRIDAY	2025-03-30 12:18:00	2025-03-30 14:18:00	5	3	teacher15
15	Lesson 15	WEDNESDAY	2025-03-30 13:35:00	2025-03-30 15:35:00	6	4	teacher1
16	Lesson 16	FRIDAY	2025-03-30 12:51:00	2025-03-30 14:51:00	7	5	teacher2
17	Lesson 17	THURSDAY	2025-03-30 13:54:00	2025-03-30 15:54:00	8	6	teacher3
18	Lesson 18	WEDNESDAY	2025-03-30 12:42:00	2025-03-30 13:42:00	9	1	teacher4
19	Lesson 19	FRIDAY	2025-03-30 12:13:00	2025-03-30 14:13:00	10	2	teacher5
20	Lesson 20	FRIDAY	2025-03-30 12:17:00	2025-03-30 14:17:00	1	3	teacher6
25	Lesson 25	WEDNESDAY	2025-03-30 13:18:00	2025-03-30 14:18:00	6	2	teacher11
28	Lesson 28	WEDNESDAY	2025-03-30 12:31:00	2025-03-30 13:31:00	9	5	teacher14
29	Lesson 29	THURSDAY	2025-03-30 13:12:00	2025-03-30 15:12:00	10	6	teacher15
30	Lesson 30	FRIDAY	2025-03-30 13:34:00	2025-03-30 14:34:00	1	1	teacher1
5	Lesson 5	TUESDAY	2025-04-01 12:00:00	2025-04-01 13:30:00	6	6	teacher6
26	Lesson 26	TUESDAY	2025-04-01 14:00:00	2025-04-01 15:00:00	7	3	user_2v3T2IvwloBJB3XcQFqoGtcmL3p
24	Lesson 24	TUESDAY	2025-04-01 13:00:00	2025-04-01 14:00:00	5	1	user_2v3T2IvwloBJB3XcQFqoGtcmL3p
12	Lesson 12	MONDAY	2025-03-31 13:00:00	2025-03-31 14:00:00	3	1	teacher13
27	Lesson 27	MONDAY	2025-03-31 12:00:00	2025-03-31 13:00:00	8	4	user_2v3T2IvwloBJB3XcQFqoGtcmL3p
23	Lesson 23	MONDAY	2025-03-31 13:00:00	2025-03-31 14:00:00	4	6	teacher9
22	Lesson 22	MONDAY	2025-03-31 14:00:00	2025-03-31 15:30:00	3	5	teacher8
6	Lesson 6	MONDAY	2025-03-31 15:00:00	2025-03-31 16:00:00	7	1	teacher7
21	Lesson 21	TUESDAY	2025-04-01 12:00:00	2025-04-01 13:00:00	2	4	user_2v3T2IvwloBJB3XcQFqoGtcmL3p
8	Lesson 8	TUESDAY	2025-04-01 16:00:00	2025-04-01 17:00:00	9	3	teacher9
2	Lesson 2	TUESDAY	2025-04-01 17:00:00	2025-04-01 18:00:00	3	3	teacher3
\.


--
-- Data for Name: Parent; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Parent" (id, username, name, surname, email, phone, address, "createdAt") FROM stdin;
parentId1	parentId1	Prakash	Verma	parent1@example.com	+91 107716624	Delhi, India	2025-03-30 22:04:37.846
parentId2	parentId2	Sunita	Singh	parent2@example.com	+91 101592902	Mumbai, India	2025-03-30 22:04:37.854
parentId3	parentId3	Rakesh	Sharma	parent3@example.com	+91 169193233	Bangalore, India	2025-03-30 22:04:37.859
parentId4	parentId4	Nisha	Patel	parent4@example.com	+91 128592385	Kolkata, India	2025-03-30 22:04:37.863
parentId5	parentId5	Vijay	Kumar	parent5@example.com	+91 164285221	Chennai, India	2025-03-30 22:04:37.867
parentId6	parentId6	Priti	Gupta	parent6@example.com	+91 151483304	Hyderabad, India	2025-03-30 22:04:37.872
parentId7	parentId7	Sandeep	Yadav	parent7@example.com	+91 147157357	Ahmedabad, India	2025-03-30 22:04:37.877
parentId8	parentId8	Manju	Devi	parent8@example.com	+91 108825964	Pune, India	2025-03-30 22:04:37.881
parentId9	parentId9	Rajeshwari	Rao	parent9@example.com	+91 132810244	Surat, India	2025-03-30 22:04:37.886
parentId10	parentId10	Vikram	Singh	parent10@example.com	+91 121488407	Jaipur, India	2025-03-30 22:04:37.892
parentId11	parentId11	Anita	Mehra	parent11@example.com	+91 125748767	Lucknow, India	2025-03-30 22:04:37.896
parentId12	parentId12	Suresh	Khanna	parent12@example.com	+91 147080832	Kanpur, India	2025-03-30 22:04:37.901
parentId13	parentId13	Jyoti	Desai	parent13@example.com	+91 139257093	Nagpur, India	2025-03-30 22:04:37.905
parentId14	parentId14	Gaurav	Kapoor	parent14@example.com	+91 164950711	Indore, India	2025-03-30 22:04:37.91
parentId15	parentId15	Pooja	Malhotra	parent15@example.com	+91 112980199	Bhopal, India	2025-03-30 22:04:37.914
parentId16	parentId16	Ravi	Reddy	parent16@example.com	+91 148246897	Delhi, India	2025-03-30 22:04:37.918
parentId17	parentId17	Deepak	Khan	parent17@example.com	+91 169718014	Mumbai, India	2025-03-30 22:04:37.922
parentId18	parentId18	Shweta	Jain	parent18@example.com	+91 146679115	Bangalore, India	2025-03-30 22:04:37.927
parentId20	parentId20	Mamta	Srivastava	parent20@example.com	+91 74399201	Chennai, India	2025-03-30 22:04:37.934
parentId21	parentId21	Rohit	Tiwari	parent21@example.com	+91 95664372	Hyderabad, India	2025-03-30 22:04:37.938
parentId22	parentId22	Neha	Chaturvedi	parent22@example.com	+91 131185987	Ahmedabad, India	2025-03-30 22:04:37.943
parentId23	parentId23	Saurabh	Mishra	parent23@example.com	+91 143518221	Pune, India	2025-03-30 22:04:37.947
parentId24	parentId24	Priya	Pandey	parent24@example.com	+91 77147899	Surat, India	2025-03-30 22:04:37.951
parentId25	parentId25	Arjun	Saxena	parent25@example.com	+91 112322829	Jaipur, India	2025-03-30 22:04:37.955
user_2v5QHSpNw5KkIsDpPyTqX0952Vi	YashPatel	Yash	Patel	Yash@gmail.com	9827483821	Brampton	2025-03-31 14:46:04.622
user_2v5u6E4JZxiwVuPdndSfV3KHd5Q	PruthviPatel	Pruthvi	Patel	Pruthvi@gmail.com	2263449473	Etobicoke	2025-03-31 18:51:16.615
parentId19	parentId19	Anil	Agarwall	parent19@example.com	+91 135665579	Kolkata, India	2025-03-30 22:04:37.931
\.


--
-- Data for Name: Result; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Result" (id, score, "examId", "assignmentId", "studentId") FROM stdin;
1	5	1	\N	student1
2	41	2	\N	student2
3	96	3	\N	student3
4	13	4	\N	student4
5	31	5	\N	student5
6	94	\N	1	student6
7	76	\N	2	student7
8	28	\N	3	student8
9	87	\N	4	student9
10	34	\N	5	student10
\.


--
-- Data for Name: Student; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Student" (id, username, name, surname, email, phone, address, img, "bloodType", sex, "createdAt", "parentId", "classId", "gradeId", birthday) FROM stdin;
student2	student2	Diya	Patel	student2@example.com	+91 73369656	Mumbai, India	\N	A+	FEMALE	2025-03-30 22:04:37.97	parentId1	2	2	2015-03-30 22:04:37.969
student3	student3	Vivaan	Singh	student3@example.com	+91 145295430	Bangalore, India	\N	AB-	MALE	2025-03-30 22:04:37.975	parentId2	3	3	2015-03-30 22:04:37.974
student4	student4	Aarav	Verma	student4@example.com	+91 151547416	Kolkata, India	\N	AB-	FEMALE	2025-03-30 22:04:37.98	parentId2	4	4	2015-03-30 22:04:37.979
student5	student5	Anika	Gupta	student5@example.com	+91 125094867	Chennai, India	\N	B+	MALE	2025-03-30 22:04:37.984	parentId3	5	5	2015-03-30 22:04:37.983
student6	student6	Advait	Yadav	student6@example.com	+91 158574487	Hyderabad, India	\N	O+	FEMALE	2025-03-30 22:04:37.989	parentId3	6	6	2015-03-30 22:04:37.988
student7	student7	Siya	Mehra	student7@example.com	+91 74175508	Ahmedabad, India	\N	A+	MALE	2025-03-30 22:04:37.994	parentId4	1	1	2015-03-30 22:04:37.993
student8	student8	Vihaan	Khanna	student8@example.com	+91 77287870	Pune, India	\N	AB+	FEMALE	2025-03-30 22:04:37.998	parentId4	2	2	2015-03-30 22:04:37.998
student9	student9	Myra	Desai	student9@example.com	+91 96953556	Surat, India	\N	B-	MALE	2025-03-30 22:04:38.003	parentId5	3	3	2015-03-30 22:04:38.002
student12	student12	Ishaan	Reddy	student12@example.com	+91 109782910	Kanpur, India	\N	AB-	FEMALE	2025-03-30 22:04:38.016	parentId6	6	6	2015-03-30 22:04:38.015
student13	student13	Aanya	Khan	student13@example.com	+91 72000951	Nagpur, India	\N	AB-	MALE	2025-03-30 22:04:38.02	parentId7	1	1	2015-03-30 22:04:38.019
student14	student14	Kabir	Jain	student14@example.com	+91 124554685	Indore, India	\N	A+	FEMALE	2025-03-30 22:04:38.025	parentId7	2	2	2015-03-30 22:04:38.024
student15	student15	Navya	Agarwal	student15@example.com	+91 124403641	Bhopal, India	\N	B-	MALE	2025-03-30 22:04:38.029	parentId8	3	3	2015-03-30 22:04:38.028
student16	student16	Rohan	Srivastava	student16@example.com	+91 99563270	Delhi, India	\N	A-	FEMALE	2025-03-30 22:04:38.033	parentId8	4	4	2015-03-30 22:04:38.032
student17	student17	Aaradhya	Tiwari	student17@example.com	+91 154372886	Mumbai, India	\N	A-	MALE	2025-03-30 22:04:38.037	parentId9	5	5	2015-03-30 22:04:38.036
student18	student18	Vivaan	Chaturvedi	student18@example.com	+91 13349105	Bangalore, India	\N	B+	FEMALE	2025-03-30 22:04:38.042	parentId9	6	6	2015-03-30 22:04:38.041
student19	student19	Ishani	Mishra	student19@example.com	+91 125852796	Kolkata, India	\N	O-	MALE	2025-03-30 22:04:38.046	parentId10	1	1	2015-03-30 22:04:38.045
student20	student20	Ved	Pandey	student20@example.com	+91 79023055	Chennai, India	\N	B+	FEMALE	2025-03-30 22:04:38.05	parentId10	2	2	2015-03-30 22:04:38.049
student21	student21	Sara	Saxena	student21@example.com	+91 111159271	Hyderabad, India	\N	O+	MALE	2025-03-30 22:04:38.055	parentId11	3	3	2015-03-30 22:04:38.054
student22	student22	Neil	Arora	student22@example.com	+91 164513382	Ahmedabad, India	\N	A+	FEMALE	2025-03-30 22:04:38.06	parentId11	4	4	2015-03-30 22:04:38.059
student23	student23	Ananya	Bansal	student23@example.com	+91 72418860	Pune, India	\N	A+	MALE	2025-03-30 22:04:38.065	parentId12	5	5	2015-03-30 22:04:38.064
student24	student24	Dhruv	Bhargava	student24@example.com	+91 167211874	Surat, India	\N	AB+	FEMALE	2025-03-30 22:04:38.071	parentId12	6	6	2015-03-30 22:04:38.07
student25	student25	Ishika	Bhushan	student25@example.com	+91 149934502	Jaipur, India	\N	AB+	MALE	2025-03-30 22:04:38.075	parentId13	1	1	2015-03-30 22:04:38.074
student26	student26	Kiaan	Chawla	student26@example.com	+91 76802552	Lucknow, India	\N	O+	FEMALE	2025-03-30 22:04:38.08	parentId13	2	2	2015-03-30 22:04:38.079
student27	student27	Samaira	Chopra	student27@example.com	+91 10778011	Kanpur, India	\N	AB+	MALE	2025-03-30 22:04:38.084	parentId14	3	3	2015-03-30 22:04:38.083
student28	student28	Vivaan	Goel	student28@example.com	+91 131134824	Nagpur, India	\N	O-	FEMALE	2025-03-30 22:04:38.089	parentId14	4	4	2015-03-30 22:04:38.088
student29	student29	Aarohi	Gupta	student29@example.com	+91 8696358	Indore, India	\N	A-	MALE	2025-03-30 22:04:38.094	parentId15	5	5	2015-03-30 22:04:38.093
student30	student30	Reyansh	Jain	student30@example.com	+91 87192303	Bhopal, India	\N	AB-	FEMALE	2025-03-30 22:04:38.101	parentId15	6	6	2015-03-30 22:04:38.1
student31	student31	Siya	Kapoor	student31@example.com	+91 107713499	Delhi, India	\N	B+	MALE	2025-03-30 22:04:38.107	parentId16	1	1	2015-03-30 22:04:38.105
student32	student32	Vivaan	Khanna	student32@example.com	+91 85371383	Mumbai, India	\N	O-	FEMALE	2025-03-30 22:04:38.112	parentId16	2	2	2015-03-30 22:04:38.111
student33	student33	Anika	Malhotra	student33@example.com	+91 92055908	Bangalore, India	\N	A-	MALE	2025-03-30 22:04:38.117	parentId17	3	3	2015-03-30 22:04:38.116
student34	student34	Advait	Mehra	student34@example.com	+91 157544737	Kolkata, India	\N	A-	FEMALE	2025-03-30 22:04:38.123	parentId17	4	4	2015-03-30 22:04:38.122
student35	student35	Diya	Mittal	student35@example.com	+91 91998793	Chennai, India	\N	O+	MALE	2025-03-30 22:04:38.129	parentId18	5	5	2015-03-30 22:04:38.128
student36	student36	Aryan	Narula	student36@example.com	+91 136668965	Hyderabad, India	\N	A-	FEMALE	2025-03-30 22:04:38.135	parentId18	6	6	2015-03-30 22:04:38.134
student37	student37	Ananya	Oberoi	student37@example.com	+91 142377646	Ahmedabad, India	\N	O-	MALE	2025-03-30 22:04:38.14	parentId19	1	1	2015-03-30 22:04:38.139
student38	student38	Vihaan	Sharma	student38@example.com	+91 82482517	Pune, India	\N	B+	FEMALE	2025-03-30 22:04:38.146	parentId19	2	2	2015-03-30 22:04:38.145
student39	student39	Aarav	Singh	student39@example.com	+91 75033038	Surat, India	\N	AB-	MALE	2025-03-30 22:04:38.151	parentId20	3	3	2015-03-30 22:04:38.15
student40	student40	Siya	Sood	student40@example.com	+91 157940523	Jaipur, India	\N	AB-	FEMALE	2025-03-30 22:04:38.156	parentId20	4	4	2015-03-30 22:04:38.155
student41	student41	Kabir	Tandon	student41@example.com	+91 149322038	Lucknow, India	\N	B-	MALE	2025-03-30 22:04:38.162	parentId21	5	5	2015-03-30 22:04:38.161
student42	student42	Navya	Verma	student42@example.com	+91 9303751	Kanpur, India	\N	A+	FEMALE	2025-03-30 22:04:38.168	parentId21	6	6	2015-03-30 22:04:38.167
student43	student43	Rohan	Yadav	student43@example.com	+91 151426712	Nagpur, India	\N	O+	MALE	2025-03-30 22:04:38.174	parentId22	1	1	2015-03-30 22:04:38.172
student44	student44	Aaradhya	Arora	student44@example.com	+91 105778130	Indore, India	\N	AB+	FEMALE	2025-03-30 22:04:38.179	parentId22	2	2	2015-03-30 22:04:38.178
student45	student45	Vivaan	Bansal	student45@example.com	+91 154453727	Bhopal, India	\N	O-	MALE	2025-03-30 22:04:38.184	parentId23	3	3	2015-03-30 22:04:38.183
student46	student46	Ishani	Bhargava	student46@example.com	+91 131241163	Delhi, India	\N	AB+	FEMALE	2025-03-30 22:04:38.189	parentId23	4	4	2015-03-30 22:04:38.188
student47	student47	Ved	Bhushan	student47@example.com	+91 81028001	Mumbai, India	\N	AB+	MALE	2025-03-30 22:04:38.198	parentId24	5	5	2015-03-30 22:04:38.197
student48	student48	Sara	Chawla	student48@example.com	+91 1270038	Bangalore, India	\N	A+	FEMALE	2025-03-30 22:04:38.203	parentId24	6	6	2015-03-30 22:04:38.202
student11	student11	Kiara	Patel	student11@example.com	+91 169944512	Lucknow, India	\N	AB-	MALE	2025-03-30 22:04:38.012	user_2v5u6E4JZxiwVuPdndSfV3KHd5Q	5	5	2015-03-30 22:04:38.011
student49	student49	Neil	Chopra	student49@example.com	+91 8260092	Kolkata, India	\N	B+	MALE	2025-03-30 22:04:38.21	parentId25	1	1	2015-03-30 22:04:38.209
student50	student50	Ananya	Goel	student50@example.com	+91 127468535	Chennai, India	\N	B-	FEMALE	2025-03-30 22:04:38.216	parentId25	2	2	2015-03-30 22:04:38.215
user_2v48Cp8BXnrAHTn47Aq5smWQzH4	KathanParekh	Kathan	Parekh	Kathan@gmail.com	9728273898	Scarborough	\N	B+	MALE	2025-03-31 03:47:39.009	parentId1	6	5	2019-02-20 00:00:00
user_2v6m94xHucZi8NR2ZV6xCBdJ2hq	AmanPatel	Aman	Patel	Aman@gmail.com	2263998372	Oshawa	\N	O-	MALE	2025-04-01 02:15:42.089	parentId4	4	5	2001-02-13 00:00:00
student10	student10	Reyansh	Patel	student10@example.com	+91 136750973	Jaipur, India	\N	O+	FEMALE	2025-03-30 22:04:38.008	user_2v5u6E4JZxiwVuPdndSfV3KHd5Q	4	4	2015-03-30 22:04:38.007
student1	student1	Aryan	Patel	student1@example.com	+91 93312019	Delhi, India	\N	AB-	MALE	2025-03-30 22:04:37.96	user_2v5QHSpNw5KkIsDpPyTqX0952Vi	1	1	2015-03-30 22:04:37.959
\.


--
-- Data for Name: Subject; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Subject" (id, name) FROM stdin;
1	Mathematics
2	Science
3	English
4	History
5	Geography
6	Physics
7	Chemistry
8	Biology
9	Computer Science
10	Art
11	Python
\.


--
-- Data for Name: Teacher; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."Teacher" (id, username, name, surname, email, phone, address, img, "bloodType", sex, "createdAt", birthday) FROM stdin;
teacher2	teacher2	Rajesh	Verma	teacher2@example.com	+91 105344234	Mumbai, India	\N	B+	FEMALE	2025-03-30 22:04:37.523	1995-03-30 23:04:37.522
teacher3	teacher3	Neha	Singh	teacher3@example.com	+91 85376725	Bangalore, India	\N	A+	MALE	2025-03-30 22:04:37.537	1995-03-30 23:04:37.536
teacher4	teacher4	Vikram	Gupta	teacher4@example.com	+91 7326961	Kolkata, India	\N	AB+	FEMALE	2025-03-30 22:04:37.552	1995-03-30 23:04:37.551
teacher5	teacher5	Anjali	Yadav	teacher5@example.com	+91 136588853	Chennai, India	\N	AB+	MALE	2025-03-30 22:04:37.569	1995-03-30 23:04:37.567
teacher6	teacher6	Suresh	Patel	teacher6@example.com	+91 81842739	Hyderabad, India	\N	O+	FEMALE	2025-03-30 22:04:37.584	1995-03-30 23:04:37.583
teacher7	teacher7	Pooja	Mehra	teacher7@example.com	+91 74939960	Ahmedabad, India	\N	O+	MALE	2025-03-30 22:04:37.6	1995-03-30 23:04:37.599
teacher8	teacher8	Ravi	Khanna	teacher8@example.com	+91 156494449	Pune, India	\N	AB+	FEMALE	2025-03-30 22:04:37.615	1995-03-30 23:04:37.614
teacher9	teacher9	Deepika	Desai	teacher9@example.com	+91 78896781	Surat, India	\N	AB+	MALE	2025-03-30 22:04:37.63	1995-03-30 23:04:37.629
teacher10	teacher10	Amit	Kapoor	teacher10@example.com	+91 136129034	Jaipur, India	\N	AB+	FEMALE	2025-03-30 22:04:37.644	1995-03-30 23:04:37.643
teacher12	teacher12	Sanjay	Reddy	teacher12@example.com	+91 114385864	Kanpur, India	\N	O+	FEMALE	2025-03-30 22:04:37.675	1995-03-30 23:04:37.673
teacher13	teacher13	Meena	Khan	teacher13@example.com	+91 116615152	Nagpur, India	\N	A+	MALE	2025-03-30 22:04:37.689	1995-03-30 23:04:37.688
teacher14	teacher14	Rahul	Agarwal	teacher14@example.com	+91 94660116	Indore, India	\N	AB+	FEMALE	2025-03-30 22:04:37.7	1995-03-30 23:04:37.699
teacher15	teacher15	Divya	Jain	teacher15@example.com	+91 126132917	Bhopal, India	\N	AB+	MALE	2025-03-30 22:04:37.71	1995-03-30 23:04:37.709
teacher1	teacher1	Priya	Sharma	teacher1@example.com	+91 164349665	Delhi, India	\N	O+	FEMALE	2025-03-30 22:04:37.492	1995-03-30 00:00:00
user_2v3T2IvwloBJB3XcQFqoGtcmL3p	RushitJetani	Rushit	Jetani	rushit@gmail.com	7059520126	Toronto	\N	A+	MALE	2025-03-30 22:09:07.401	2002-06-20 00:00:00
teacher11	teacher11	Shalini	Malhotra 2	teacher11@example.com	+91 16174970	Lucknow, India	\N	O+	FEMALE	2025-03-30 22:04:37.658	1995-03-30 00:00:00
user_2v8JBlyRFlxrzqTxyM5vM9fjJkq	patelbhavin212	Rushit wd	Jetani sd	rushitndskdj@gmail.com	2269372516	987 Pharmacy Ave	\N	A+	MALE	2025-04-01 15:17:14.328	2025-03-18 00:00:00
\.


--
-- Data for Name: _SubjectToTeacher; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."_SubjectToTeacher" ("A", "B") FROM stdin;
2	teacher2
3	teacher3
4	teacher4
5	teacher5
6	teacher6
7	teacher7
8	teacher8
9	teacher9
10	teacher10
2	teacher12
3	teacher13
4	teacher14
5	teacher15
1	user_2v3T2IvwloBJB3XcQFqoGtcmL3p
2	user_2v3T2IvwloBJB3XcQFqoGtcmL3p
9	user_2v3T2IvwloBJB3XcQFqoGtcmL3p
11	user_2v3T2IvwloBJB3XcQFqoGtcmL3p
3	user_2v8JBlyRFlxrzqTxyM5vM9fjJkq
\.


--
-- Name: Announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Announcement_id_seq"', 10, true);


--
-- Name: Assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Assignment_id_seq"', 10, true);


--
-- Name: Attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Attendance_id_seq"', 10, true);


--
-- Name: Class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Class_id_seq"', 7, true);


--
-- Name: Event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Event_id_seq"', 6, true);


--
-- Name: Exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Exam_id_seq"', 11, true);


--
-- Name: Grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Grade_id_seq"', 6, true);


--
-- Name: Lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Lesson_id_seq"', 30, true);


--
-- Name: Result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Result_id_seq"', 10, true);


--
-- Name: Subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."Subject_id_seq"', 13, true);


--
-- Name: Admin Admin_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY (id);


--
-- Name: Announcement Announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Announcement"
    ADD CONSTRAINT "Announcement_pkey" PRIMARY KEY (id);


--
-- Name: Assignment Assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Assignment"
    ADD CONSTRAINT "Assignment_pkey" PRIMARY KEY (id);


--
-- Name: Attendance Attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_pkey" PRIMARY KEY (id);


--
-- Name: Class Class_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Class"
    ADD CONSTRAINT "Class_pkey" PRIMARY KEY (id);


--
-- Name: Event Event_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY (id);


--
-- Name: Exam Exam_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_pkey" PRIMARY KEY (id);


--
-- Name: Grade Grade_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_pkey" PRIMARY KEY (id);


--
-- Name: Lesson Lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_pkey" PRIMARY KEY (id);


--
-- Name: Parent Parent_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Parent"
    ADD CONSTRAINT "Parent_pkey" PRIMARY KEY (id);


--
-- Name: Result Result_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_pkey" PRIMARY KEY (id);


--
-- Name: Student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (id);


--
-- Name: Subject Subject_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_pkey" PRIMARY KEY (id);


--
-- Name: Teacher Teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Teacher"
    ADD CONSTRAINT "Teacher_pkey" PRIMARY KEY (id);


--
-- Name: Admin_username_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Admin_username_key" ON public."Admin" USING btree (username);


--
-- Name: Class_name_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Class_name_key" ON public."Class" USING btree (name);


--
-- Name: Grade_level_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Grade_level_key" ON public."Grade" USING btree (level);


--
-- Name: Parent_email_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Parent_email_key" ON public."Parent" USING btree (email);


--
-- Name: Parent_phone_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Parent_phone_key" ON public."Parent" USING btree (phone);


--
-- Name: Parent_username_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Parent_username_key" ON public."Parent" USING btree (username);


--
-- Name: Student_email_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Student_email_key" ON public."Student" USING btree (email);


--
-- Name: Student_phone_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Student_phone_key" ON public."Student" USING btree (phone);


--
-- Name: Student_username_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Student_username_key" ON public."Student" USING btree (username);


--
-- Name: Subject_name_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Subject_name_key" ON public."Subject" USING btree (name);


--
-- Name: Teacher_email_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Teacher_email_key" ON public."Teacher" USING btree (email);


--
-- Name: Teacher_phone_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Teacher_phone_key" ON public."Teacher" USING btree (phone);


--
-- Name: Teacher_username_key; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "Teacher_username_key" ON public."Teacher" USING btree (username);


--
-- Name: _SubjectToTeacher_AB_unique; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX "_SubjectToTeacher_AB_unique" ON public."_SubjectToTeacher" USING btree ("A", "B");


--
-- Name: _SubjectToTeacher_B_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "_SubjectToTeacher_B_index" ON public."_SubjectToTeacher" USING btree ("B");


--
-- Name: Announcement Announcement_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Announcement"
    ADD CONSTRAINT "Announcement_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Assignment Assignment_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Assignment"
    ADD CONSTRAINT "Assignment_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lesson"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Attendance Attendance_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lesson"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Attendance Attendance_studentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES public."Student"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Class Class_gradeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Class"
    ADD CONSTRAINT "Class_gradeId_fkey" FOREIGN KEY ("gradeId") REFERENCES public."Grade"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Class Class_supervisorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Class"
    ADD CONSTRAINT "Class_supervisorId_fkey" FOREIGN KEY ("supervisorId") REFERENCES public."Teacher"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Event Event_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT "Event_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Exam Exam_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lesson"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Lesson Lesson_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Lesson Lesson_subjectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Lesson Lesson_teacherId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES public."Teacher"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Result Result_assignmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_assignmentId_fkey" FOREIGN KEY ("assignmentId") REFERENCES public."Assignment"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Result Result_examId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_examId_fkey" FOREIGN KEY ("examId") REFERENCES public."Exam"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Result Result_studentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES public."Student"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_gradeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_gradeId_fkey" FOREIGN KEY ("gradeId") REFERENCES public."Grade"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_parentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES public."Parent"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _SubjectToTeacher _SubjectToTeacher_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."_SubjectToTeacher"
    ADD CONSTRAINT "_SubjectToTeacher_A_fkey" FOREIGN KEY ("A") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _SubjectToTeacher _SubjectToTeacher_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."_SubjectToTeacher"
    ADD CONSTRAINT "_SubjectToTeacher_B_fkey" FOREIGN KEY ("B") REFERENCES public."Teacher"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: root
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

