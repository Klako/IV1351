--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.1

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
-- Name: configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuration (
    sibling_discount_rate real NOT NULL,
    max_rented_instruments integer NOT NULL,
    max_rented_months integer NOT NULL
);


ALTER TABLE public.configuration OWNER TO postgres;

--
-- Name: contact_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_person (
    student_id integer NOT NULL,
    name character varying NOT NULL,
    phone_number character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public.contact_person OWNER TO postgres;

--
-- Name: ensemble; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ensemble (
    ensemble_id integer NOT NULL,
    min_students integer NOT NULL,
    max_students integer NOT NULL,
    instructor_id integer,
    skill_level_id integer NOT NULL,
    time_slot_id integer NOT NULL,
    genre integer NOT NULL
);


ALTER TABLE public.ensemble OWNER TO postgres;

--
-- Name: ensemble_ensemble_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ensemble ALTER COLUMN ensemble_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ensemble_ensemble_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ensemble_student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ensemble_student (
    ensemble_id integer NOT NULL,
    student_id integer NOT NULL,
    instrument_type_id integer NOT NULL,
    accepted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.ensemble_student OWNER TO postgres;

--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    genre_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: genre_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.genre ALTER COLUMN genre_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.genre_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: group_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_lesson (
    group_lesson_id integer NOT NULL,
    min_students integer NOT NULL,
    max_students integer NOT NULL,
    instructor_id integer,
    instrument_type_id integer NOT NULL,
    skill_level_id integer NOT NULL,
    time_slot_id integer NOT NULL
);


ALTER TABLE public.group_lesson OWNER TO postgres;

--
-- Name: group_lesson_group_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.group_lesson ALTER COLUMN group_lesson_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.group_lesson_group_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: group_lesson_student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_lesson_student (
    group_lesson_id integer NOT NULL,
    student_id integer NOT NULL,
    accepted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.group_lesson_student OWNER TO postgres;

--
-- Name: individual_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.individual_lesson (
    individual_lesson_id integer NOT NULL,
    instructor_id integer,
    student_id integer,
    instrument_type_id integer NOT NULL,
    skill_level_id integer NOT NULL,
    time_slot_id integer NOT NULL,
    accepted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.individual_lesson OWNER TO postgres;

--
-- Name: individual_lesson_individual_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.individual_lesson ALTER COLUMN individual_lesson_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.individual_lesson_individual_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    instructor_id integer NOT NULL,
    name character varying NOT NULL,
    person_number character varying NOT NULL,
    phone_number character varying NOT NULL,
    email character varying NOT NULL,
    address character varying NOT NULL,
    zip character varying NOT NULL
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- Name: instructor_availability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_availability (
    instructor_availability_id integer NOT NULL,
    date date NOT NULL,
    start_time time with time zone NOT NULL,
    end_time time with time zone NOT NULL,
    instructor_id integer
);


ALTER TABLE public.instructor_availability OWNER TO postgres;

--
-- Name: instructor_availability_instructor_availability_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.instructor_availability ALTER COLUMN instructor_availability_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.instructor_availability_instructor_availability_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: instructor_instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.instructor ALTER COLUMN instructor_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.instructor_instructor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: instructor_instrument_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_instrument_type (
    instructor_id integer NOT NULL,
    instrument_type_id integer NOT NULL
);


ALTER TABLE public.instructor_instrument_type OWNER TO postgres;

--
-- Name: instrument_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instrument_brand (
    instrument_brand_id integer NOT NULL,
    name character varying
);


ALTER TABLE public.instrument_brand OWNER TO postgres;

--
-- Name: instrument_brand_instrument_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.instrument_brand ALTER COLUMN instrument_brand_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.instrument_brand_instrument_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: instrument_lease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instrument_lease (
    instrument_lease_id integer NOT NULL,
    start_month date NOT NULL,
    end_month date NOT NULL,
    student_id integer NOT NULL,
    rentable_instrument_id integer NOT NULL
);


ALTER TABLE public.instrument_lease OWNER TO postgres;

--
-- Name: instrument_lease_instrument_lease_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.instrument_lease ALTER COLUMN instrument_lease_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.instrument_lease_instrument_lease_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: instrument_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instrument_type (
    instrument_type_id integer NOT NULL,
    name character varying
);


ALTER TABLE public.instrument_type OWNER TO postgres;

--
-- Name: instrument_type_instrument_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.instrument_type ALTER COLUMN instrument_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.instrument_type_instrument_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: lesson_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_price (
    lesson_type_id integer NOT NULL,
    skill_level_id integer NOT NULL,
    price money NOT NULL
);


ALTER TABLE public.lesson_price OWNER TO postgres;

--
-- Name: lesson_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_type (
    lesson_type_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.lesson_type OWNER TO postgres;

--
-- Name: lesson_type_lesson_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.lesson_type ALTER COLUMN lesson_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.lesson_type_lesson_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    location_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: location_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.location ALTER COLUMN location_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.location_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rentable_instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rentable_instrument (
    rentable_instrument_id integer NOT NULL,
    barcode character varying NOT NULL,
    monthly_fee money NOT NULL,
    instrument_type_id integer,
    instrument_brand_id integer
);


ALTER TABLE public.rentable_instrument OWNER TO postgres;

--
-- Name: rentable_instrument_rentable_instrument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rentable_instrument ALTER COLUMN rentable_instrument_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rentable_instrument_rentable_instrument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: skill_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill_level (
    skill_level_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.skill_level OWNER TO postgres;

--
-- Name: skill_level_skill_level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.skill_level ALTER COLUMN skill_level_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.skill_level_skill_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    student_id integer NOT NULL,
    phone_number character varying NOT NULL,
    email character varying NOT NULL,
    address character varying NOT NULL,
    zip character varying NOT NULL,
    name character varying NOT NULL,
    person_number character varying NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_sibling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_sibling (
    student_1 integer NOT NULL,
    student_2 integer NOT NULL
);


ALTER TABLE public.student_sibling OWNER TO postgres;

--
-- Name: student_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.student ALTER COLUMN student_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.student_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: time_slot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slot (
    time_slot_id integer NOT NULL,
    date date NOT NULL,
    start_time time with time zone NOT NULL,
    end_time time with time zone NOT NULL,
    location_id integer
);


ALTER TABLE public.time_slot OWNER TO postgres;

--
-- Name: time_slot_time_slot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.time_slot ALTER COLUMN time_slot_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.time_slot_time_slot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contact_person contact_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_pkey PRIMARY KEY (student_id);


--
-- Name: ensemble ensemble_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble
    ADD CONSTRAINT ensemble_pkey PRIMARY KEY (ensemble_id);


--
-- Name: ensemble_student ensemble_student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble_student
    ADD CONSTRAINT ensemble_student_pkey PRIMARY KEY (ensemble_id, student_id);


--
-- Name: genre genre_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_name_key UNIQUE (name);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- Name: group_lesson group_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT group_lesson_pkey PRIMARY KEY (group_lesson_id);


--
-- Name: group_lesson_student group_lesson_student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson_student
    ADD CONSTRAINT group_lesson_student_pkey PRIMARY KEY (group_lesson_id, student_id);


--
-- Name: individual_lesson individual_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT individual_lesson_pkey PRIMARY KEY (individual_lesson_id);


--
-- Name: instructor_availability instructor_availability_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_availability
    ADD CONSTRAINT instructor_availability_pkey PRIMARY KEY (instructor_availability_id);


--
-- Name: instructor_instrument_type instructor_instrument_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instrument_type
    ADD CONSTRAINT instructor_instrument_type_pkey PRIMARY KEY (instructor_id, instrument_type_id);


--
-- Name: instructor instructor_person_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_person_number_key UNIQUE (person_number);


--
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (instructor_id);


--
-- Name: instrument_brand instrument_brand_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_brand
    ADD CONSTRAINT instrument_brand_name_key UNIQUE (name);


--
-- Name: instrument_brand instrument_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_brand
    ADD CONSTRAINT instrument_brand_pkey PRIMARY KEY (instrument_brand_id);


--
-- Name: instrument_lease instrument_lease_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_lease
    ADD CONSTRAINT instrument_lease_pkey PRIMARY KEY (instrument_lease_id);


--
-- Name: instrument_type instrument_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_type
    ADD CONSTRAINT instrument_type_name_key UNIQUE (name);


--
-- Name: instrument_type instrument_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_type
    ADD CONSTRAINT instrument_type_pkey PRIMARY KEY (instrument_type_id);


--
-- Name: lesson_price lesson_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_price
    ADD CONSTRAINT lesson_price_pkey PRIMARY KEY (lesson_type_id, skill_level_id);


--
-- Name: lesson_type lesson_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_type
    ADD CONSTRAINT lesson_type_name_key UNIQUE (name);


--
-- Name: lesson_type lesson_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_type
    ADD CONSTRAINT lesson_type_pkey PRIMARY KEY (lesson_type_id);


--
-- Name: location location_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_name_key UNIQUE (name);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- Name: rentable_instrument rentable_instrument_barcode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentable_instrument
    ADD CONSTRAINT rentable_instrument_barcode_key UNIQUE (barcode);


--
-- Name: rentable_instrument rentable_instrument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentable_instrument
    ADD CONSTRAINT rentable_instrument_pkey PRIMARY KEY (rentable_instrument_id);


--
-- Name: skill_level skill_level_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_level
    ADD CONSTRAINT skill_level_name_key UNIQUE (name);


--
-- Name: skill_level skill_level_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_level
    ADD CONSTRAINT skill_level_pkey PRIMARY KEY (skill_level_id);


--
-- Name: student student_person_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_person_number_key UNIQUE (person_number);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);


--
-- Name: student_sibling student_sibling_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_sibling
    ADD CONSTRAINT student_sibling_pkey PRIMARY KEY (student_1, student_2);


--
-- Name: time_slot time_slot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slot
    ADD CONSTRAINT time_slot_pkey PRIMARY KEY (time_slot_id);


--
-- Name: contact_person contact_person_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ensemble ensemble_genre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble
    ADD CONSTRAINT ensemble_genre_fkey FOREIGN KEY (genre) REFERENCES public.genre(genre_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: ensemble ensemble_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble
    ADD CONSTRAINT ensemble_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ensemble ensemble_skill_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble
    ADD CONSTRAINT ensemble_skill_level_id_fkey FOREIGN KEY (skill_level_id) REFERENCES public.skill_level(skill_level_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ensemble_student ensemble_student_ensemble_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble_student
    ADD CONSTRAINT ensemble_student_ensemble_id_fkey FOREIGN KEY (ensemble_id) REFERENCES public.ensemble(ensemble_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ensemble_student ensemble_student_instrument_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble_student
    ADD CONSTRAINT ensemble_student_instrument_type_id_fkey FOREIGN KEY (instrument_type_id) REFERENCES public.instrument_type(instrument_type_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ensemble_student ensemble_student_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble_student
    ADD CONSTRAINT ensemble_student_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ensemble ensemble_time_slot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble
    ADD CONSTRAINT ensemble_time_slot_id_fkey FOREIGN KEY (time_slot_id) REFERENCES public.time_slot(time_slot_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: group_lesson group_lesson_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT group_lesson_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: group_lesson group_lesson_instrument_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT group_lesson_instrument_type_id_fkey FOREIGN KEY (instrument_type_id) REFERENCES public.instrument_type(instrument_type_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: group_lesson group_lesson_skill_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT group_lesson_skill_level_id_fkey FOREIGN KEY (skill_level_id) REFERENCES public.skill_level(skill_level_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: group_lesson_student group_lesson_student_group_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson_student
    ADD CONSTRAINT group_lesson_student_group_lesson_id_fkey FOREIGN KEY (group_lesson_id) REFERENCES public.group_lesson(group_lesson_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: group_lesson_student group_lesson_student_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson_student
    ADD CONSTRAINT group_lesson_student_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: group_lesson group_lesson_time_slot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT group_lesson_time_slot_id_fkey FOREIGN KEY (time_slot_id) REFERENCES public.time_slot(time_slot_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: individual_lesson individual_lesson_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT individual_lesson_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: individual_lesson individual_lesson_instrument_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT individual_lesson_instrument_type_id_fkey FOREIGN KEY (instrument_type_id) REFERENCES public.instrument_type(instrument_type_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: individual_lesson individual_lesson_skill_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT individual_lesson_skill_level_id_fkey FOREIGN KEY (skill_level_id) REFERENCES public.skill_level(skill_level_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: individual_lesson individual_lesson_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT individual_lesson_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: individual_lesson individual_lesson_time_slot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT individual_lesson_time_slot_id_fkey FOREIGN KEY (time_slot_id) REFERENCES public.time_slot(time_slot_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: instructor_availability instructor_availability_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_availability
    ADD CONSTRAINT instructor_availability_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: instructor_instrument_type instructor_instrument_type_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instrument_type
    ADD CONSTRAINT instructor_instrument_type_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id);


--
-- Name: instructor_instrument_type instructor_instrument_type_instrument_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instrument_type
    ADD CONSTRAINT instructor_instrument_type_instrument_type_id_fkey FOREIGN KEY (instrument_type_id) REFERENCES public.instrument_type(instrument_type_id);


--
-- Name: instrument_lease instrument_lease_rentable_instrument_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_lease
    ADD CONSTRAINT instrument_lease_rentable_instrument_id_fkey FOREIGN KEY (rentable_instrument_id) REFERENCES public.rentable_instrument(rentable_instrument_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: instrument_lease instrument_lease_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_lease
    ADD CONSTRAINT instrument_lease_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lesson_price lesson_price_lesson_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_price
    ADD CONSTRAINT lesson_price_lesson_type_id_fkey FOREIGN KEY (lesson_type_id) REFERENCES public.lesson_type(lesson_type_id);


--
-- Name: lesson_price lesson_price_skill_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_price
    ADD CONSTRAINT lesson_price_skill_level_id_fkey FOREIGN KEY (skill_level_id) REFERENCES public.skill_level(skill_level_id);


--
-- Name: rentable_instrument rentable_instrument_instrument_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentable_instrument
    ADD CONSTRAINT rentable_instrument_instrument_brand_id_fkey FOREIGN KEY (instrument_brand_id) REFERENCES public.instrument_brand(instrument_brand_id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- Name: rentable_instrument rentable_instrument_instrument_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentable_instrument
    ADD CONSTRAINT rentable_instrument_instrument_type_id_fkey FOREIGN KEY (instrument_type_id) REFERENCES public.instrument_type(instrument_type_id);


--
-- Name: student_sibling student_sibling_student_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_sibling
    ADD CONSTRAINT student_sibling_student_1_fkey FOREIGN KEY (student_1) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: student_sibling student_sibling_student_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_sibling
    ADD CONSTRAINT student_sibling_student_2_fkey FOREIGN KEY (student_2) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: time_slot time_slot_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slot
    ADD CONSTRAINT time_slot_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

