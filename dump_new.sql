--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE superb;




--
-- Drop roles
--

DROP ROLE "user";


--
-- Roles
--

CREATE ROLE "user";
ALTER ROLE "user" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:HnczUoAdrEj9Fuqmwu96Gw==$/FqtBQcdDkcg5UfNuYvz51lyqvRxP0xqjHGl9zWHDIg=:PvLF7+fBPGWYq2Ueru/wYhUvCa+JmPpZmPkoIRG4s9w=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO "user";

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: user
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: user
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO "user";

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "superb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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
-- Name: superb; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE superb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE superb OWNER TO "user";

\connect superb

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
-- Name: Blog_blog; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Blog_blog" (
    id bigint NOT NULL,
    header character varying(64) NOT NULL,
    image character varying(100),
    description text,
    read_count integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id bigint NOT NULL,
    user_id bigint NOT NULL,
    description_az text,
    description_en text,
    header_az character varying(64),
    header_en character varying(64),
    slug character varying(50),
    CONSTRAINT "Blog_blog_read_count_check" CHECK ((read_count >= 0))
);


ALTER TABLE public."Blog_blog" OWNER TO "user";

--
-- Name: Blog_blog_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Blog_blog" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Blog_blog_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Blog_blogcategory; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Blog_blogcategory" (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    image character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name_az character varying(32),
    name_en character varying(32)
);


ALTER TABLE public."Blog_blogcategory" OWNER TO "user";

--
-- Name: Blog_blogcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Blog_blogcategory" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Blog_blogcategory_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Blog_blogcomment; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Blog_blogcomment" (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    email character varying(64) NOT NULL,
    comment text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    blog_id bigint,
    user_id bigint,
    comment_az text,
    comment_en text,
    name_az character varying(32),
    name_en character varying(32)
);


ALTER TABLE public."Blog_blogcomment" OWNER TO "user";

--
-- Name: Blog_blogcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Blog_blogcomment" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Blog_blogcomment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Core_aboutus; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Core_aboutus" (
    id bigint NOT NULL,
    address character varying(64) NOT NULL,
    email character varying(64) NOT NULL,
    phone character varying(16) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public."Core_aboutus" OWNER TO "user";

--
-- Name: Core_aboutus_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Core_aboutus" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Core_aboutus_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Core_contactus; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Core_contactus" (
    id bigint NOT NULL,
    first_name character varying(32) NOT NULL,
    email character varying(64) NOT NULL,
    company character varying(32),
    phone character varying(16) NOT NULL,
    address1 character varying(64) NOT NULL,
    address2 character varying(64),
    comment text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public."Core_contactus" OWNER TO "user";

--
-- Name: Core_contactus_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Core_contactus" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Core_contactus_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Core_social; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Core_social" (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    image character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    us_id bigint NOT NULL
);


ALTER TABLE public."Core_social" OWNER TO "user";

--
-- Name: Core_social_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Core_social" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Core_social_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Core_subscribeemail; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Core_subscribeemail" (
    id bigint NOT NULL,
    email character varying(60) NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public."Core_subscribeemail" OWNER TO "user";

--
-- Name: Core_subscribeemail_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Core_subscribeemail" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Core_subscribeemail_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Order_basket; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Order_basket" (
    id bigint NOT NULL,
    is_active boolean NOT NULL,
    total_price numeric(6,2),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public."Order_basket" OWNER TO "user";

--
-- Name: Order_basket_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Order_basket" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Order_basket_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Order_basketitem; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Order_basketitem" (
    id bigint NOT NULL,
    count integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    basket_id bigint,
    version_id bigint NOT NULL,
    size_id bigint,
    subtotal numeric(7,2),
    CONSTRAINT "Order_basketitem_count_check" CHECK ((count >= 0))
);


ALTER TABLE public."Order_basketitem" OWNER TO "user";

--
-- Name: Order_basketitem_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Order_basketitem" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Order_basketitem_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Order_wishlist; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Order_wishlist" (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id bigint,
    version_id bigint NOT NULL
);


ALTER TABLE public."Order_wishlist" OWNER TO "user";

--
-- Name: Order_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Order_wishlist" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Order_wishlist_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product_brand; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Product_brand" (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    image character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    admin_id bigint
);


ALTER TABLE public."Product_brand" OWNER TO "user";

--
-- Name: Product_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Product_brand" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Product_brand_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product_category; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Product_category" (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    image character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    parent_id bigint
);


ALTER TABLE public."Product_category" OWNER TO "user";

--
-- Name: Product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Product_category" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Product_category_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product_color; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Product_color" (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public."Product_color" OWNER TO "user";

--
-- Name: Product_color_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Product_color" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Product_color_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product_discount; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Product_discount" (
    id bigint NOT NULL,
    amount integer NOT NULL,
    is_percentage boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public."Product_discount" OWNER TO "user";

--
-- Name: Product_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Product_discount" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Product_discount_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product_product; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Product_product" (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    price numeric(5,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    brand_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public."Product_product" OWNER TO "user";

--
-- Name: Product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Product_product" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Product_product_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product_productversion; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Product_productversion" (
    id bigint NOT NULL,
    sell_price numeric(5,2),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    color_id bigint NOT NULL,
    product_id bigint NOT NULL,
    slug character varying(50),
    description text NOT NULL,
    raiting integer NOT NULL,
    CONSTRAINT "Product_productversion_raiting_check" CHECK ((raiting >= 0))
);


ALTER TABLE public."Product_productversion" OWNER TO "user";

--
-- Name: Product_productversion_discount; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Product_productversion_discount" (
    id bigint NOT NULL,
    productversion_id bigint NOT NULL,
    discount_id bigint NOT NULL
);


ALTER TABLE public."Product_productversion_discount" OWNER TO "user";

--
-- Name: Product_productversion_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Product_productversion_discount" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Product_productversion_discount_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product_productversion_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Product_productversion" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Product_productversion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product_productversiondetail; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Product_productversiondetail" (
    id bigint NOT NULL,
    count integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    size_id bigint NOT NULL,
    version_id bigint NOT NULL,
    CONSTRAINT "Product_productversiondetail_count_check" CHECK ((count >= 0))
);


ALTER TABLE public."Product_productversiondetail" OWNER TO "user";

--
-- Name: Product_productversiondetail_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Product_productversiondetail" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Product_productversiondetail_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product_size; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Product_size" (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public."Product_size" OWNER TO "user";

--
-- Name: Product_size_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Product_size" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Product_size_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product_versionimage; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Product_versionimage" (
    id bigint NOT NULL,
    image character varying(100),
    is_cover boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    version_id bigint NOT NULL
);


ALTER TABLE public."Product_versionimage" OWNER TO "user";

--
-- Name: Product_versionimage_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Product_versionimage" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Product_versionimage_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Product_versionreview; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."Product_versionreview" (
    id bigint NOT NULL,
    value integer NOT NULL,
    price integer NOT NULL,
    quality integer NOT NULL,
    review text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    version_id bigint NOT NULL,
    avarege_rating double precision,
    summary character varying(64) NOT NULL,
    user_id bigint NOT NULL,
    CONSTRAINT "Product_versionreview_price_check" CHECK ((price >= 0)),
    CONSTRAINT "Product_versionreview_quality_check" CHECK ((quality >= 0)),
    CONSTRAINT "Product_versionreview_value_check" CHECK ((value >= 0))
);


ALTER TABLE public."Product_versionreview" OWNER TO "user";

--
-- Name: Product_versionreview_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."Product_versionreview" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Product_versionreview_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: User_contactinformation; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."User_contactinformation" (
    id bigint NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    phone character varying(16) NOT NULL,
    address1 character varying(64) NOT NULL,
    address2 character varying(64),
    country character varying(16) NOT NULL,
    city character varying(64) NOT NULL,
    postal_code character varying(8),
    default_billing_address boolean NOT NULL,
    default_shipping_address boolean NOT NULL,
    user_id bigint,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public."User_contactinformation" OWNER TO "user";

--
-- Name: User_contactinformation_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."User_contactinformation" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."User_contactinformation_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: User_subsciriberemail; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."User_subsciriberemail" (
    id bigint NOT NULL,
    email character varying(64) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public."User_subsciriberemail" OWNER TO "user";

--
-- Name: User_subsciriberemail_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."User_subsciriberemail" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."User_subsciriberemail_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: User_user; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."User_user" (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    bio text,
    image character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public."User_user" OWNER TO "user";

--
-- Name: User_user_groups; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."User_user_groups" (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public."User_user_groups" OWNER TO "user";

--
-- Name: User_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."User_user_groups" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."User_user_groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: User_user_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."User_user" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."User_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: User_user_user_permissions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."User_user_user_permissions" (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public."User_user_user_permissions" OWNER TO "user";

--
-- Name: User_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public."User_user_user_permissions" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."User_user_user_permissions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "user";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "user";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "user";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: user
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


ALTER TABLE public.django_admin_log OWNER TO "user";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO "user";

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.django_celery_beat_clockedschedule ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_beat_clockedschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO "user";

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.django_celery_beat_crontabschedule ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_beat_crontabschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO "user";

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.django_celery_beat_intervalschedule ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_beat_intervalschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO "user";

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.django_celery_beat_periodictask ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_beat_periodictask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO "user";

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO "user";

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.django_celery_beat_solarschedule ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_beat_solarschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "user";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "user";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "user";

--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO "user";

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.social_auth_association ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO "user";

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.social_auth_code ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO "user";

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.social_auth_nonce ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO "user";

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.social_auth_partial ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.social_auth_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO "user";

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.social_auth_usersocialauth ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: Blog_blog; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Blog_blog" (id, header, image, description, read_count, created_at, updated_at, category_id, user_id, description_az, description_en, header_az, header_en, slug) FROM stdin;
5	Second Sport Blog	media/images/blogs/3pt022022_J3eACQb.webp	<p>It is my second sport blog and i am so excited about. Actually&nbsp; I am not that much <strong>excitet</strong>....</p>	61	2022-12-31 10:49:31.530896+00	2023-01-31 10:35:55.423351+00	1	1	\N	<p>It is my second sport blog and i am so excited about. Actually&nbsp; I am not that much <strong>excitet</strong>....</p>	\N	Second Sport Blog	second-sport-blog
4	For Sport Blog	media/images/blogs/1_6nLgVjORTZKjAq-vAV7Tig.jpeg	<p>Blog for sport</p>	42	2022-12-31 07:49:40.31299+00	2023-01-31 10:36:05.665072+00	1	1	\N	<p>Blog for sport</p>	\N	For Sport Blog	for-sport-blog
3	For Daily Blog	media/images/blogs/1_U_gOTyqATnUpc70KOG3flA_2sJn7xa.jpeg	<p>Random description for Daily blog. By the way it is being written with accompany of ibrahim tatlises</p>	60	2022-12-31 07:49:04.75942+00	2023-01-31 10:36:16.647677+00	2	1	\N	<p>Random description for Daily blog. By the way it is being written with accompany of ibrahim tatlises</p>	\N	For Daily Blog	for-daily-blog
\.


--
-- Data for Name: Blog_blogcategory; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Blog_blogcategory" (id, name, image, created_at, updated_at, name_az, name_en) FROM stdin;
2	Daily	images/blog_categories/1_U_gOTyqATnUpc70KOG3flA.jpeg	2022-12-30 11:46:10.938981+00	2022-12-30 11:46:10.938981+00	\N	Daily
1	Name for r_api post request 5	images/blog_categories/admin-photo1_rAML3Lj.jpg	2022-12-30 11:42:32.713213+00	2023-01-16 10:11:12.834422+00	\N	Name for r_api post request 5
\.


--
-- Data for Name: Blog_blogcomment; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Blog_blogcomment" (id, name, email, comment, created_at, updated_at, blog_id, user_id, comment_az, comment_en, name_az, name_en) FROM stdin;
40	shahan	sahan0020@gmail.com	Fidan	2023-01-08 13:11:10.804962+00	2023-01-08 13:11:10.804962+00	4	1	\N	Fidan	\N	shahan
41	shahan	sahan0020@gmail.com	<style>\r\n *{display:none}\r\n</style>	2023-01-09 14:26:50.45052+00	2023-01-09 14:26:50.45052+00	4	1	\N	<style>\r\n *{display:none}\r\n</style>	\N	shahan
\.


--
-- Data for Name: Core_aboutus; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Core_aboutus" (id, address, email, phone, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: Core_contactus; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Core_contactus" (id, first_name, email, company, phone, address1, address2, comment, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: Core_social; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Core_social" (id, name, image, created_at, updated_at, us_id) FROM stdin;
\.


--
-- Data for Name: Core_subscribeemail; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Core_subscribeemail" (id, email, is_active, created_at, updated_at) FROM stdin;
1	aliyevsahan@gmail.com	t	2023-01-27 18:40:32.548119+00	2023-01-27 18:40:32.548119+00
\.


--
-- Data for Name: Order_basket; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Order_basket" (id, is_active, total_price, created_at, updated_at, user_id) FROM stdin;
13	t	1267.50	2023-01-24 12:48:06.861034+00	2023-02-17 10:42:19.355119+00	1
\.


--
-- Data for Name: Order_basketitem; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Order_basketitem" (id, count, created_at, updated_at, basket_id, version_id, size_id, subtotal) FROM stdin;
273	4	2023-02-15 16:33:43.547386+00	2023-02-17 10:31:42.122101+00	13	6	7	1200.00
276	1	2023-02-17 10:42:17.950579+00	2023-02-17 10:42:17.950579+00	13	4	1	129.00
277	1	2023-02-17 10:42:19.345079+00	2023-02-17 10:42:19.345079+00	13	1	1	67.50
\.


--
-- Data for Name: Order_wishlist; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Order_wishlist" (id, created_at, updated_at, user_id, version_id) FROM stdin;
137	2023-02-15 12:22:21.614633+00	2023-02-15 12:22:21.614633+00	1	6
\.


--
-- Data for Name: Product_brand; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Product_brand" (id, name, image, created_at, updated_at, admin_id) FROM stdin;
2	Koton	images/brands/download.png	2023-01-08 17:05:47.022863+00	2023-01-08 17:06:17.436001+00	1
3	Bershka	images/brands/bershka.png	2023-01-08 17:06:26.643087+00	2023-01-08 17:06:26.643087+00	1
5	Zara	images/brands/zara.png	2023-01-08 17:06:45.660981+00	2023-01-08 17:06:45.660981+00	1
6	Defacto	images/brands/defacto1.png	2023-01-08 17:07:03.862489+00	2023-01-08 17:07:03.862489+00	1
7	The North Face	images/brands/northfacepng.png	2023-01-08 17:07:16.261957+00	2023-01-08 17:07:16.262936+00	1
4	Pull&Bear	images/brands/pullbear.png	2023-01-08 17:06:36.443277+00	2023-01-09 18:27:49.474758+00	1
\.


--
-- Data for Name: Product_category; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Product_category" (id, name, image, created_at, updated_at, parent_id) FROM stdin;
1	Man	images/categories/download.jpeg	2023-01-08 17:16:50.921546+00	2023-01-08 17:16:50.921546+00	\N
2	Woman	images/categories/woman.png	2023-01-08 17:17:01.832838+00	2023-01-08 17:17:01.832838+00	\N
3	Shoes	images/categories/man_shoes_cover.jpeg	2023-01-08 17:24:37.915247+00	2023-01-08 17:24:37.915247+00	1
4	Shoes	images/categories/womanshoes.jpeg	2023-01-08 17:24:49.918087+00	2023-01-08 17:24:49.918087+00	2
5	Sneaker	images/categories/man_shoes_sneaker.jpeg	2023-01-08 17:25:13.434083+00	2023-01-08 17:25:13.434083+00	3
6	Sneaker	images/categories/woman_sneaker.jpeg	2023-01-08 17:25:35.384145+00	2023-01-08 17:25:35.384145+00	4
7	Classic	images/categories/classic_man_shoes.jpeg	2023-01-08 17:25:52.503187+00	2023-01-08 17:25:52.503187+00	3
8	Classic	images/categories/classic_woman_shoes.jpeg	2023-01-08 17:26:13.436102+00	2023-01-08 17:26:13.436102+00	4
11	Trouesers	images/categories/man_trousers.jpeg	2023-01-09 06:48:21.287372+00	2023-01-09 06:48:21.287372+00	9
12	Trouesers	images/categories/woman_trousers.jpeg	2023-01-09 06:48:43.57577+00	2023-01-09 06:48:43.57577+00	10
13	Tshirt	images/categories/man_tshirt.jpeg	2023-01-09 06:49:16.303755+00	2023-01-09 06:49:16.304741+00	9
14	Tshirt	images/categories/woman_tshirt.jpeg	2023-01-09 06:50:42.370384+00	2023-01-09 06:50:42.370384+00	10
18	Hoodie	images/categories/woman_hoodie.jpeg	2023-01-09 06:52:01.246301+00	2023-01-09 06:52:01.246301+00	10
17	Hoodie	images/categories/man_hoodie.jpeg	2023-01-09 06:51:36.741764+00	2023-01-09 06:52:08.362707+00	9
19	Coat	images/categories/man_coat.jpeg	2023-01-09 06:52:52.45254+00	2023-01-09 06:52:52.45254+00	1
20	Coat	images/categories/woman_coat.jpeg	2023-01-09 06:54:02.065231+00	2023-01-09 06:54:02.065231+00	2
24	Skirt	images/categories/woman_skirt.jpeg	2023-01-09 06:56:38.487497+00	2023-01-09 06:56:38.487497+00	10
15	Shirt	images/categories/man_shirt.jpeg	2023-01-09 06:50:57.856318+00	2023-01-09 07:35:11.527487+00	9
16	Shirt	images/categories/woman_shirt.jpeg	2023-01-09 06:51:16.890964+00	2023-01-09 07:35:20.952441+00	10
9	Dress	images/categories/man_dress.jpeg	2023-01-09 06:46:09.118453+00	2023-01-09 07:35:35.049234+00	1
10	Dress	images/categories/dress_womanjpeg.jpeg	2023-01-09 06:47:47.782831+00	2023-01-09 07:35:58.587262+00	2
22	Raincoat	images/categories/man_raincoat.jpeg	2023-01-09 06:54:40.359806+00	2023-01-09 07:57:12.274815+00	19
25	Raincoat	images/categories/woman_raincoat_L2e3MSg.jpeg	2023-01-09 07:57:52.297942+00	2023-01-09 07:57:52.297942+00	20
\.


--
-- Data for Name: Product_color; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Product_color" (id, name, created_at, updated_at) FROM stdin;
1	Red	2023-01-08 17:10:12.120114+00	2023-01-08 17:10:12.120114+00
2	White	2023-01-08 17:10:16.889023+00	2023-01-08 17:10:16.889023+00
3	Blue	2023-01-08 17:10:20.372496+00	2023-01-08 17:10:20.372496+00
4	Green	2023-01-08 17:10:24.433062+00	2023-01-08 17:10:24.433062+00
5	Yellow	2023-01-08 17:10:28.057184+00	2023-01-08 17:10:28.057184+00
6	Gray	2023-01-08 17:10:33.211227+00	2023-01-08 17:10:33.211227+00
7	Black	2023-01-08 17:10:36.771646+00	2023-01-08 17:10:36.771646+00
8	Purple	2023-01-08 17:10:54.99582+00	2023-01-08 17:10:54.99582+00
9	Gray	2023-01-09 10:09:49.196212+00	2023-01-09 10:09:49.196212+00
\.


--
-- Data for Name: Product_discount; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Product_discount" (id, amount, is_percentage, created_at, updated_at) FROM stdin;
1	10	t	2023-01-09 09:16:32.699822+00	2023-01-09 09:16:32.699822+00
2	25	f	2023-01-09 09:16:41.769653+00	2023-01-09 09:16:41.769653+00
\.


--
-- Data for Name: Product_product; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Product_product" (id, name, price, created_at, updated_at, brand_id, category_id) FROM stdin;
3	Shirt	154.00	2023-01-09 10:07:22.248141+00	2023-01-09 10:07:22.248141+00	5	15
4	Sneaker	300.00	2023-01-09 10:11:28.85956+00	2023-01-09 10:58:26.553494+00	4	5
2	Tshirt	100.00	2023-01-09 08:33:46.15543+00	2023-01-09 11:00:05.644412+00	3	13
6	Try	111.00	2023-01-10 06:52:27.770281+00	2023-01-10 06:52:27.770281+00	4	3
\.


--
-- Data for Name: Product_productversion; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Product_productversion" (id, sell_price, created_at, updated_at, color_id, product_id, slug, description, raiting) FROM stdin;
5	275.00	2023-01-09 10:13:23.066534+00	2023-01-11 08:16:55.880314+00	2	4	pullbear-sneaker-white	There is no description, yet	60
6	300.00	2023-01-09 10:14:23.096673+00	2023-01-30 14:34:37.318291+00	4	4	pullbear-sneaker-green	There is no description, yet	100
1	67.50	2023-01-09 09:20:40.912723+00	2023-01-11 09:51:49.965878+00	2	2	bershka-tshirt-white	There is no description, yet	20
4	129.00	2023-01-09 10:10:54.521093+00	2023-01-11 10:14:02.041247+00	9	3	zara-shirt-gray	There is no description, yet	0
3	129.00	2023-01-09 10:09:31.34286+00	2023-01-11 10:14:09.883439+00	3	3	zara-shirt-blue	There is no description, yet	0
2	90.00	2023-01-09 09:28:06.17148+00	2023-01-11 12:32:08.630303+00	7	2	bershka-tshirt-black	There is no description, yet	20
\.


--
-- Data for Name: Product_productversion_discount; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Product_productversion_discount" (id, productversion_id, discount_id) FROM stdin;
2	2	1
3	3	2
4	4	2
6	5	2
48	1	2
49	1	1
\.


--
-- Data for Name: Product_productversiondetail; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Product_productversiondetail" (id, count, created_at, updated_at, size_id, version_id) FROM stdin;
1	10	2023-01-09 09:20:41.110745+00	2023-01-09 09:20:41.110745+00	1	1
2	10	2023-01-09 09:20:41.195702+00	2023-01-09 09:20:41.195702+00	2	1
3	10	2023-01-09 09:20:41.199623+00	2023-01-09 09:20:41.199623+00	3	1
4	10	2023-01-09 09:20:41.201761+00	2023-01-09 09:20:41.201761+00	6	1
5	10	2023-01-09 09:20:41.204177+00	2023-01-09 09:20:41.204177+00	4	1
6	10	2023-01-09 09:20:41.20639+00	2023-01-09 09:20:41.20639+00	5	1
7	10	2023-01-09 09:28:06.218427+00	2023-01-09 09:28:06.218427+00	1	2
8	10	2023-01-09 09:28:06.223875+00	2023-01-09 09:28:06.223875+00	2	2
9	10	2023-01-09 09:28:06.227508+00	2023-01-09 09:28:06.227508+00	6	2
10	10	2023-01-09 09:28:06.23094+00	2023-01-09 09:28:06.23094+00	3	2
11	10	2023-01-09 09:28:06.233976+00	2023-01-09 09:28:06.233976+00	4	2
12	10	2023-01-09 09:28:06.236161+00	2023-01-09 09:28:06.236161+00	5	2
13	10	2023-01-09 10:09:31.4077+00	2023-01-09 10:09:31.4077+00	1	3
14	10	2023-01-09 10:09:31.424146+00	2023-01-09 10:09:31.424146+00	2	3
15	10	2023-01-09 10:09:31.427471+00	2023-01-09 10:09:31.427471+00	6	3
16	10	2023-01-09 10:09:31.429353+00	2023-01-09 10:09:31.429353+00	3	3
17	10	2023-01-09 10:09:31.431277+00	2023-01-09 10:09:31.431277+00	4	3
18	10	2023-01-09 10:09:31.431277+00	2023-01-09 10:09:31.431277+00	5	3
19	10	2023-01-09 10:10:54.567986+00	2023-01-09 10:10:54.567986+00	1	4
20	10	2023-01-09 10:10:54.571666+00	2023-01-09 10:10:54.571666+00	2	4
21	10	2023-01-09 10:10:54.574398+00	2023-01-09 10:10:54.574398+00	6	4
22	10	2023-01-09 10:10:54.5769+00	2023-01-09 10:10:54.5769+00	3	4
23	10	2023-01-09 10:10:54.577945+00	2023-01-09 10:10:54.577945+00	4	4
24	10	2023-01-09 10:10:54.58072+00	2023-01-09 10:10:54.58072+00	5	4
25	10	2023-01-09 10:13:23.15734+00	2023-01-09 10:13:23.15734+00	7	5
26	10	2023-01-09 10:13:23.163076+00	2023-01-09 10:13:23.163076+00	8	5
27	10	2023-01-09 10:13:23.164885+00	2023-01-09 10:13:23.164885+00	9	5
28	10	2023-01-09 10:13:23.168046+00	2023-01-09 10:13:23.168046+00	10	5
29	10	2023-01-09 10:14:23.143042+00	2023-01-09 10:14:23.143042+00	7	6
30	10	2023-01-09 10:14:23.148779+00	2023-01-09 10:14:23.148779+00	8	6
32	10	2023-01-09 10:14:23.152363+00	2023-01-09 10:14:23.152363+00	10	6
33	10	2023-01-09 18:54:27.159843+00	2023-01-09 18:54:27.159843+00	9	6
\.


--
-- Data for Name: Product_size; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Product_size" (id, name, created_at, updated_at) FROM stdin;
1	XS	2023-01-08 17:07:55.081266+00	2023-01-08 17:07:55.081266+00
2	S	2023-01-08 17:07:57.166965+00	2023-01-08 17:07:57.166965+00
3	L	2023-01-08 17:08:03.871509+00	2023-01-08 17:08:03.871509+00
4	XL	2023-01-08 17:08:06.889579+00	2023-01-08 17:08:06.889579+00
5	XXL	2023-01-08 17:08:10.10211+00	2023-01-08 17:08:10.10211+00
6	M	2023-01-08 17:09:55.894555+00	2023-01-08 17:09:55.894555+00
7	39	2023-01-09 10:12:47.136466+00	2023-01-09 10:12:47.136466+00
8	40	2023-01-09 10:12:53.002605+00	2023-01-09 10:12:53.002605+00
9	41	2023-01-09 10:12:59.540834+00	2023-01-09 10:12:59.540834+00
10	42	2023-01-09 10:13:09.572102+00	2023-01-09 10:13:09.572102+00
\.


--
-- Data for Name: Product_versionimage; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Product_versionimage" (id, image, is_cover, created_at, updated_at, version_id) FROM stdin;
1	images/VersionImages/white_tshirt4.jpeg	f	2023-01-09 09:20:41.03303+00	2023-01-09 09:20:41.03303+00	1
2	images/VersionImages/white_tshirt3.jpeg	f	2023-01-09 09:20:41.095885+00	2023-01-09 09:20:41.095885+00	1
3	images/VersionImages/white_tshirt2.jpeg	f	2023-01-09 09:20:41.099826+00	2023-01-09 09:20:41.099826+00	1
4	images/VersionImages/white_tshirt.jpeg	t	2023-01-09 09:20:41.106486+00	2023-01-09 09:20:41.106486+00	1
5	images/VersionImages/black_tshirt.jpeg	f	2023-01-09 09:28:06.196102+00	2023-01-09 09:28:06.196102+00	2
6	images/VersionImages/black_tshirt2.jpeg	f	2023-01-09 09:28:06.203466+00	2023-01-09 09:28:06.203466+00	2
7	images/VersionImages/black_tshirt3jpeg.jpeg	t	2023-01-09 09:28:06.209362+00	2023-01-09 09:28:06.209362+00	2
8	images/VersionImages/black_tshirt4jpeg.jpeg	f	2023-01-09 09:28:06.216033+00	2023-01-09 09:28:06.216033+00	2
9	images/VersionImages/blue_shirt4.jpeg	f	2023-01-09 10:09:31.377462+00	2023-01-09 10:09:31.377462+00	3
10	images/VersionImages/blue_shirt3.jpeg	t	2023-01-09 10:09:31.395846+00	2023-01-09 10:09:31.395846+00	3
11	images/VersionImages/blue_shirt2.jpeg	f	2023-01-09 10:09:31.398875+00	2023-01-09 10:09:31.398875+00	3
12	images/VersionImages/blue_shirt1.jpeg	f	2023-01-09 10:09:31.404894+00	2023-01-09 10:09:31.404894+00	3
13	images/VersionImages/gray_shirt1.jpeg	f	2023-01-09 10:10:54.548899+00	2023-01-09 10:10:54.548899+00	4
14	images/VersionImages/gray_shirt2.jpeg	f	2023-01-09 10:10:54.552746+00	2023-01-09 10:10:54.552746+00	4
15	images/VersionImages/gray_shirt3.jpeg	f	2023-01-09 10:10:54.55946+00	2023-01-09 10:10:54.55946+00	4
16	images/VersionImages/gray_shirt4.jpeg	t	2023-01-09 10:10:54.565554+00	2023-01-09 10:10:54.565554+00	4
17	images/VersionImages/white_sneaker.jpeg	t	2023-01-09 10:13:23.133641+00	2023-01-09 10:13:23.133641+00	5
18	images/VersionImages/white_sneaker2.jpeg	f	2023-01-09 10:13:23.143257+00	2023-01-09 10:13:23.143257+00	5
19	images/VersionImages/white_sneaker3.jpeg	f	2023-01-09 10:13:23.145606+00	2023-01-09 10:13:23.145606+00	5
20	images/VersionImages/white_sneaker4.jpeg	f	2023-01-09 10:13:23.154553+00	2023-01-09 10:13:23.154553+00	5
21	images/VersionImages/green_sneaker1.jpeg	t	2023-01-09 10:14:23.121327+00	2023-01-09 10:14:23.121327+00	6
22	images/VersionImages/green_sneaker2.jpeg	f	2023-01-09 10:14:23.128977+00	2023-01-09 10:14:23.128977+00	6
23	images/VersionImages/green_sneaker3.jpeg	f	2023-01-09 10:14:23.135795+00	2023-01-09 10:14:23.135795+00	6
24	images/VersionImages/green_sneaker4.jpeg	f	2023-01-09 10:14:23.140049+00	2023-01-09 10:14:23.140049+00	6
\.


--
-- Data for Name: Product_versionreview; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Product_versionreview" (id, value, price, quality, review, created_at, updated_at, version_id, avarege_rating, summary, user_id) FROM stdin;
15	5	5	5	Just awesoome	2023-01-13 10:24:15.634997+00	2023-01-13 10:24:15.636+00	6	100	Perfectness	1
16	5	5	5	Just awesome	2023-01-13 10:40:26.280421+00	2023-01-13 10:40:26.280421+00	6	100	Awesome	1
17	5	5	5	My review for this product	2023-01-30 14:34:37.178961+00	2023-01-30 14:34:37.178961+00	6	100	Perfection	1
\.


--
-- Data for Name: User_contactinformation; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."User_contactinformation" (id, first_name, last_name, phone, address1, address2, country, city, postal_code, default_billing_address, default_shipping_address, user_id, created_at, updated_at) FROM stdin;
7	Shahan	Aliyev	+994709250020	Ganja 1	Baku 2	Az	Ganja	12458	t	t	1	2023-02-17 12:25:25.804066+00	2023-02-17 12:25:25.804066+00
\.


--
-- Data for Name: User_subsciriberemail; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."User_subsciriberemail" (id, email, created_at, updated_at) FROM stdin;
7	aliyevsahan@gmail.com	2023-01-27 15:43:50.623557+00	2023-01-27 15:43:50.623557+00
\.


--
-- Data for Name: User_user; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."User_user" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, bio, image, created_at, updated_at) FROM stdin;
36	!7wWOOr75hNI3MHNPyZhBMA0gaCW6S13n3mMnlI7D	2023-01-30 11:24:33.207334+00	f	shahan0020	Shahan	Aliyev	shahan0020@gmail.com	f	t	2023-01-30 11:24:33.139372+00	\N	default/admin-photo.jpg	2023-01-30 11:24:33.139372+00	2023-01-30 11:24:33.182579+00
37	!4eC2LrqzhVT5ua2BFm2vmFAQKYEdX0hkvUtxlY7N	2023-01-30 11:25:55.107109+00	f	aliyevsahan	┼₧ahan	╞Åliyev	aliyevsahan@gmail.com	f	t	2023-01-30 11:25:55.068896+00	\N	default/admin-photo.jpg	2023-01-30 11:25:55.068896+00	2023-01-30 11:25:55.090648+00
1	pbkdf2_sha256$390000$bgARMfRYJIUlGiBJwJuhBn$i5EPxFXHVC0BXISro1tBy8kJqsTGC4Jb8jAIQV4ZLxY=	2023-02-15 10:53:37.104005+00	t	shahan	Shahan	Aliyev	sahan0020@gmail.com	t	t	2022-12-30 10:40:50+00		default/admin-photo.jpg	2023-01-27 08:09:56.008134+00	2023-01-27 08:09:56.024349+00
\.


--
-- Data for Name: User_user_groups; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."User_user_groups" (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: User_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."User_user_user_permissions" (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: user
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
21	Can add blog	6	add_blog
22	Can change blog	6	change_blog
23	Can delete blog	6	delete_blog
24	Can view blog	6	view_blog
25	Can add blog category	7	add_blogcategory
26	Can change blog category	7	change_blogcategory
27	Can delete blog category	7	delete_blogcategory
28	Can view blog category	7	view_blogcategory
29	Can add blog comment	8	add_blogcomment
30	Can change blog comment	8	change_blogcomment
31	Can delete blog comment	8	delete_blogcomment
32	Can view blog comment	8	view_blogcomment
33	Can add about us	9	add_aboutus
34	Can change about us	9	change_aboutus
35	Can delete about us	9	delete_aboutus
36	Can view about us	9	view_aboutus
37	Can add contact us	10	add_contactus
38	Can change contact us	10	change_contactus
39	Can delete contact us	10	delete_contactus
40	Can view contact us	10	view_contactus
41	Can add subscribe email	11	add_subscribeemail
42	Can change subscribe email	11	change_subscribeemail
43	Can delete subscribe email	11	delete_subscribeemail
44	Can view subscribe email	11	view_subscribeemail
45	Can add social	12	add_social
46	Can change social	12	change_social
47	Can delete social	12	delete_social
48	Can view social	12	view_social
49	Can add basket	13	add_basket
50	Can change basket	13	change_basket
51	Can delete basket	13	delete_basket
52	Can view basket	13	view_basket
53	Can add basket item	14	add_basketitem
54	Can change basket item	14	change_basketitem
55	Can delete basket item	14	delete_basketitem
56	Can view basket item	14	view_basketitem
57	Can add wishlist	15	add_wishlist
58	Can change wishlist	15	change_wishlist
59	Can delete wishlist	15	delete_wishlist
60	Can view wishlist	15	view_wishlist
61	Can add brand	16	add_brand
62	Can change brand	16	change_brand
63	Can delete brand	16	delete_brand
64	Can view brand	16	view_brand
65	Can add category	17	add_category
66	Can change category	17	change_category
67	Can delete category	17	delete_category
68	Can view category	17	view_category
69	Can add color	18	add_color
70	Can change color	18	change_color
71	Can delete color	18	delete_color
72	Can view color	18	view_color
73	Can add discount	19	add_discount
74	Can change discount	19	change_discount
75	Can delete discount	19	delete_discount
76	Can view discount	19	view_discount
77	Can add product	20	add_product
78	Can change product	20	change_product
79	Can delete product	20	delete_product
80	Can view product	20	view_product
81	Can add product version	21	add_productversion
82	Can change product version	21	change_productversion
83	Can delete product version	21	delete_productversion
84	Can view product version	21	view_productversion
85	Can add size	22	add_size
86	Can change size	22	change_size
87	Can delete size	22	delete_size
88	Can view size	22	view_size
89	Can add version review	23	add_versionreview
90	Can change version review	23	change_versionreview
91	Can delete version review	23	delete_versionreview
92	Can view version review	23	view_versionreview
93	Can add version image	24	add_versionimage
94	Can change version image	24	change_versionimage
95	Can delete version image	24	delete_versionimage
96	Can view version image	24	view_versionimage
97	Can add product version detail	25	add_productversiondetail
98	Can change product version detail	25	change_productversiondetail
99	Can delete product version detail	25	delete_productversiondetail
100	Can view product version detail	25	view_productversiondetail
101	Can add user	26	add_user
102	Can change user	26	change_user
103	Can delete user	26	delete_user
104	Can view user	26	view_user
105	Can add contact information	27	add_contactinformation
106	Can change contact information	27	change_contactinformation
107	Can delete contact information	27	delete_contactinformation
108	Can view contact information	27	view_contactinformation
109	Can add subsciriber email	28	add_subsciriberemail
110	Can change subsciriber email	28	change_subsciriberemail
111	Can delete subsciriber email	28	delete_subsciriberemail
112	Can view subsciriber email	28	view_subsciriberemail
113	Can add crontab	29	add_crontabschedule
114	Can change crontab	29	change_crontabschedule
115	Can delete crontab	29	delete_crontabschedule
116	Can view crontab	29	view_crontabschedule
117	Can add interval	30	add_intervalschedule
118	Can change interval	30	change_intervalschedule
119	Can delete interval	30	delete_intervalschedule
120	Can view interval	30	view_intervalschedule
121	Can add periodic task	31	add_periodictask
122	Can change periodic task	31	change_periodictask
123	Can delete periodic task	31	delete_periodictask
124	Can view periodic task	31	view_periodictask
125	Can add periodic tasks	32	add_periodictasks
126	Can change periodic tasks	32	change_periodictasks
127	Can delete periodic tasks	32	delete_periodictasks
128	Can view periodic tasks	32	view_periodictasks
129	Can add solar event	33	add_solarschedule
130	Can change solar event	33	change_solarschedule
131	Can delete solar event	33	delete_solarschedule
132	Can view solar event	33	view_solarschedule
133	Can add clocked	34	add_clockedschedule
134	Can change clocked	34	change_clockedschedule
135	Can delete clocked	34	delete_clockedschedule
136	Can view clocked	34	view_clockedschedule
137	Can add association	35	add_association
138	Can change association	35	change_association
139	Can delete association	35	delete_association
140	Can view association	35	view_association
141	Can add code	36	add_code
142	Can change code	36	change_code
143	Can delete code	36	delete_code
144	Can view code	36	view_code
145	Can add nonce	37	add_nonce
146	Can change nonce	37	change_nonce
147	Can delete nonce	37	delete_nonce
148	Can view nonce	37	view_nonce
149	Can add user social auth	38	add_usersocialauth
150	Can change user social auth	38	change_usersocialauth
151	Can delete user social auth	38	delete_usersocialauth
152	Can view user social auth	38	view_usersocialauth
153	Can add partial	39	add_partial
154	Can change partial	39	change_partial
155	Can delete partial	39	delete_partial
156	Can view partial	39	view_partial
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-12-30 11:42:32.77478+00	1	Sport 1	1	[{"added": {}}]	7	1
2	2022-12-30 11:45:39.538989+00	1	Sport 1	2	[{"changed": {"fields": ["Image"]}}]	7	1
3	2022-12-30 11:45:51.324076+00	1	Sport 1	2	[{"changed": {"fields": ["Image"]}}]	7	1
4	2022-12-30 11:46:10.947942+00	2	Daily 2	1	[{"added": {}}]	7	1
5	2022-12-30 11:47:03.276977+00	1	1 1	1	[{"added": {}}]	6	1
6	2022-12-30 11:47:31.845678+00	2	1 2	1	[{"added": {}}]	6	1
7	2022-12-30 12:09:40.683168+00	1	shahan's blog - For Daily Blog	2	[{"changed": {"fields": ["Image"]}}]	6	1
8	2022-12-30 12:10:38.263636+00	1	aliyevsahan@gmail.com	2	[{"changed": {"fields": ["First name", "Last name"]}}]	26	1
9	2022-12-30 14:17:20.810469+00	1	Shahan's comment to 1	1	[{"added": {}}]	8	1
10	2022-12-30 15:06:50.781731+00	3	Shahan's comment to 3	3		8	1
11	2022-12-30 15:06:50.792742+00	2	Shahan's comment to 2	3		8	1
12	2022-12-30 15:06:50.79673+00	1	Shahan's comment to 1	3		8	1
13	2022-12-30 15:09:36.919205+00	7	Shahan's comment to 7	3		8	1
14	2022-12-30 15:09:36.939292+00	6	Shahan's comment to 6	3		8	1
15	2022-12-30 15:09:36.943292+00	5	Shahan's comment to 5	3		8	1
16	2022-12-30 15:09:36.946298+00	4	Shahan's comment to 4	3		8	1
17	2022-12-30 15:10:04.58226+00	9	Shahan's comment to 9	3		8	1
18	2022-12-30 15:10:04.594259+00	8	Shahan's comment to 8	3		8	1
19	2022-12-30 15:23:44.080463+00	13	Shahan's comment to 13	3		8	1
20	2022-12-30 15:23:44.095054+00	12	Shahan's comment to 12	3		8	1
21	2022-12-30 15:23:44.09805+00	11	Shahan's comment to 11	3		8	1
22	2022-12-30 15:23:44.101051+00	10	Shahan's comment to 10	3		8	1
23	2022-12-30 15:25:51.582447+00	17	Shahan's comment to 17	3		8	1
24	2022-12-30 15:25:51.603883+00	16	Shahan's comment to 16	3		8	1
25	2022-12-30 15:25:51.60825+00	15	Shahan's comment to 15	3		8	1
26	2022-12-30 15:25:51.612228+00	14	Shahan's comment to 14	3		8	1
27	2022-12-31 07:39:02.056019+00	21	Shahan's comment to 21	3		8	1
28	2022-12-31 07:39:02.104095+00	19	Shahan's comment to 19	3		8	1
29	2022-12-31 07:39:13.512335+00	23	None's comment to 23	3		8	1
30	2022-12-31 07:39:13.530742+00	22	None's comment to 22	3		8	1
31	2022-12-31 07:39:54.412728+00	18	Shahan's comment to 18	2	[{"changed": {"fields": ["Comment"]}}]	8	1
32	2022-12-31 07:40:35.602028+00	1	shahan's blog - For Daily Blog	2	[{"changed": {"fields": ["Description"]}}]	6	1
33	2022-12-31 07:44:31.971326+00	2	shahan's blog - For Sport Blog	3		6	1
34	2022-12-31 07:44:32.031006+00	1	shahan's blog - For Daily Blog	3		6	1
35	2022-12-31 07:49:04.780865+00	3	shahan's blog - For Daily Blog	1	[{"added": {}}]	6	1
36	2022-12-31 07:49:40.317948+00	4	shahan's blog - For Sport Blog	1	[{"added": {}}]	6	1
37	2022-12-31 10:10:33.565598+00	27	shahan's comment to 27	3		8	1
38	2022-12-31 10:10:33.585324+00	26	dawd's comment to 26	3		8	1
39	2022-12-31 10:10:33.589326+00	25	Arif's comment to 25	3		8	1
40	2022-12-31 10:10:33.592326+00	24	Shahan's comment to 24	3		8	1
41	2022-12-31 10:49:31.536578+00	5	shahan's blog - Second Sport Blog	1	[{"added": {}}]	6	1
42	2023-01-01 07:16:45.906265+00	5	shahan's blog - Second Sport Blog	2	[{"changed": {"fields": ["Description"]}}]	6	1
43	2023-01-01 07:18:39.771992+00	5	shahan's blog - Second Sport Blog	2	[{"changed": {"fields": ["Description"]}}]	6	1
44	2023-01-01 07:25:17.364702+00	29	shahan's comment to 29	3		8	1
45	2023-01-01 08:00:15.900636+00	30	shahan's comment to 30	2	[{"changed": {"fields": ["Comment"]}}]	8	1
46	2023-01-01 08:38:29.364291+00	31	Arif's comment to 31	3		8	1
47	2023-01-03 08:53:42.418116+00	36	shahan's comment to 36	3		8	1
48	2023-01-03 08:53:42.467503+00	35	Shahan's comment to 35	3		8	1
49	2023-01-03 08:53:42.472834+00	34	shahan's comment to 34	3		8	1
50	2023-01-03 08:53:42.479561+00	33	S╔Önan's comment to 33	3		8	1
51	2023-01-03 08:53:42.48326+00	32	Kanan's comment to 32	3		8	1
52	2023-01-03 08:53:42.491293+00	30	shahan's comment to 30	3		8	1
53	2023-01-03 08:53:42.496613+00	28	shahan's comment to 28	3		8	1
54	2023-01-03 08:55:16.662696+00	37	shahan's comment to 37	3		8	1
55	2023-01-03 08:55:45.193138+00	38	shahan's comment to 38	3		8	1
56	2023-01-03 08:57:20.36162+00	39	shahan's comment to 39	2	[{"changed": {"fields": ["Comment"]}}]	8	1
57	2023-01-03 08:57:50.992346+00	39	shahan's comment to 39	3		8	1
58	2023-01-07 06:33:19.287835+00	2	aliyev@gmail.com	3		26	1
59	2023-01-07 06:33:19.364963+00	3	aliyevv@gmail.com	3		26	1
60	2023-01-07 06:41:34.869849+00	4	aliyevv@gmail.com	3		26	1
61	2023-01-07 06:41:34.925933+00	5	aliyevshiki@gmail.com	3		26	1
62	2023-01-07 08:15:34.297345+00	6	aliyev@gmail.com	2	[{"changed": {"fields": ["password"]}}]	26	1
63	2023-01-07 08:26:53.311913+00	7	aliyevarif@gmail.com	3		26	1
64	2023-01-07 08:26:53.382389+00	6	aliyev@gmail.com	3		26	1
65	2023-01-07 12:06:53.724368+00	10	aaaliyev	3		26	1
66	2023-01-07 12:06:53.735402+00	9	aaliyev	3		26	1
67	2023-01-07 12:06:53.739454+00	8	shahan01	3		26	1
68	2023-01-07 14:37:35.200361+00	11	arif	3		26	1
69	2023-01-07 14:38:01.358615+00	1	shahan	2	[{"changed": {"fields": ["Email address"]}}]	26	1
70	2023-01-07 14:41:29.531231+00	12	shahan01	3		26	1
71	2023-01-07 14:45:20.356379+00	13	shahan01	3		26	1
72	2023-01-07 14:46:10.868598+00	14	shahan01	3		26	1
73	2023-01-07 15:07:36.276508+00	15	shahan01	3		26	1
74	2023-01-07 15:13:28.509829+00	16	shahan01	3		26	1
75	2023-01-07 15:37:07.7109+00	17	shahan01	3		26	1
76	2023-01-08 05:17:56.25465+00	18	shahan01	3		26	1
77	2023-01-08 05:20:00.256669+00	19	shahan01	3		26	1
78	2023-01-08 05:25:12.468106+00	20	shahan01	3		26	1
79	2023-01-08 06:08:09.942153+00	21	shahan01	3		26	1
80	2023-01-08 06:08:34.650411+00	22	shahan01	3		26	1
81	2023-01-08 06:09:06.215938+00	23	shahan01	3		26	1
82	2023-01-08 06:11:46.951168+00	24	shahan01	3		26	1
83	2023-01-08 06:12:14.742714+00	25	shahan01	3		26	1
84	2023-01-08 06:13:18.950188+00	26	shahan01	3		26	1
85	2023-01-08 06:14:39.073669+00	27	shahan01	3		26	1
86	2023-01-08 06:20:37.636298+00	28	shahan01	3		26	1
87	2023-01-08 06:24:30.967799+00	29	shahan01	3		26	1
88	2023-01-08 07:57:00.703131+00	30	shahan01	3		26	1
89	2023-01-08 07:58:45.184795+00	31	shahan01	3		26	1
90	2023-01-08 11:22:34.666954+00	32	shahan01	2	[{"changed": {"fields": ["Active"]}}]	26	1
91	2023-01-08 11:27:41.459455+00	32	shahan01	3		26	1
92	2023-01-08 11:30:55.78625+00	33	shahan01	3		26	1
93	2023-01-08 13:19:13.919439+00	1	Koton 1	1	[{"added": {}}]	16	1
94	2023-01-08 13:26:04.66888+00	1	Koton 1	3		16	1
95	2023-01-08 17:05:47.046023+00	2	Koton 2	1	[{"added": {}}]	16	1
96	2023-01-08 17:06:17.440977+00	2	Koton 2	2	[]	16	1
97	2023-01-08 17:06:26.646086+00	3	Bershka 3	1	[{"added": {}}]	16	1
98	2023-01-08 17:06:36.448254+00	4	Pull & Bear 4	1	[{"added": {}}]	16	1
99	2023-01-08 17:06:45.664683+00	5	Zara 5	1	[{"added": {}}]	16	1
100	2023-01-08 17:07:03.865494+00	6	Defacto 6	1	[{"added": {}}]	16	1
101	2023-01-08 17:07:16.265711+00	7	The North Face 7	1	[{"added": {}}]	16	1
102	2023-01-08 17:07:55.092264+00	1	XS	1	[{"added": {}}]	22	1
103	2023-01-08 17:07:57.168969+00	2	S	1	[{"added": {}}]	22	1
104	2023-01-08 17:08:03.874482+00	3	L	1	[{"added": {}}]	22	1
105	2023-01-08 17:08:06.893582+00	4	XL	1	[{"added": {}}]	22	1
106	2023-01-08 17:08:10.105458+00	5	XXL	1	[{"added": {}}]	22	1
107	2023-01-08 17:09:55.897519+00	6	M	1	[{"added": {}}]	22	1
108	2023-01-08 17:10:12.133087+00	1	Red	1	[{"added": {}}]	18	1
109	2023-01-08 17:10:16.893022+00	2	White	1	[{"added": {}}]	18	1
110	2023-01-08 17:10:20.375492+00	3	Blue	1	[{"added": {}}]	18	1
111	2023-01-08 17:10:24.436021+00	4	Green	1	[{"added": {}}]	18	1
112	2023-01-08 17:10:28.060208+00	5	Yellow	1	[{"added": {}}]	18	1
113	2023-01-08 17:10:33.214189+00	6	Gray	1	[{"added": {}}]	18	1
114	2023-01-08 17:10:36.774646+00	7	Black	1	[{"added": {}}]	18	1
115	2023-01-08 17:10:54.998794+00	8	Purple	1	[{"added": {}}]	18	1
116	2023-01-08 17:16:50.943792+00	1	Man 1	1	[{"added": {}}]	17	1
117	2023-01-08 17:17:01.840855+00	2	Woman 2	1	[{"added": {}}]	17	1
118	2023-01-08 17:24:37.915778+00	3	Shoes 3	1	[{"added": {}}]	17	1
119	2023-01-08 17:24:49.920026+00	4	Shoes 4	1	[{"added": {}}]	17	1
120	2023-01-08 17:25:13.434083+00	5	Sneaker 5	1	[{"added": {}}]	17	1
121	2023-01-08 17:25:35.392515+00	6	Sneaker 6	1	[{"added": {}}]	17	1
122	2023-01-08 17:25:52.503187+00	7	Classic 7	1	[{"added": {}}]	17	1
123	2023-01-08 17:26:13.436603+00	8	Classic 8	1	[{"added": {}}]	17	1
124	2023-01-09 06:46:09.133798+00	9	Dresses Man None	1	[{"added": {}}]	17	1
125	2023-01-09 06:47:47.784829+00	10	Dresses Woman None	1	[{"added": {}}]	17	1
126	2023-01-09 06:48:21.29037+00	11	Trouesers Dresses Man None	1	[{"added": {}}]	17	1
127	2023-01-09 06:48:43.579807+00	12	Trouesers Dresses Woman None	1	[{"added": {}}]	17	1
128	2023-01-09 06:49:16.307734+00	13	Tshirt Dresses Man None	1	[{"added": {}}]	17	1
129	2023-01-09 06:50:42.374367+00	14	Tshirt Dresses Woman None	1	[{"added": {}}]	17	1
130	2023-01-09 06:50:57.860324+00	15	Shirts Dresses Man None	1	[{"added": {}}]	17	1
131	2023-01-09 06:51:16.894964+00	16	Shirts Dresses Woman None	1	[{"added": {}}]	17	1
132	2023-01-09 06:51:36.745769+00	17	Hoddie Dresses Man None	1	[{"added": {}}]	17	1
133	2023-01-09 06:52:01.250303+00	18	Hoodie Dresses Woman None	1	[{"added": {}}]	17	1
134	2023-01-09 06:52:08.372722+00	17	Hoodie Dresses Man None	2	[{"changed": {"fields": ["Name"]}}]	17	1
135	2023-01-09 06:52:52.454537+00	19	Coat Man None	1	[{"added": {}}]	17	1
136	2023-01-09 06:54:02.06723+00	20	Coat Woman None	1	[{"added": {}}]	17	1
137	2023-01-09 06:54:27.17768+00	21	Coat Woman None	1	[{"added": {}}]	17	1
138	2023-01-09 06:54:40.364074+00	22	Raincoat Coat Woman None	1	[{"added": {}}]	17	1
139	2023-01-09 06:55:05.958489+00	23	Raincoat Coat Woman None	1	[{"added": {}}]	17	1
140	2023-01-09 06:56:38.490497+00	24	Skirt Dresses Woman None	1	[{"added": {}}]	17	1
141	2023-01-09 07:35:11.546231+00	15	Shirt Dresses Man None	2	[{"changed": {"fields": ["Name"]}}]	17	1
142	2023-01-09 07:35:20.964155+00	16	Shirt Dresses Woman None	2	[{"changed": {"fields": ["Name"]}}]	17	1
143	2023-01-09 07:35:35.056502+00	9	Dress Man None	2	[{"changed": {"fields": ["Name"]}}]	17	1
144	2023-01-09 07:35:58.592288+00	10	Dress Woman None	2	[{"changed": {"fields": ["Name"]}}]	17	1
145	2023-01-09 07:57:12.284193+00	22	Raincoat Coat Man None	2	[{"changed": {"fields": ["Parent"]}}]	17	1
146	2023-01-09 07:57:24.27373+00	21	Coat Woman None	3		17	1
147	2023-01-09 07:57:52.315813+00	25	Raincoat Coat Woman None	1	[{"added": {}}]	17	1
148	2023-01-09 08:30:44.568194+00	1	Tshirt 1	1	[{"added": {}}]	20	1
149	2023-01-09 08:33:46.158427+00	2	Tshirt 2	1	[{"added": {}}]	20	1
150	2023-01-09 09:16:32.727725+00	1	1	1	[{"added": {}}]	19	1
151	2023-01-09 09:16:41.777177+00	2	2	1	[{"added": {}}]	19	1
152	2023-01-09 09:20:41.218784+00	1	White Tshirt	1	[{"added": {}}, {"added": {"name": "version image", "object": "1's image 1"}}, {"added": {"name": "version image", "object": "1's image 2"}}, {"added": {"name": "version image", "object": "1's image 3"}}, {"added": {"name": "version image", "object": "1's image 4"}}, {"added": {"name": "product version detail", "object": "Tshirt's details XS 10"}}, {"added": {"name": "product version detail", "object": "Tshirt's details S 10"}}, {"added": {"name": "product version detail", "object": "Tshirt's details L 10"}}, {"added": {"name": "product version detail", "object": "Tshirt's details M 10"}}, {"added": {"name": "product version detail", "object": "Tshirt's details XL 10"}}, {"added": {"name": "product version detail", "object": "Tshirt's details XXL 10"}}]	21	1
153	2023-01-09 09:28:06.238576+00	2	Black Tshirt	1	[{"added": {}}, {"added": {"name": "version image", "object": "Black Tshirt's image 5"}}, {"added": {"name": "version image", "object": "Black Tshirt's image 6"}}, {"added": {"name": "version image", "object": "Black Tshirt's image 7"}}, {"added": {"name": "version image", "object": "Black Tshirt's image 8"}}, {"added": {"name": "product version detail", "object": "Black Tshirt's details XS 10"}}, {"added": {"name": "product version detail", "object": "Black Tshirt's details S 10"}}, {"added": {"name": "product version detail", "object": "Black Tshirt's details M 10"}}, {"added": {"name": "product version detail", "object": "Black Tshirt's details L 10"}}, {"added": {"name": "product version detail", "object": "Black Tshirt's details XL 10"}}, {"added": {"name": "product version detail", "object": "Black Tshirt's details XXL 10"}}]	21	1
154	2023-01-09 10:06:50.886572+00	1	Tshirt 1	3		20	1
155	2023-01-09 10:07:22.266057+00	3	Shirt 3	1	[{"added": {}}]	20	1
210	2023-01-09 11:20:19.092984+00	1	White Tshirt	2	[]	21	1
211	2023-01-09 11:20:52.690744+00	1	White Tshirt	2	[]	21	1
212	2023-01-09 11:22:17.722401+00	1	White Tshirt	2	[]	21	1
213	2023-01-09 11:25:25.189942+00	1	White Tshirt	2	[]	21	1
156	2023-01-09 10:09:31.435886+00	3	Blue Shirt	1	[{"added": {}}, {"added": {"name": "version image", "object": "Blue Shirt's image 9"}}, {"added": {"name": "version image", "object": "Blue Shirt's image 10"}}, {"added": {"name": "version image", "object": "Blue Shirt's image 11"}}, {"added": {"name": "version image", "object": "Blue Shirt's image 12"}}, {"added": {"name": "product version detail", "object": "Blue Shirt's details XS 10"}}, {"added": {"name": "product version detail", "object": "Blue Shirt's details S 10"}}, {"added": {"name": "product version detail", "object": "Blue Shirt's details M 10"}}, {"added": {"name": "product version detail", "object": "Blue Shirt's details L 10"}}, {"added": {"name": "product version detail", "object": "Blue Shirt's details XL 10"}}, {"added": {"name": "product version detail", "object": "Blue Shirt's details XXL 10"}}]	21	1
157	2023-01-09 10:09:49.218711+00	9	Gray	1	[{"added": {}}]	18	1
158	2023-01-09 10:10:54.582505+00	4	Gray Shirt	1	[{"added": {}}, {"added": {"name": "version image", "object": "Gray Shirt's image 13"}}, {"added": {"name": "version image", "object": "Gray Shirt's image 14"}}, {"added": {"name": "version image", "object": "Gray Shirt's image 15"}}, {"added": {"name": "version image", "object": "Gray Shirt's image 16"}}, {"added": {"name": "product version detail", "object": "Gray Shirt's details XS 10"}}, {"added": {"name": "product version detail", "object": "Gray Shirt's details S 10"}}, {"added": {"name": "product version detail", "object": "Gray Shirt's details M 10"}}, {"added": {"name": "product version detail", "object": "Gray Shirt's details L 10"}}, {"added": {"name": "product version detail", "object": "Gray Shirt's details XL 10"}}, {"added": {"name": "product version detail", "object": "Gray Shirt's details XXL 10"}}]	21	1
159	2023-01-09 10:11:28.867321+00	4	Sneaker 4	1	[{"added": {}}]	20	1
160	2023-01-09 10:12:47.159857+00	7	39	1	[{"added": {}}]	22	1
161	2023-01-09 10:12:53.012997+00	8	40	1	[{"added": {}}]	22	1
162	2023-01-09 10:12:59.549978+00	9	41	1	[{"added": {}}]	22	1
163	2023-01-09 10:13:09.580907+00	10	42	1	[{"added": {}}]	22	1
164	2023-01-09 10:13:23.170185+00	5	White Sneaker	1	[{"added": {}}, {"added": {"name": "version image", "object": "White Sneaker's image 17"}}, {"added": {"name": "version image", "object": "White Sneaker's image 18"}}, {"added": {"name": "version image", "object": "White Sneaker's image 19"}}, {"added": {"name": "version image", "object": "White Sneaker's image 20"}}, {"added": {"name": "product version detail", "object": "White Sneaker's details 39 10"}}, {"added": {"name": "product version detail", "object": "White Sneaker's details 40 10"}}, {"added": {"name": "product version detail", "object": "White Sneaker's details 41 10"}}, {"added": {"name": "product version detail", "object": "White Sneaker's details 42 10"}}]	21	1
165	2023-01-09 10:14:23.154058+00	6	Green Sneaker	1	[{"added": {}}, {"added": {"name": "version image", "object": "Green Sneaker's image 21"}}, {"added": {"name": "version image", "object": "Green Sneaker's image 22"}}, {"added": {"name": "version image", "object": "Green Sneaker's image 23"}}, {"added": {"name": "version image", "object": "Green Sneaker's image 24"}}, {"added": {"name": "product version detail", "object": "Green Sneaker's details 39 10"}}, {"added": {"name": "product version detail", "object": "Green Sneaker's details 40 10"}}, {"added": {"name": "product version detail", "object": "Green Sneaker's details 41 10"}}, {"added": {"name": "product version detail", "object": "Green Sneaker's details 42 10"}}]	21	1
166	2023-01-09 10:38:10.745557+00	6	Green Sneaker	2	[]	21	1
167	2023-01-09 10:38:35.973352+00	6	Green Sneaker	2	[]	21	1
168	2023-01-09 10:39:05.091872+00	6	Green Sneaker	2	[]	21	1
169	2023-01-09 10:39:16.807635+00	5	White Sneaker	2	[]	21	1
170	2023-01-09 10:39:22.76359+00	4	Gray Shirt	2	[]	21	1
171	2023-01-09 10:39:28.181533+00	4	Gray Shirt	2	[]	21	1
172	2023-01-09 10:39:34.386699+00	3	Blue Shirt	2	[]	21	1
173	2023-01-09 10:39:40.274917+00	2	Black Tshirt	2	[]	21	1
174	2023-01-09 10:39:45.879846+00	1	White Tshirt	2	[]	21	1
175	2023-01-09 10:56:06.769462+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
176	2023-01-09 10:56:24.229245+00	5	White Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
177	2023-01-09 10:57:02.811348+00	4	Gray Shirt	2	[]	21	1
178	2023-01-09 10:57:08.740287+00	6	Green Sneaker	2	[]	21	1
179	2023-01-09 10:57:18.094961+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
180	2023-01-09 10:57:29.742043+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
181	2023-01-09 10:57:39.382164+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
182	2023-01-09 10:57:47.924372+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
183	2023-01-09 10:58:26.556492+00	4	Sneaker 4	2	[{"changed": {"fields": ["Price"]}}]	20	1
184	2023-01-09 10:58:37.180233+00	6	Green Sneaker	2	[]	21	1
185	2023-01-09 10:58:47.642183+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
186	2023-01-09 10:59:02.871782+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
187	2023-01-09 10:59:15.500531+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
188	2023-01-09 10:59:20.880983+00	6	Green Sneaker	2	[]	21	1
189	2023-01-09 11:00:05.646413+00	2	Tshirt 2	2	[{"changed": {"fields": ["Price"]}}]	20	1
190	2023-01-09 11:00:25.067736+00	1	White Tshirt	2	[]	21	1
191	2023-01-09 11:00:36.52141+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
192	2023-01-09 11:00:42.256935+00	1	White Tshirt	2	[]	21	1
193	2023-01-09 11:01:33.198478+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
194	2023-01-09 11:01:39.467693+00	1	White Tshirt	2	[]	21	1
195	2023-01-09 11:02:24.250249+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
196	2023-01-09 11:02:30.470571+00	1	White Tshirt	2	[]	21	1
197	2023-01-09 11:02:37.106396+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
198	2023-01-09 11:02:46.804264+00	1	White Tshirt	2	[]	21	1
199	2023-01-09 11:04:21.318477+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
200	2023-01-09 11:04:29.784233+00	1	White Tshirt	2	[]	21	1
201	2023-01-09 11:04:38.168151+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
202	2023-01-09 11:08:43.944325+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
203	2023-01-09 11:08:48.303353+00	1	White Tshirt	2	[]	21	1
204	2023-01-09 11:08:54.882207+00	1	White Tshirt	2	[]	21	1
205	2023-01-09 11:09:01.228005+00	1	White Tshirt	2	[]	21	1
206	2023-01-09 11:18:05.182412+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount", "Sell price"]}}]	21	1
207	2023-01-09 11:18:11.773891+00	1	White Tshirt	2	[]	21	1
208	2023-01-09 11:19:40.381312+00	1	White Tshirt	2	[]	21	1
209	2023-01-09 11:20:13.578402+00	1	White Tshirt	2	[]	21	1
214	2023-01-09 11:25:52.695566+00	1	White Tshirt	2	[]	21	1
215	2023-01-09 11:28:52.048927+00	1	White Tshirt	2	[]	21	1
216	2023-01-09 11:29:14.631711+00	1	White Tshirt	2	[]	21	1
217	2023-01-09 11:30:16.444198+00	1	White Tshirt	2	[]	21	1
218	2023-01-09 11:30:26.650959+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
219	2023-01-09 11:30:33.416052+00	1	White Tshirt	2	[]	21	1
220	2023-01-09 11:30:49.225403+00	1	White Tshirt	2	[]	21	1
221	2023-01-09 11:30:57.345109+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
222	2023-01-09 11:31:03.375968+00	1	White Tshirt	2	[]	21	1
223	2023-01-09 11:32:46.132016+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
224	2023-01-09 11:32:53.05167+00	1	White Tshirt	2	[]	21	1
225	2023-01-09 11:33:02.704013+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
226	2023-01-09 11:33:09.822525+00	1	White Tshirt	2	[]	21	1
227	2023-01-09 11:36:12.720781+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
228	2023-01-09 11:36:20.422998+00	1	White Tshirt	2	[]	21	1
229	2023-01-09 11:36:28.388107+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
230	2023-01-09 11:36:34.759603+00	1	White Tshirt	2	[]	21	1
231	2023-01-09 11:36:42.833971+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
232	2023-01-09 11:36:57.685402+00	1	White Tshirt	2	[]	21	1
233	2023-01-09 11:37:04.308337+00	1	White Tshirt	2	[]	21	1
234	2023-01-09 11:37:17.220003+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
235	2023-01-09 11:37:23.798033+00	1	White Tshirt	2	[]	21	1
236	2023-01-09 12:15:59.083966+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
237	2023-01-09 12:16:06.696802+00	6	Green Sneaker	2	[]	21	1
238	2023-01-09 12:16:13.973912+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
239	2023-01-09 12:16:19.269936+00	6	Green Sneaker	2	[]	21	1
240	2023-01-09 12:16:30.94834+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
241	2023-01-09 12:16:39.282149+00	6	Green Sneaker	2	[]	21	1
242	2023-01-09 12:16:52.441364+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
243	2023-01-09 12:16:58.43327+00	6	Green Sneaker	2	[]	21	1
244	2023-01-09 12:17:08.777403+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
245	2023-01-09 12:17:15.014501+00	6	Green Sneaker	2	[]	21	1
246	2023-01-09 12:22:09.976402+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
247	2023-01-09 12:22:16.310114+00	1	White Tshirt	2	[]	21	1
248	2023-01-09 12:22:29.04093+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
249	2023-01-09 12:22:33.367358+00	1	White Tshirt	2	[]	21	1
250	2023-01-09 12:22:40.535796+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
251	2023-01-09 12:22:45.706144+00	1	White Tshirt	2	[]	21	1
252	2023-01-09 12:22:55.820477+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
253	2023-01-09 12:23:01.537938+00	1	White Tshirt	2	[]	21	1
254	2023-01-09 12:25:09.761638+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
255	2023-01-09 12:25:14.487232+00	1	White Tshirt	2	[]	21	1
256	2023-01-09 12:25:21.39166+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
257	2023-01-09 12:25:25.747057+00	1	White Tshirt	2	[]	21	1
258	2023-01-09 12:42:01.61488+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
259	2023-01-09 12:42:08.05948+00	1	White Tshirt	2	[]	21	1
260	2023-01-09 12:42:13.781634+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
261	2023-01-09 12:42:18.881082+00	1	White Tshirt	2	[]	21	1
262	2023-01-09 12:42:26.029232+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
263	2023-01-09 12:42:29.253669+00	1	White Tshirt	2	[]	21	1
264	2023-01-09 12:56:44.517777+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
265	2023-01-09 12:56:48.550703+00	1	White Tshirt	2	[]	21	1
266	2023-01-09 12:56:54.683165+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
267	2023-01-09 12:56:58.636462+00	1	White Tshirt	2	[]	21	1
268	2023-01-09 12:57:35.437129+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
269	2023-01-09 12:57:39.75473+00	1	White Tshirt	2	[]	21	1
270	2023-01-09 12:57:46.145292+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
271	2023-01-09 12:57:50.933133+00	1	White Tshirt	2	[]	21	1
272	2023-01-09 13:14:49.172115+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
273	2023-01-09 13:15:05.417069+00	1	White Tshirt	2	[]	21	1
274	2023-01-09 13:15:14.531363+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
275	2023-01-09 13:15:22.031467+00	1	White Tshirt	2	[]	21	1
276	2023-01-09 13:15:39.415715+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
277	2023-01-09 13:15:47.915841+00	1	White Tshirt	2	[]	21	1
278	2023-01-09 13:16:28.299518+00	1	White Tshirt	2	[]	21	1
279	2023-01-09 13:16:45.583764+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
280	2023-01-09 13:16:53.312108+00	1	White Tshirt	2	[]	21	1
281	2023-01-09 13:17:06.444703+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
282	2023-01-09 13:17:12.774675+00	1	White Tshirt	2	[]	21	1
283	2023-01-09 13:18:02.512299+00	1	White Tshirt	2	[]	21	1
284	2023-01-09 13:18:24.199019+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
285	2023-01-09 13:18:39.699846+00	1	White Tshirt	2	[]	21	1
286	2023-01-09 13:19:16.336455+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
287	2023-01-09 13:19:26.564078+00	1	White Tshirt	2	[]	21	1
288	2023-01-09 13:19:44.492021+00	1	White Tshirt	2	[{"changed": {"fields": ["Slug"]}}]	21	1
289	2023-01-09 13:23:54.753003+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
290	2023-01-09 13:24:00.015757+00	1	White Tshirt	2	[]	21	1
291	2023-01-09 13:24:05.321438+00	1	White Tshirt	2	[]	21	1
292	2023-01-09 13:24:31.884082+00	1	White Tshirt	2	[]	21	1
293	2023-01-09 13:24:35.518544+00	1	White Tshirt	2	[]	21	1
294	2023-01-09 14:12:39.463048+00	1	White Tshirt	2	[]	21	1
295	2023-01-09 14:14:59.620823+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
296	2023-01-09 14:14:59.663781+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
297	2023-01-09 14:15:09.136849+00	1	White Tshirt	2	[]	21	1
298	2023-01-09 14:15:43.52506+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
299	2023-01-09 14:17:01.821346+00	1	White Tshirt	2	[]	21	1
300	2023-01-09 14:17:02.112742+00	1	White Tshirt	2	[{"changed": {"fields": ["Sell price"]}}]	21	1
301	2023-01-09 14:17:46.779982+00	1	White Tshirt	2	[]	21	1
302	2023-01-09 14:18:50.832228+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
303	2023-01-09 14:18:55.860384+00	1	White Tshirt	2	[]	21	1
304	2023-01-09 14:19:09.441043+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
305	2023-01-09 14:19:17.172455+00	1	White Tshirt	2	[]	21	1
306	2023-01-09 14:28:55.032195+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
307	2023-01-09 14:32:03.944089+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
308	2023-01-09 14:32:22.156771+00	1	White Tshirt	2	[]	21	1
309	2023-01-09 14:36:02.970127+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
310	2023-01-09 14:45:07.578893+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
311	2023-01-09 14:45:15.070064+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
312	2023-01-09 14:45:20.895144+00	1	White Tshirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
313	2023-01-09 14:59:24.622027+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
314	2023-01-09 14:59:30.823973+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
315	2023-01-09 16:17:08.226921+00	6	Green Sneaker	2	[]	21	1
316	2023-01-09 16:17:23.378755+00	3	Blue Shirt	2	[]	21	1
317	2023-01-09 16:17:29.048942+00	2	Black Tshirt	2	[]	21	1
318	2023-01-09 16:17:55.242226+00	6	Green Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
319	2023-01-09 18:27:49.485745+00	4	Pull&Bear 4	2	[{"changed": {"fields": ["Name"]}}]	16	1
320	2023-01-09 18:53:54.591091+00	6	Green Sneaker	2	[{"deleted": {"name": "product version detail", "object": "Green Sneaker's details 41 10"}}]	21	1
321	2023-01-09 18:54:27.221078+00	6	Green Sneaker	2	[{"added": {"name": "product version detail", "object": "Green Sneaker's details 41 10"}}]	21	1
322	2023-01-10 06:04:23.865436+00	5	Try 5	1	[{"added": {}}]	20	1
323	2023-01-10 06:44:32.72576+00	7	Red Try	1	[{"added": {}}, {"added": {"name": "version image", "object": "Red Try's image 25"}}, {"added": {"name": "product version detail", "object": "Red Try's details XS 10"}}]	21	1
324	2023-01-10 06:45:19.897352+00	8	Blue Try	1	[{"added": {}}, {"added": {"name": "version image", "object": "Blue Try's image 26"}}, {"added": {"name": "product version detail", "object": "Blue Try's details XS 10"}}]	21	1
325	2023-01-10 06:46:02.468078+00	8	Blue Try	3		21	1
326	2023-01-10 06:46:02.481099+00	7	Red Try	3		21	1
327	2023-01-10 06:46:53.727774+00	5	Try 5	3		20	1
328	2023-01-10 06:52:27.776305+00	6	Try 6	1	[{"added": {}}]	20	1
329	2023-01-10 06:54:40.950741+00	9	Red Try	1	[{"added": {}}, {"added": {"name": "version image", "object": "Red Try's image 27"}}, {"added": {"name": "product version detail", "object": "Red Try's details 39 10"}}]	21	1
330	2023-01-10 12:16:57.102881+00	1	Shahan's review 1, 5	1	[{"added": {}}]	23	1
331	2023-01-10 12:17:09.333414+00	1	Shahan's review 1, 5	2	[{"changed": {"fields": ["Value", "Price", "Quality"]}}]	23	1
332	2023-01-10 12:17:38.6442+00	2	Shahan's review 2, 5	1	[{"added": {}}]	23	1
333	2023-01-10 12:17:52.414526+00	2	Shahan's review 2, 5	2	[{"changed": {"fields": ["Value", "Price", "Quality"]}}]	23	1
334	2023-01-11 07:52:19.605828+00	3	Shahan's review 3, 5	1	[{"added": {}}]	23	1
335	2023-01-11 07:54:00.032614+00	1	Shahan's review 1, 5	2	[]	23	1
336	2023-01-11 07:54:13.38512+00	1	Shahan's review 1, 5	2	[{"changed": {"fields": ["Value", "Price"]}}]	23	1
337	2023-01-11 08:08:57.328267+00	2	Shahan's review 2, 5	2	[]	23	1
338	2023-01-11 08:14:08.789993+00	3	Shahan's review 3, 5	2	[]	23	1
339	2023-01-11 08:16:55.896123+00	5	White Sneaker	2	[]	21	1
340	2023-01-11 09:35:44.121922+00	4	Shahan's review 4, 1	1	[{"added": {}}]	23	1
341	2023-01-11 09:36:47.259869+00	5	Shahan's review 5, 1	1	[{"added": {}}]	23	1
342	2023-01-11 09:49:16.283848+00	5	Shahan's review 5, 1	2	[{"changed": {"fields": ["Value", "Price", "Quality"]}}]	23	1
343	2023-01-11 09:49:33.048665+00	5	Shahan's review 5, 1	2	[{"changed": {"fields": ["Quality"]}}]	23	1
344	2023-01-11 09:49:56.469673+00	5	Shahan's review 5, 1	3		23	1
345	2023-01-11 09:51:17.511885+00	4	Shahan's review 4, 1	3		23	1
346	2023-01-11 09:51:49.973842+00	6	Shahan's review 6, 1	1	[{"added": {}}]	23	1
347	2023-01-11 09:52:52.117635+00	6	Shahan's review 6, 1	3		23	1
348	2023-01-11 10:11:10.961501+00	4	Gray Shirt	2	[]	21	1
349	2023-01-11 10:14:02.049224+00	4	Gray Shirt	2	[]	21	1
350	2023-01-11 10:14:09.891626+00	3	Blue Shirt	2	[]	21	1
351	2023-01-11 10:15:16.526472+00	9	Red Try	2	[]	21	1
352	2023-01-11 12:29:56.44645+00	3	VersionReview object (3)	3		23	1
353	2023-01-11 12:29:56.540215+00	2	VersionReview object (2)	3		23	1
354	2023-01-11 12:29:56.548345+00	1	VersionReview object (1)	3		23	1
355	2023-01-11 12:32:08.630303+00	7	shahan's review 7, 2	1	[{"added": {}}]	23	1
356	2023-01-13 10:17:11.325107+00	10	 review 10	3		23	1
357	2023-01-13 10:17:11.371849+00	9	 review 9	3		23	1
358	2023-01-13 10:17:11.37615+00	8	 review 8	3		23	1
359	2023-01-13 10:17:11.379153+00	7	 review 7	3		23	1
360	2023-01-13 10:20:43.345177+00	14	 review 14	3		23	1
361	2023-01-13 10:20:43.368228+00	13	 review 13	3		23	1
362	2023-01-13 10:20:43.372202+00	12	 review 12	3		23	1
363	2023-01-13 10:20:43.375204+00	11	 review 11	3		23	1
364	2023-01-15 10:14:25.280138+00	3	Name for r_api post request 3	3		7	1
365	2023-01-15 10:14:25.376161+00	4	Name for r_api post request 2 4	3		7	1
366	2023-01-15 10:14:25.38414+00	5	Name for r_api post request 3 5	3		7	1
367	2023-01-15 10:14:25.395792+00	6	Name for r_api post request 3 6	3		7	1
368	2023-01-16 16:48:41.44104+00	10	Red Shirt	1	[{"added": {}}]	21	1
369	2023-01-16 16:48:49.93812+00	10	Red Shirt	2	[]	21	1
370	2023-01-16 16:49:48.483661+00	10	Red Shirt	3		21	1
371	2023-01-16 16:49:48.53706+00	9	Red Try	3		21	1
372	2023-01-16 16:50:01.50512+00	11	White Shirt	1	[{"added": {}}]	21	1
373	2023-01-16 16:50:42.871434+00	12	Yellow Sneaker	1	[{"added": {}}]	21	1
374	2023-01-16 16:51:27.287952+00	12	Yellow Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
375	2023-01-16 16:51:46.251799+00	12	Yellow Sneaker	3		21	1
376	2023-01-16 16:52:02.323811+00	13	Gray Tshirt	1	[{"added": {}}]	21	1
377	2023-01-16 16:52:30.170221+00	13	Gray Tshirt	2	[]	21	1
378	2023-01-16 16:53:20.450785+00	14	Green Sneaker	1	[{"added": {}}]	21	1
379	2023-01-16 16:53:27.213047+00	14	Green Sneaker	2	[]	21	1
380	2023-01-16 16:53:50.163284+00	14	Green Sneaker	3		21	1
381	2023-01-16 16:53:50.224668+00	13	Gray Tshirt	3		21	1
382	2023-01-16 16:54:07.48512+00	15	Green Sneaker	1	[{"added": {}}]	21	1
383	2023-01-16 16:54:13.869885+00	15	Green Sneaker	2	[]	21	1
384	2023-01-16 16:54:27.645535+00	15	Green Sneaker	3		21	1
385	2023-01-16 16:55:07.073274+00	16	White Shirt	1	[{"added": {}}]	21	1
386	2023-01-16 16:55:25.247352+00	16	White Shirt	3		21	1
387	2023-01-16 16:55:41.912484+00	17	White Shirt	1	[{"added": {}}]	21	1
388	2023-01-16 16:55:49.103796+00	17	White Shirt	2	[]	21	1
389	2023-01-16 16:56:03.300128+00	18	White Shirt	1	[{"added": {}}]	21	1
390	2023-01-16 16:56:10.518759+00	18	White Shirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
391	2023-01-16 16:56:17.114403+00	18	White Shirt	2	[]	21	1
392	2023-01-16 16:56:24.487479+00	18	White Shirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
393	2023-01-16 16:56:29.612773+00	18	White Shirt	2	[]	21	1
394	2023-01-16 16:56:43.84794+00	18	White Shirt	3		21	1
395	2023-01-16 16:56:43.95954+00	17	White Shirt	3		21	1
396	2023-01-16 16:57:38.786747+00	19	White Shirt	1	[{"added": {}}]	21	1
397	2023-01-16 16:57:46.778689+00	19	White Shirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
398	2023-01-16 16:57:57.149057+00	19	White Shirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
399	2023-01-16 16:58:03.431879+00	19	White Shirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
400	2023-01-16 16:58:10.145456+00	19	White Shirt	2	[{"changed": {"fields": ["Discount"]}}]	21	1
401	2023-01-16 16:58:42.020391+00	19	White Shirt	3		21	1
402	2023-01-16 16:58:54.094308+00	20	White Sneaker	1	[{"added": {}}]	21	1
403	2023-01-16 16:59:01.808055+00	20	White Sneaker	2	[{"changed": {"fields": ["Discount"]}}]	21	1
404	2023-01-16 16:59:14.376663+00	20	White Sneaker	3		21	1
405	2023-01-17 09:19:45.401281+00	11	White Shirt	3		21	1
406	2023-01-17 17:26:33.785697+00	1	shahan's basket 1	1	[{"added": {}}]	13	1
407	2023-01-17 17:26:40.791403+00	2	shahan01's basket 2	1	[{"added": {}}]	13	1
408	2023-01-17 17:30:11.085429+00	1	shahan's basket item 6 1	1	[{"added": {}}]	14	1
409	2023-01-17 17:30:28.653794+00	2	shahan's basket item 1 2	1	[{"added": {}}]	14	1
410	2023-01-17 17:30:40.889245+00	3	shahan01's basket item 4 3	1	[{"added": {}}]	14	1
411	2023-01-17 17:38:06.997689+00	1	shahan's wishlit  1	1	[{"added": {}}]	15	1
412	2023-01-17 17:38:12.072635+00	2	shahan's wishlit  2	1	[{"added": {}}]	15	1
413	2023-01-17 17:38:18.582524+00	3	shahan's wishlit  3	1	[{"added": {}}]	15	1
414	2023-01-17 17:38:23.590961+00	4	shahan01's wishlit  4	1	[{"added": {}}]	15	1
415	2023-01-18 06:52:44.603117+00	5	shahan's wishlit  5	3		15	1
416	2023-01-18 06:52:44.641117+00	4	shahan01's wishlit  4	3		15	1
417	2023-01-18 06:52:44.644593+00	3	shahan's wishlit  3	3		15	1
418	2023-01-18 06:52:44.647605+00	2	shahan's wishlit  2	3		15	1
419	2023-01-18 06:52:44.651606+00	1	shahan's wishlit  1	3		15	1
420	2023-01-18 06:54:59.432629+00	7	s wishlit  7	3		15	1
421	2023-01-18 06:54:59.456813+00	6	s wishlit  6	3		15	1
422	2023-01-18 06:56:15.990359+00	9	s wishlit  9	3		15	1
423	2023-01-18 06:56:16.001808+00	8	s wishlit  8	3		15	1
424	2023-01-18 06:59:18.442912+00	11	s wishlit  11	3		15	1
425	2023-01-18 06:59:18.465211+00	10	s wishlit  10	3		15	1
426	2023-01-18 07:01:14.782788+00	13	s wishlit  13	3		15	1
427	2023-01-18 07:01:14.833961+00	12	s wishlit  12	3		15	1
428	2023-01-18 07:02:09.963768+00	15	s wishlit  15	3		15	1
429	2023-01-18 07:02:09.974773+00	14	s wishlit  14	3		15	1
430	2023-01-18 07:05:05.278897+00	17	s wishlit  17	3		15	1
431	2023-01-18 07:05:05.291812+00	16	s wishlit  16	3		15	1
432	2023-01-18 07:06:32.401572+00	19	s wishlit  19	3		15	1
433	2023-01-18 07:06:32.414585+00	18	s wishlit  18	3		15	1
434	2023-01-18 07:09:13.73742+00	20	s wishlit  20	3		15	1
435	2023-01-18 07:11:45.085168+00	22	s wishlit  22	3		15	1
436	2023-01-18 07:11:45.107775+00	21	s wishlit  21	3		15	1
437	2023-01-18 07:15:48.444775+00	24	s wishlit  24	3		15	1
438	2023-01-18 07:15:48.465776+00	23	s wishlit  23	3		15	1
439	2023-01-18 07:16:21.278124+00	26	s wishlit  26	3		15	1
440	2023-01-18 07:16:21.300321+00	25	s wishlit  25	3		15	1
441	2023-01-18 07:16:34.675617+00	28	s wishlit  28	3		15	1
442	2023-01-18 07:16:34.699948+00	27	s wishlit  27	3		15	1
443	2023-01-18 07:17:14.033973+00	29	s wishlit  29	3		15	1
444	2023-01-18 07:17:25.617705+00	30	s wishlit  30	3		15	1
445	2023-01-18 07:17:45.459927+00	31	s wishlit  31	3		15	1
446	2023-01-18 07:21:00.438524+00	38	s wishlit  38	3		15	1
447	2023-01-18 07:21:27.61487+00	40	s wishlit  40	3		15	1
448	2023-01-18 07:21:27.627939+00	39	s wishlit  39	3		15	1
449	2023-01-18 07:21:58.793842+00	42	s wishlit  42	3		15	1
450	2023-01-18 07:21:58.816884+00	41	s wishlit  41	3		15	1
451	2023-01-18 07:28:29.076816+00	51	s wishlit  51	3		15	1
452	2023-01-18 07:45:01.609678+00	64	s wishlit  64	3		15	1
453	2023-01-18 07:45:01.674686+00	63	s wishlit  63	3		15	1
454	2023-01-18 08:47:15.65154+00	75	shahan's wishlit  75	3		15	1
455	2023-01-18 08:47:15.680909+00	74	shahan's wishlit  74	3		15	1
456	2023-01-18 08:47:15.687216+00	73	shahan's wishlit  73	3		15	1
457	2023-01-18 08:47:27.891922+00	77	shahan's wishlit  77	3		15	1
458	2023-01-18 08:47:27.90351+00	76	shahan's wishlit  76	3		15	1
459	2023-01-18 14:59:20.594429+00	4	's basket item 6 4	3		14	1
460	2023-01-18 14:59:20.669985+00	3	's basket item 4 3	3		14	1
461	2023-01-18 15:09:10.533603+00	2	shahan01's basket 2	3		13	1
462	2023-01-18 15:09:10.559216+00	1	shahan's basket 1	3		13	1
463	2023-01-18 16:05:34.527472+00	17	shahan's basket item 5 17	3		14	1
464	2023-01-18 16:05:34.553241+00	10	shahan's basket item 6 10	3		14	1
465	2023-01-18 16:47:41.129065+00	22	shahan's basket item 5 22	3		14	1
466	2023-01-18 16:50:39.20778+00	32	shahan's basket item 6 32	3		14	1
467	2023-01-18 16:50:39.227047+00	31	shahan's basket item 6 31	3		14	1
468	2023-01-19 08:34:58.344605+00	36	shahan's basket item 6 36	3		14	1
469	2023-01-19 08:34:58.485705+00	34	shahan's basket item 6 34	3		14	1
470	2023-01-19 08:46:36.072733+00	94	shahan's wishlit  94	3		15	1
471	2023-01-19 08:46:36.129587+00	93	shahan's wishlit  93	3		15	1
472	2023-01-19 08:46:36.137575+00	85	shahan's wishlit  85	3		15	1
473	2023-01-19 08:46:36.145787+00	84	shahan's wishlit  84	3		15	1
474	2023-01-19 09:41:30.178035+00	96	shahan's wishlit  96	3		15	1
475	2023-01-19 19:15:00.341068+00	44	shahan's basket item 6 44	3		14	1
476	2023-01-19 19:15:00.398798+00	43	shahan's basket item 6 43	3		14	1
477	2023-01-19 19:15:00.40371+00	42	shahan's basket item 6 42	3		14	1
478	2023-01-19 19:15:00.409724+00	37	shahan's basket item 5 37	3		14	1
479	2023-01-19 19:15:21.763742+00	47	shahan's basket item 6 47	3		14	1
480	2023-01-19 19:15:21.781319+00	46	shahan's basket item 6 46	3		14	1
481	2023-01-19 19:15:21.785403+00	45	shahan's basket item 6 45	3		14	1
482	2023-01-19 19:25:50.217405+00	52	shahan's basket item 6 52	3		14	1
483	2023-01-19 19:25:50.255916+00	49	shahan's basket item 6 49	3		14	1
484	2023-01-20 09:39:42.183906+00	61	shahan's basket item 6 61	3		14	1
485	2023-01-20 09:39:42.284849+00	60	shahan's basket item 6 60	3		14	1
486	2023-01-20 09:43:44.138671+00	72	shahan's basket item 5 72	3		14	1
487	2023-01-20 09:43:44.203599+00	71	shahan's basket item 5 71	3		14	1
488	2023-01-20 09:43:44.210761+00	70	shahan's basket item 6 70	3		14	1
489	2023-01-20 09:43:44.217476+00	69	shahan's basket item 6 69	3		14	1
490	2023-01-20 09:43:44.225459+00	67	shahan's basket item 6 67	3		14	1
491	2023-01-20 09:43:44.231973+00	64	shahan's basket item 6 64	3		14	1
492	2023-01-24 08:01:14.674512+00	129	shahan's basket item 6 129	2	[]	14	1
493	2023-01-24 08:01:29.580928+00	129	shahan's basket item 6 129	2	[{"changed": {"fields": ["Count"]}}]	14	1
494	2023-01-24 08:03:25.291741+00	4	shahan's basket 4	2	[]	13	1
495	2023-01-24 08:03:44.19713+00	4	shahan's basket 4	2	[]	13	1
496	2023-01-24 08:04:11.93444+00	4	shahan's basket 4	2	[]	13	1
497	2023-01-24 08:04:33.056441+00	142	shahan's basket item 1 142	2	[]	14	1
498	2023-01-24 08:04:37.835817+00	141	shahan's basket item 1 141	2	[]	14	1
499	2023-01-24 08:04:41.5604+00	140	shahan's basket item 1 140	2	[]	14	1
500	2023-01-24 08:04:45.282195+00	139	shahan's basket item 1 139	2	[]	14	1
501	2023-01-24 08:04:49.65304+00	138	shahan's basket item 1 138	2	[]	14	1
502	2023-01-24 08:04:53.983821+00	137	shahan's basket item 1 137	2	[]	14	1
503	2023-01-24 08:04:57.864223+00	136	shahan's basket item 5 136	2	[]	14	1
504	2023-01-24 08:05:01.340443+00	135	shahan's basket item 5 135	2	[]	14	1
505	2023-01-24 08:05:05.777256+00	134	shahan's basket item 5 134	2	[]	14	1
506	2023-01-24 08:05:15.071053+00	133	shahan's basket item 5 133	2	[]	14	1
507	2023-01-24 08:05:20.976099+00	132	shahan's basket item 6 132	2	[]	14	1
508	2023-01-24 08:05:29.463037+00	130	shahan's basket item 6 130	2	[]	14	1
509	2023-01-24 08:05:48.301703+00	4	shahan's basket 4	2	[]	13	1
510	2023-01-24 08:49:18.362828+00	4	shahan's basket 4	2	[]	13	1
511	2023-01-24 11:51:51.281051+00	4	shahan's basket 4	2	[{"changed": {"fields": ["Is active"]}}]	13	1
512	2023-01-24 12:21:25.719047+00	4	shahan's basket 4	3		13	1
513	2023-01-24 12:28:46.365917+00	5	shahan's basket 5	3		13	1
514	2023-01-24 12:29:58.258129+00	6	shahan's basket 6	3		13	1
515	2023-01-24 12:43:51.386675+00	11	shahan's basket 11	2	[]	13	1
516	2023-01-24 12:44:00.949946+00	11	shahan's basket 11	2	[]	13	1
517	2023-01-24 12:44:20.109897+00	11	shahan's basket 11	2	[]	13	1
518	2023-01-24 12:47:55.440842+00	12	shahan's basket 12	3		13	1
519	2023-01-24 12:47:55.498061+00	11	shahan's basket 11	3		13	1
520	2023-01-24 12:47:55.498061+00	10	shahan's basket 10	3		13	1
521	2023-01-24 12:47:55.507348+00	9	shahan's basket 9	3		13	1
522	2023-01-24 12:47:55.512341+00	8	shahan's basket 8	3		13	1
523	2023-01-24 12:47:55.52057+00	7	shahan's basket 7	3		13	1
524	2023-01-27 08:16:53.193306+00	1	aliyevsahan@gmail.com	3		28	1
525	2023-01-27 08:46:21.491406+00	2	aliyevsahan@gmail.com	3		28	1
526	2023-01-27 08:47:34.377436+00	5	aliyevsahan@gmail.com	3		28	1
527	2023-01-27 08:47:34.389522+00	4	aliyevsahan@gmail.com	3		28	1
528	2023-01-27 08:47:34.392804+00	3	aliyevsahan@gmail.com	3		28	1
529	2023-01-27 12:41:01.683511+00	1	43 16 * * * (m/h/dM/MY/d) UTC	1	[{"added": {}}]	29	1
530	2023-01-27 12:41:04.403024+00	1	export: 43 16 * * * (m/h/dM/MY/d) UTC	1	[{"added": {}}]	31	1
531	2023-01-27 12:42:27.499493+00	1	45 16 * * * (m/h/dM/MY/d) UTC	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
532	2023-01-27 12:42:29.604147+00	1	export: 45 16 * * * (m/h/dM/MY/d) UTC	2	[]	31	1
533	2023-01-27 12:45:55.944543+00	1	46 16 * * * (m/h/dM/MY/d) UTC	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
534	2023-01-27 12:45:57.833956+00	1	export: 46 16 * * * (m/h/dM/MY/d) UTC	2	[]	31	1
535	2023-01-27 12:46:20.186947+00	1	47 16 * * * (m/h/dM/MY/d) UTC	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
536	2023-01-27 12:46:22.801819+00	1	export: 47 16 * * * (m/h/dM/MY/d) UTC	2	[]	31	1
537	2023-01-27 12:49:39.892385+00	1	51 16 * * * (m/h/dM/MY/d) UTC	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
538	2023-01-27 12:49:42.501959+00	1	export: 51 16 * * * (m/h/dM/MY/d) UTC	2	[]	31	1
539	2023-01-27 12:55:29.241125+00	1	56 16 * * * (m/h/dM/MY/d) UTC	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
540	2023-01-27 12:55:31.301588+00	1	export: 56 16 * * * (m/h/dM/MY/d) UTC	2	[]	31	1
541	2023-01-27 12:56:26.797261+00	1	57 16 * * * (m/h/dM/MY/d) UTC	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
542	2023-01-27 12:56:31.083931+00	1	export: 57 16 * * * (m/h/dM/MY/d) UTC	2	[]	31	1
543	2023-01-27 13:02:28.165449+00	1	06 17 * * * (m/h/dM/MY/d) UTC	2	[{"changed": {"fields": ["Minute(s)", "Hour(s)"]}}]	29	1
544	2023-01-27 13:02:30.477653+00	1	export: 06 17 * * * (m/h/dM/MY/d) UTC	2	[]	31	1
545	2023-01-27 13:06:42.387781+00	2	08 17 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)", "Hour(s)"]}}]	29	1
546	2023-01-27 13:06:44.430665+00	2	celery.backend_cleanup: 08 17 * * * (m/h/dM/MY/d) Asia/Baku	2	[]	31	1
547	2023-01-27 13:07:48.757468+00	2	09 17 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
548	2023-01-27 13:07:51.12604+00	2	celery.backend_cleanup: 09 17 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
549	2023-01-27 13:11:32.047761+00	2	celery.backend_cleanup: 09 17 * * * (m/h/dM/MY/d) Asia/Baku	3		31	1
550	2023-01-27 13:11:32.061413+00	1	export: 06 17 * * * (m/h/dM/MY/d) UTC	3		31	1
551	2023-01-27 15:43:42.819835+00	6	aliyevsahan@gmail.com	3		28	1
552	2023-01-27 16:02:43.678211+00	3	10 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)", "Hour(s)"]}}]	29	1
553	2023-01-27 16:02:46.286031+00	3	celery.backend_cleanup: 10 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
554	2023-01-27 16:06:25.719074+00	3	08 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
555	2023-01-27 16:06:28.083217+00	3	celery.backend_cleanup: 08 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[]	31	1
556	2023-01-27 16:10:29.426856+00	3	11 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
557	2023-01-27 16:10:32.305151+00	3	celery.backend_cleanup: 11 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[]	31	1
558	2023-01-27 16:17:10.159065+00	3	celery.backend_cleanup: 11 20 * * * (m/h/dM/MY/d) Asia/Baku	3		31	1
559	2023-01-27 16:18:20.91651+00	4	20 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)", "Hour(s)"]}}]	29	1
560	2023-01-27 16:18:30.279895+00	4	celery.backend_cleanup: 20 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
561	2023-01-27 16:18:54.536115+00	4	celery.backend_cleanup: 20 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
562	2023-01-27 16:19:08.914402+00	4	celery.backend_cleanup: 20 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
563	2023-01-27 16:24:22.860816+00	4	25 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
564	2023-01-27 16:24:25.297571+00	4	celery.backend_cleanup: 25 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
565	2023-01-27 16:24:35.956716+00	4	celery.backend_cleanup: 25 20 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
566	2023-01-27 17:51:30.382982+00	4	52 21 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)", "Hour(s)"]}}]	29	1
567	2023-01-27 17:51:33.594087+00	4	celery.backend_cleanup: 52 21 * * * (m/h/dM/MY/d) Asia/Baku	2	[]	31	1
568	2023-01-27 17:51:41.403975+00	4	celery.backend_cleanup: 52 21 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
569	2023-01-27 17:53:48.505944+00	5	54 21 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)", "Hour(s)"]}}]	29	1
570	2023-01-27 17:53:51.302281+00	4	celery.backend_cleanup: 54 21 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
571	2023-01-27 18:12:48.201682+00	4	celery.backend_cleanup: 54 21 * * * (m/h/dM/MY/d) Asia/Baku	3		31	1
572	2023-01-27 18:27:25.975163+00	6	28 22 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)", "Hour(s)"]}}]	29	1
573	2023-01-27 18:27:29.907415+00	5	celery.backend_cleanup: 28 22 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)", "Task (custom)"]}}]	31	1
574	2023-01-27 18:31:28.149594+00	6	32 22 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
575	2023-01-27 18:31:30.741654+00	5	celery.backend_cleanup: 32 22 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
576	2023-01-27 18:32:44.947007+00	6	33 22 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
577	2023-01-27 18:32:47.774367+00	5	celery.backend_cleanup: 33 22 * * * (m/h/dM/MY/d) Asia/Baku	2	[]	31	1
578	2023-01-27 18:32:51.090713+00	5	celery.backend_cleanup: 33 22 * * * (m/h/dM/MY/d) Asia/Baku	2	[]	31	1
579	2023-01-27 18:36:31.659338+00	5	celery.backend_cleanup: 33 22 * * * (m/h/dM/MY/d) Asia/Baku	3		31	1
580	2023-01-27 18:36:58.006688+00	1	06 17 * * * (m/h/dM/MY/d) UTC	3		29	1
581	2023-01-27 18:36:58.018074+00	2	09 17 * * * (m/h/dM/MY/d) Asia/Baku	3		29	1
582	2023-01-27 18:36:58.02133+00	3	11 20 * * * (m/h/dM/MY/d) Asia/Baku	3		29	1
583	2023-01-27 18:36:58.024335+00	4	52 21 * * * (m/h/dM/MY/d) Asia/Baku	3		29	1
584	2023-01-27 18:36:58.027313+00	5	54 21 * * * (m/h/dM/MY/d) Asia/Baku	3		29	1
585	2023-01-27 18:36:58.03033+00	6	33 22 * * * (m/h/dM/MY/d) Asia/Baku	3		29	1
586	2023-01-27 18:37:53.634097+00	7	39 22 * * * (m/h/dM/MY/d) UTC	1	[{"added": {}}]	29	1
587	2023-01-27 18:37:56.846241+00	6	Send Email: 39 22 * * * (m/h/dM/MY/d) UTC	1	[{"added": {}}]	31	1
588	2023-01-27 18:39:46.419499+00	7	40 22 * * * (m/h/dM/MY/d) UTC	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
589	2023-01-27 18:39:48.618987+00	6	Send Email: 40 22 * * * (m/h/dM/MY/d) UTC	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
590	2023-01-27 18:40:32.561074+00	1	aliyevsahan@gmail.com  1	1	[{"added": {}}]	11	1
591	2023-01-27 18:40:46.515015+00	7	41 22 * * * (m/h/dM/MY/d) UTC	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
592	2023-01-27 18:40:48.815369+00	6	Send Email: 41 22 * * * (m/h/dM/MY/d) UTC	2	[]	31	1
593	2023-01-27 18:41:36.334595+00	6	Send Email: 41 22 * * * (m/h/dM/MY/d) UTC	3		31	1
594	2023-01-27 18:42:26.913213+00	8	43 22 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)", "Hour(s)"]}}]	29	1
595	2023-01-27 18:42:29.210791+00	7	celery.backend_cleanup: 43 22 * * * (m/h/dM/MY/d) Asia/Baku	2	[]	31	1
596	2023-01-27 18:46:16.470424+00	8	47 22 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)"]}}]	29	1
597	2023-01-27 18:46:19.104945+00	7	celery.backend_cleanup: 47 22 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
598	2023-01-27 18:46:27.158417+00	7	celery.backend_cleanup: 47 22 * * * (m/h/dM/MY/d) Asia/Baku	2	[]	31	1
599	2023-01-28 08:29:45.73869+00	9	30 12 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Minute(s)", "Hour(s)"]}}]	29	1
600	2023-01-28 08:29:48.624768+00	7	celery.backend_cleanup: 30 12 * * * (m/h/dM/MY/d) Asia/Baku	2	[{"changed": {"fields": ["Task (registered)"]}}]	31	1
601	2023-01-29 11:57:39.192108+00	8	aliyevshahan@gmail.com	3		28	1
602	2023-01-29 12:01:21.841652+00	9	aliyevshahan@gmail.com	3		28	1
603	2023-01-29 12:02:44.444106+00	10	aliyevshahan@gmail.com	3		28	1
604	2023-01-29 12:03:29.439862+00	11	aliyevshahan@gmail.com	3		28	1
605	2023-01-29 12:15:19.598816+00	12	aliyevshahan@gmail.com	3		28	1
606	2023-01-29 12:18:44.858483+00	13	aliyevshahan@gmail.com	3		28	1
607	2023-01-29 12:20:51.570521+00	14	aliyevshahan@gmail.com	3		28	1
608	2023-01-29 12:57:33.532819+00	15	aliyevshahan@gmail.com	3		28	1
609	2023-01-29 12:59:48.336421+00	16	aliyevshahan@gmail.com	3		28	1
610	2023-01-30 11:25:31.600496+00	34	shahan01	3		26	1
611	2023-01-31 10:19:18.781209+00	13	shahan0020's blog - Header 4	1	[{"added": {}}]	6	1
612	2023-01-31 10:22:32.087348+00	13	shahan0020's blog - Header 4	2	[]	6	1
613	2023-01-31 10:23:28.920126+00	13	shahan0020's blog - Header 4	2	[{"changed": {"fields": ["Header [az]"]}}]	6	1
614	2023-01-31 10:30:04.033019+00	13	shahan0020's blog - Header 4	2	[]	6	1
615	2023-01-31 10:30:13.790254+00	13	shahan0020's blog - Header 4	2	[]	6	1
616	2023-01-31 10:32:07.440828+00	13	shahan0020's blog - Header 4	2	[{"changed": {"fields": ["Image"]}}]	6	1
617	2023-01-31 10:35:55.428718+00	5	shahan's blog - Second Sport Blog	2	[]	6	1
618	2023-01-31 10:36:05.67238+00	4	shahan's blog - For Sport Blog	2	[{"changed": {"fields": ["Description [en]"]}}]	6	1
619	2023-01-31 10:36:09.775621+00	3	shahan's blog - For Daily Blog	2	[{"changed": {"fields": ["Description [en]"]}}]	6	1
620	2023-01-31 10:41:48.983918+00	13	shahan0020's blog - Header 4	2	[]	6	1
621	2023-01-31 10:42:11.503609+00	13	shahan0020's blog - Header 4	2	[]	6	1
622	2023-01-31 10:43:47.149689+00	13	shahan0020's blog - Header 4	2	[]	6	1
623	2023-01-31 10:45:39.737817+00	13	shahan0020's blog - Header 4	3		6	1
624	2023-01-31 10:51:52.486001+00	21	Blue Shirt	1	[{"added": {}}]	21	1
625	2023-01-31 10:55:05.242829+00	22	Blue Sneaker	1	[{"added": {}}]	21	1
626	2023-01-31 10:55:09.803365+00	22	Blue Sneaker	3		21	1
627	2023-01-31 10:55:18.364684+00	21	Blue Shirt	3		21	1
628	2023-02-03 07:56:01.973826+00	17	justsubsvribed@gmail.com	1	[{"added": {}}]	28	1
629	2023-02-03 07:56:22.736811+00	17	justsubsvribed@gmail.com	3		28	1
630	2023-02-15 12:49:22.150482+00	255	shahan's basket item 5 255	3		14	1
631	2023-02-15 12:49:22.280544+00	254	shahan's basket item 5 254	3		14	1
632	2023-02-15 12:49:22.287543+00	1	shahan's basket item 5 1	3		14	1
633	2023-02-17 12:14:35.796287+00	1	Shahan' contact information 	3		27	1
634	2023-02-17 12:15:38.925915+00	3	Shahan' contact information 	3		27	1
635	2023-02-17 12:15:38.979282+00	2	Shahan' contact information 	3		27	1
636	2023-02-17 12:25:04.256482+00	6	Shahan' contact information 	3		27	1
637	2023-02-17 12:25:04.307199+00	5	Shahan' contact information 	3		27	1
638	2023-02-17 12:25:04.309874+00	4	Shahan' contact information 	3		27	1
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
7	41	22	*	*	*	UTC
8	47	22	*	*	*	Asia/Baku
9	30	12	*	*	*	Asia/Baku
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
7	celery.backend_cleanup	User.tasks.send_mail_to_subscribers	[]	{}	\N	\N	\N	\N	t	2023-01-28 08:30:00.061559+00	4	2023-01-28 08:31:47.127345+00		9	\N	\N	f	\N	\N	{}	\N	43200
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
1	2023-01-28 08:29:48.617442+00
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	Blog	blog
7	Blog	blogcategory
8	Blog	blogcomment
9	Core	aboutus
10	Core	contactus
11	Core	subscribeemail
12	Core	social
13	Order	basket
14	Order	basketitem
15	Order	wishlist
16	Product	brand
17	Product	category
18	Product	color
19	Product	discount
20	Product	product
21	Product	productversion
22	Product	size
23	Product	versionreview
24	Product	versionimage
25	Product	productversiondetail
26	User	user
27	User	contactinformation
28	User	subsciriberemail
29	django_celery_beat	crontabschedule
30	django_celery_beat	intervalschedule
31	django_celery_beat	periodictask
32	django_celery_beat	periodictasks
33	django_celery_beat	solarschedule
34	django_celery_beat	clockedschedule
35	social_django	association
36	social_django	code
37	social_django	nonce
38	social_django	usersocialauth
39	social_django	partial
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-12-30 10:07:59.773879+00
2	contenttypes	0002_remove_content_type_name	2022-12-30 10:07:59.795048+00
3	auth	0001_initial	2022-12-30 10:07:59.928441+00
4	auth	0002_alter_permission_name_max_length	2022-12-30 10:07:59.938188+00
5	auth	0003_alter_user_email_max_length	2022-12-30 10:07:59.949029+00
6	auth	0004_alter_user_username_opts	2022-12-30 10:07:59.959726+00
7	auth	0005_alter_user_last_login_null	2022-12-30 10:07:59.969734+00
8	auth	0006_require_contenttypes_0002	2022-12-30 10:07:59.978225+00
9	auth	0007_alter_validators_add_error_messages	2022-12-30 10:07:59.988969+00
10	auth	0008_alter_user_username_max_length	2022-12-30 10:08:00.001039+00
11	auth	0009_alter_user_last_name_max_length	2022-12-30 10:08:00.015614+00
12	auth	0010_alter_group_name_max_length	2022-12-30 10:08:00.032062+00
13	auth	0011_update_proxy_permissions	2022-12-30 10:08:00.042994+00
14	auth	0012_alter_user_first_name_max_length	2022-12-30 10:08:00.053469+00
15	User	0001_initial	2022-12-30 10:08:00.226715+00
16	Blog	0001_initial	2022-12-30 10:08:00.327642+00
17	Blog	0002_initial	2022-12-30 10:08:00.352105+00
18	Core	0001_initial	2022-12-30 10:08:00.43858+00
19	Product	0001_initial	2022-12-30 10:08:00.73126+00
20	Order	0001_initial	2022-12-30 10:08:00.778365+00
21	Order	0002_initial	2022-12-30 10:08:00.892924+00
22	Product	0002_initial	2022-12-30 10:08:00.927405+00
23	admin	0001_initial	2022-12-30 10:08:00.997061+00
24	admin	0002_logentry_remove_auto_add	2022-12-30 10:08:01.015594+00
25	admin	0003_logentry_add_action_flag_choices	2022-12-30 10:08:01.030923+00
26	sessions	0001_initial	2022-12-30 10:08:01.072529+00
27	Blog	0003_alter_blogcomment_blog	2022-12-30 14:28:05.081433+00
28	User	0002_alter_user_email	2022-12-30 14:28:05.257006+00
29	Blog	0004_blogcomment_user	2022-12-30 15:29:09.926033+00
30	Blog	0005_alter_blogcomment_email_alter_blogcomment_name	2022-12-31 07:25:20.999617+00
31	Blog	0006_alter_blogcomment_email_alter_blogcomment_name	2022-12-31 07:46:15.321274+00
32	Blog	0007_alter_blogcomment_email_alter_blogcomment_name	2022-12-31 08:16:59.953032+00
33	Blog	0008_alter_blog_description	2023-01-01 07:15:14.383531+00
34	Product	0003_alter_versionreview_version	2023-01-07 10:31:19.793708+00
35	Product	0004_alter_category_parent	2023-01-09 07:44:57.605184+00
36	Product	0005_alter_productversiondetail_size	2023-01-09 08:25:44.614635+00
37	Product	0006_alter_productversion_sell_price	2023-01-09 09:20:28.343215+00
38	Product	0007_productversion_slug	2023-01-09 10:36:07.292278+00
39	Product	0008_productversion_description	2023-01-09 15:56:22.884601+00
40	Product	0009_productversion_raiting	2023-01-09 16:19:30.780638+00
41	Product	0010_alter_product_brand_alter_product_category_and_more	2023-01-10 12:15:02.102234+00
42	Product	0011_versionreview_avarege_rating_and_more	2023-01-11 07:47:26.687884+00
43	Product	0012_rename_image_url_versionimage_image	2023-01-11 11:58:40.446312+00
44	Product	0013_remove_versionreview_email_and_more	2023-01-11 12:27:14.310478+00
45	Product	0014_alter_versionreview_avarege_rating	2023-01-13 09:27:37.21115+00
46	Product	0015_rename_description_versionreview_review_and_more	2023-01-13 10:23:33.710218+00
47	Product	0016_product_description_alter_versionreview_user_and_more	2023-01-14 14:25:36.682679+00
48	Product	0017_remove_product_description	2023-01-14 15:06:42.509339+00
49	Blog	0009_alter_blog_category	2023-01-15 07:16:12.424839+00
50	Order	0003_alter_basketitem_basket_alter_basketitem_version	2023-01-17 17:03:32.393673+00
51	Order	0004_basketitem_size	2023-01-17 17:29:39.287751+00
52	Order	0005_alter_wishlist_user	2023-01-18 06:52:00.115814+00
53	Order	0006_alter_basketitem_count	2023-01-18 10:56:00.404741+00
54	Order	0007_alter_basketitem_basket	2023-01-18 11:44:09.641839+00
55	Order	0008_basketitem_subtotal	2023-01-24 07:58:55.165014+00
56	User	0003_subsciriberemail	2023-01-27 07:50:14.092149+00
57	User	0004_contactinformation_created_at_and_more	2023-01-27 08:09:56.040575+00
58	User	0005_alter_subsciriberemail_email	2023-01-27 08:48:44.771066+00
59	django_celery_beat	0001_initial	2023-01-27 12:32:25.326698+00
60	django_celery_beat	0002_auto_20161118_0346	2023-01-27 12:32:25.376387+00
61	django_celery_beat	0003_auto_20161209_0049	2023-01-27 12:32:25.395321+00
62	django_celery_beat	0004_auto_20170221_0000	2023-01-27 12:32:25.405912+00
63	django_celery_beat	0005_add_solarschedule_events_choices	2023-01-27 12:32:25.416985+00
64	django_celery_beat	0006_auto_20180322_0932	2023-01-27 12:32:25.513136+00
65	django_celery_beat	0007_auto_20180521_0826	2023-01-27 12:32:25.534617+00
66	django_celery_beat	0008_auto_20180914_1922	2023-01-27 12:32:25.558511+00
67	django_celery_beat	0006_auto_20180210_1226	2023-01-27 12:32:25.575276+00
68	django_celery_beat	0006_periodictask_priority	2023-01-27 12:32:25.588793+00
69	django_celery_beat	0009_periodictask_headers	2023-01-27 12:32:25.601122+00
70	django_celery_beat	0010_auto_20190429_0326	2023-01-27 12:32:25.708329+00
71	django_celery_beat	0011_auto_20190508_0153	2023-01-27 12:32:25.7585+00
72	django_celery_beat	0012_periodictask_expire_seconds	2023-01-27 12:32:25.773616+00
73	django_celery_beat	0013_auto_20200609_0727	2023-01-27 12:32:25.786579+00
74	django_celery_beat	0014_remove_clockedschedule_enabled	2023-01-27 12:32:25.795575+00
75	django_celery_beat	0015_edit_solarschedule_events_choices	2023-01-27 12:32:25.807579+00
76	django_celery_beat	0016_alter_crontabschedule_timezone	2023-01-27 12:32:25.819714+00
77	Product	0018_alter_brand_name	2023-01-30 07:33:16.28439+00
78	Product	0019_alter_brand_name_brand_product_bra_name_168660_idx	2023-01-30 07:51:06.074972+00
79	Blog	0010_blog_blog_blog_header_136e83_idx_and_more	2023-01-30 08:13:05.461054+00
80	Product	0020_category_product_cat_name_1e8232_idx_and_more	2023-01-30 08:13:05.6111+00
81	default	0001_initial	2023-01-30 10:05:36.380579+00
82	social_auth	0001_initial	2023-01-30 10:05:36.393171+00
83	default	0002_add_related_name	2023-01-30 10:05:36.436582+00
84	social_auth	0002_add_related_name	2023-01-30 10:05:36.439285+00
85	default	0003_alter_email_max_length	2023-01-30 10:05:36.51205+00
86	social_auth	0003_alter_email_max_length	2023-01-30 10:05:36.519004+00
87	default	0004_auto_20160423_0400	2023-01-30 10:05:36.550897+00
88	social_auth	0004_auto_20160423_0400	2023-01-30 10:05:36.557488+00
89	social_auth	0005_auto_20160727_2333	2023-01-30 10:05:36.595892+00
90	social_django	0006_partial	2023-01-30 10:05:36.709052+00
91	social_django	0007_code_timestamp	2023-01-30 10:05:36.768731+00
92	social_django	0008_partial_timestamp	2023-01-30 10:05:36.812125+00
93	social_django	0009_auto_20191118_0520	2023-01-30 10:05:36.901101+00
94	social_django	0010_uid_db_index	2023-01-30 10:05:36.964765+00
95	social_django	0002_add_related_name	2023-01-30 10:05:37.001066+00
96	social_django	0005_auto_20160727_2333	2023-01-30 10:05:37.011527+00
97	social_django	0001_initial	2023-01-30 10:05:37.013332+00
98	social_django	0003_alter_email_max_length	2023-01-30 10:05:37.027078+00
99	social_django	0004_auto_20160423_0400	2023-01-30 10:05:37.035115+00
100	Blog	0011_blog_description_az_blog_description_en_and_more	2023-01-30 15:16:48.355048+00
101	Blog	0012_blog_slug	2023-01-31 10:18:08.552752+00
102	Blog	0013_alter_blog_user	2023-02-01 10:19:17.174229+00
103	Blog	0014_alter_blog_category	2023-02-01 12:09:26.494524+00
104	Blog	0015_alter_blog_image	2023-02-01 12:16:03.3334+00
105	Blog	0016_alter_blog_category_alter_blog_image_alter_blog_user	2023-02-01 12:23:36.432435+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
gifo8lycdk9rkkoanfz6802k5616duqn	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pBHNO:XEA6KlcbJBbyYt-iigeN9nX5D_zsQmlMvdmbtDaL-bA	2023-01-13 15:32:54.294291+00
6q20hyl1xzh0858cp0jg7eltnh57eu56	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pBWRf:Ym-Sp2GQfOKg76LdrST2DD6y9WPZ-rTvKoyTlX-ctSY	2023-01-14 07:38:19.791954+00
hbd4nqayqbryk6hq3hoj5b340u6l2vsx	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pBXCC:Re6wYk6lFUvQ60eX9yaxZJP0-RQcojDdIuXhj1E1KTQ	2023-01-14 08:26:24.440582+00
9zbgke9unqrnrajv3p5zkcraitvyvbk3	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pBYop:4QdFLrUo3OsILcMdPY7OtMP0zH_yR5RP0k-0u8dphtw	2023-01-14 10:10:23.202302+00
lq8ams7xybsnfrm8hmqogly454244xgk	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pBtjR:I0aVY4uBZ34kCqcn9sdydEzsF9fZw_bCB1hfQfH1cio	2023-01-15 08:30:13.602225+00
x260uy8j3oliut2n4j8fhwpp5lu4ikkz	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pC0a7:3s7CIkzZtTXNWRNcoLVqYQc8z-w2HcHR2qXAEfrJg_Y	2023-01-15 15:49:03.54796+00
vpfznyd10c097mvh2cxkabtj19iiir3k	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pCd0Q:WnOq-1NmXeWpd8peh1j7jXyKnOhnC3FNeCQdBJhOOPc	2023-01-17 08:50:46.582442+00
hnl4a9ndav2ip6p6j6gjxkoh6zwgth3r	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pM6dR:9Pb7GCBa-zeVPDx8IcrD_b9m9YEnVooewpcUBppvA10	2023-02-12 12:18:13.438072+00
ve2qp6orkk1pu4ecws0a50yl3bcvw5kq	.eJxVjssKwjAURP8l6xCSNC9cuvcLRMLNza2tlhT6UET8d1PoQrdzzgzzZhHWpYvrTFPsMzswxfhvlgDvVDaQb1Cuo8CxLFOfxKaInc7iNGYajrv7N9DB3NW2D1473SRrAhkkJWUipzJCY8Fkr0LrrWy11R6t1qaKEhCzywFVAG3q6ERIZRle8dHTk-qls-KGW-54c_l8Ad_7QLw:1pT0WX:3hP6XsDfzOkh7pQz4Ql3FS_OUP-yLdrxMgFmvuYuiyY	2023-03-03 13:11:37.533077+00
trhu1sb7jc8xgfazyhgk18hyaa7wiglr	e30:1pE4CN:r9D76GfMfIHymH3nSqNexlFhvC2d0DeuZi8wtsOFHLM	2023-01-21 08:05:03.794155+00
y4dhsop6c5jpgn2bm6fyilg5nngkk923	e30:1pE4CV:yTtMF31giBHK4oOVxGieMTSLYQ7fnlJSoa33f4GhLCc	2023-01-21 08:05:11.618656+00
gfnyq8itru60lyvwiqpgnd8ce6lxr9pr	e30:1pE4Cc:GVx1sA2bDI6VDmnw67JgejDjH6mz454F95OvTPTihYU	2023-01-21 08:05:18.63255+00
oqz37fj70k6zokpjx0e95xskdrg2767r	e30:1pE4E7:6xgGAr4e9ZM1YUQZ7b_I7BSa17uy9EiFnPMxHrkrSII	2023-01-21 08:06:51.309918+00
6x7enpb0baci7eu12dn3f1yqzh1zfwe6	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pEP0J:8jebY5rkRhPvUng8c3Hjup6rTtQpgtmadh9nUNkyP1Y	2023-01-22 06:17:59.66489+00
yuzu5qucln9qcq3jf0y9ukz9m1bpsx1a	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pE4Vt:R_JMLoFMWRTm5QQfcKsKM9j2WVh1Ct2k1GJYB4Gzq60	2023-01-21 08:25:13.157976+00
ygu65tf8jyjo92990a9wlwr1tvme8wyp	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pSFPt:6flM8JCdSeVye5TdvQ2225-eCAJWX7sy7vTNJpgxJSQ	2023-03-01 10:53:37.118396+00
uljesqh9xjtorykn3c5ziyurb8nrli0r	.eJxVjjsOwjAQRO_iGiJ7_YWSnjNYa--a8FEcxUYUiLuTSDS0M--N5i3ijK296kJx4cY99nrnSRxFGufOem8s-Ky1VMV5IvBYUgE8eHRFG3QsdiLis4_x2XiJV1pN9Z8lzOviVtANp0sdcp36ck3Dhgy_tg3nSvw4_di_gRHbuNo-eHCgkzWBTWYlZWKnKKO2aMirULyVBba_FsCsoMScyVHIKiAY8fkC9PxMhQ:1pEVRp:tY-xWOR9dJC6HDLsLkDr8a94bF49dRKB8OpPySvL9XE	2023-01-22 13:10:49.663956+00
fibcq2q864e1t6vbzkt3e0mk7gu5sio3	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pGHK6:T76QXQ9v1S0HmrXUUEy6qlkn6NIaqwgS9NaTocN6rC0	2023-01-27 10:30:10.957961+00
l0d99b9p53mo4ugj89gibar4np9i321y	.eJxVjDsOwjAQBe_iGln2xj9R0nMGa73r4ACypTipIu5OIqWA9s3M20TEdSlx7XmOE4ur0OLyuyWkV64H4CfWR5PU6jJPSR6KPGmX98b5fTvdv4OCvey1Dx4cDMmakA1lrVTKTjPhYNGw12H0Vo1gwZMFMLuokIgdB9IBwYjPF8fjN14:1pKI4p:IaKlVdQaw-HTHPaIoWGRzBDgjZEnhT2qsxyH_LaueLw	2023-02-07 12:06:59.141519+00
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
1	google-oauth2	shahan0020@gmail.com	{"auth_time": 1675077873, "expires": 3599, "token_type": "Bearer", "access_token": "ya29.a0AVvZVsrxwRxkMbL5XzHmBYrG7lP9E7Nkm7yFU1H0qHZvKNsDu1q1a8-VmGP2JPUeeZj17DTMwOADXG4T8oiuoyBScGD_nvJxSPCSloTQ8HUmQ1GAVaJ9Bq89uX7nb9Ou-dphU4IBngnejw9Rvezptv6_9beqaCgYKAZQSARESFQGbdwaIKSxxeaT8EFq9xpAbtwmaNw0163"}	36	2023-01-30 11:24:33.165017+00	2023-01-30 11:24:33.177579+00
2	google-oauth2	aliyevsahan@gmail.com	{"auth_time": 1675077955, "expires": 3599, "token_type": "Bearer", "access_token": "ya29.a0AVvZVsrR3mJ6ebDxFdwtTyxzWWpkJ8vfh0PcHgkCEoTKExkVT1xPcztMiDDbR01C3Q8O82W6FlM3QIhPWB9P5eA6_gXFUzF8h0oj1kwgKdxG5JFFgGOTZ1KfqGB5O1o0KNEn6xre8u29iu3xnd_DUuN76SX2aCgYKAbgSARISFQGbdwaIwSiTJLv3zlGfA1wM8QUKRA0163"}	37	2023-01-30 11:25:55.08124+00	2023-01-30 11:25:55.08624+00
\.


--
-- Name: Blog_blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Blog_blog_id_seq"', 13, true);


--
-- Name: Blog_blogcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Blog_blogcategory_id_seq"', 8, true);


--
-- Name: Blog_blogcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Blog_blogcomment_id_seq"', 41, true);


--
-- Name: Core_aboutus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Core_aboutus_id_seq"', 1, false);


--
-- Name: Core_contactus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Core_contactus_id_seq"', 1, false);


--
-- Name: Core_social_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Core_social_id_seq"', 1, false);


--
-- Name: Core_subscribeemail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Core_subscribeemail_id_seq"', 1, true);


--
-- Name: Order_basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Order_basket_id_seq"', 14, true);


--
-- Name: Order_basketitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Order_basketitem_id_seq"', 277, true);


--
-- Name: Order_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Order_wishlist_id_seq"', 137, true);


--
-- Name: Product_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Product_brand_id_seq"', 7, true);


--
-- Name: Product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Product_category_id_seq"', 25, true);


--
-- Name: Product_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Product_color_id_seq"', 9, true);


--
-- Name: Product_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Product_discount_id_seq"', 2, true);


--
-- Name: Product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Product_product_id_seq"', 6, true);


--
-- Name: Product_productversion_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Product_productversion_discount_id_seq"', 75, true);


--
-- Name: Product_productversion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Product_productversion_id_seq"', 22, true);


--
-- Name: Product_productversiondetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Product_productversiondetail_id_seq"', 36, true);


--
-- Name: Product_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Product_size_id_seq"', 10, true);


--
-- Name: Product_versionimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Product_versionimage_id_seq"', 27, true);


--
-- Name: Product_versionreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."Product_versionreview_id_seq"', 17, true);


--
-- Name: User_contactinformation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."User_contactinformation_id_seq"', 7, true);


--
-- Name: User_subsciriberemail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."User_subsciriberemail_id_seq"', 17, true);


--
-- Name: User_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."User_user_groups_id_seq"', 1, false);


--
-- Name: User_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."User_user_id_seq"', 37, true);


--
-- Name: User_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."User_user_user_permissions_id_seq"', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 156, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 638, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 9, true);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 7, true);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 39, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 105, true);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 2, true);


--
-- Name: Blog_blog Blog_blog_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Blog_blog"
    ADD CONSTRAINT "Blog_blog_pkey" PRIMARY KEY (id);


--
-- Name: Blog_blogcategory Blog_blogcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Blog_blogcategory"
    ADD CONSTRAINT "Blog_blogcategory_pkey" PRIMARY KEY (id);


--
-- Name: Blog_blogcomment Blog_blogcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Blog_blogcomment"
    ADD CONSTRAINT "Blog_blogcomment_pkey" PRIMARY KEY (id);


--
-- Name: Core_aboutus Core_aboutus_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Core_aboutus"
    ADD CONSTRAINT "Core_aboutus_pkey" PRIMARY KEY (id);


--
-- Name: Core_contactus Core_contactus_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Core_contactus"
    ADD CONSTRAINT "Core_contactus_pkey" PRIMARY KEY (id);


--
-- Name: Core_social Core_social_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Core_social"
    ADD CONSTRAINT "Core_social_pkey" PRIMARY KEY (id);


--
-- Name: Core_subscribeemail Core_subscribeemail_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Core_subscribeemail"
    ADD CONSTRAINT "Core_subscribeemail_pkey" PRIMARY KEY (id);


--
-- Name: Order_basket Order_basket_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Order_basket"
    ADD CONSTRAINT "Order_basket_pkey" PRIMARY KEY (id);


--
-- Name: Order_basketitem Order_basketitem_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Order_basketitem"
    ADD CONSTRAINT "Order_basketitem_pkey" PRIMARY KEY (id);


--
-- Name: Order_wishlist Order_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Order_wishlist"
    ADD CONSTRAINT "Order_wishlist_pkey" PRIMARY KEY (id);


--
-- Name: Product_brand Product_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_brand"
    ADD CONSTRAINT "Product_brand_pkey" PRIMARY KEY (id);


--
-- Name: Product_category Product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_category"
    ADD CONSTRAINT "Product_category_pkey" PRIMARY KEY (id);


--
-- Name: Product_color Product_color_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_color"
    ADD CONSTRAINT "Product_color_pkey" PRIMARY KEY (id);


--
-- Name: Product_discount Product_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_discount"
    ADD CONSTRAINT "Product_discount_pkey" PRIMARY KEY (id);


--
-- Name: Product_product Product_product_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_product"
    ADD CONSTRAINT "Product_product_pkey" PRIMARY KEY (id);


--
-- Name: Product_productversion_discount Product_productversion_d_productversion_id_discou_49135168_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_productversion_discount"
    ADD CONSTRAINT "Product_productversion_d_productversion_id_discou_49135168_uniq" UNIQUE (productversion_id, discount_id);


--
-- Name: Product_productversion_discount Product_productversion_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_productversion_discount"
    ADD CONSTRAINT "Product_productversion_discount_pkey" PRIMARY KEY (id);


--
-- Name: Product_productversion Product_productversion_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_productversion"
    ADD CONSTRAINT "Product_productversion_pkey" PRIMARY KEY (id);


--
-- Name: Product_productversiondetail Product_productversiondetail_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_productversiondetail"
    ADD CONSTRAINT "Product_productversiondetail_pkey" PRIMARY KEY (id);


--
-- Name: Product_size Product_size_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_size"
    ADD CONSTRAINT "Product_size_pkey" PRIMARY KEY (id);


--
-- Name: Product_versionimage Product_versionimage_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_versionimage"
    ADD CONSTRAINT "Product_versionimage_pkey" PRIMARY KEY (id);


--
-- Name: Product_versionreview Product_versionreview_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_versionreview"
    ADD CONSTRAINT "Product_versionreview_pkey" PRIMARY KEY (id);


--
-- Name: User_contactinformation User_contactinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_contactinformation"
    ADD CONSTRAINT "User_contactinformation_pkey" PRIMARY KEY (id);


--
-- Name: User_subsciriberemail User_subsciriberemail_email_827b6315_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_subsciriberemail"
    ADD CONSTRAINT "User_subsciriberemail_email_827b6315_uniq" UNIQUE (email);


--
-- Name: User_subsciriberemail User_subsciriberemail_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_subsciriberemail"
    ADD CONSTRAINT "User_subsciriberemail_pkey" PRIMARY KEY (id);


--
-- Name: User_user User_user_email_8849e89a_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_user"
    ADD CONSTRAINT "User_user_email_8849e89a_uniq" UNIQUE (email);


--
-- Name: User_user_groups User_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_user_groups"
    ADD CONSTRAINT "User_user_groups_pkey" PRIMARY KEY (id);


--
-- Name: User_user_groups User_user_groups_user_id_group_id_e1236af7_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_user_groups"
    ADD CONSTRAINT "User_user_groups_user_id_group_id_e1236af7_uniq" UNIQUE (user_id, group_id);


--
-- Name: User_user User_user_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_user"
    ADD CONSTRAINT "User_user_pkey" PRIMARY KEY (id);


--
-- Name: User_user_user_permissions User_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_user_user_permissions"
    ADD CONSTRAINT "User_user_user_permissions_pkey" PRIMARY KEY (id);


--
-- Name: User_user_user_permissions User_user_user_permissions_user_id_permission_id_f20e58ff_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_user_user_permissions"
    ADD CONSTRAINT "User_user_user_permissions_user_id_permission_id_f20e58ff_uniq" UNIQUE (user_id, permission_id);


--
-- Name: User_user User_user_username_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_user"
    ADD CONSTRAINT "User_user_username_key" UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: Blog_blog_category_id_0138f8a9; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Blog_blog_category_id_0138f8a9" ON public."Blog_blog" USING btree (category_id);


--
-- Name: Blog_blog_header_136e83_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Blog_blog_header_136e83_idx" ON public."Blog_blog" USING btree (header);


--
-- Name: Blog_blog_slug_294ca230; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Blog_blog_slug_294ca230" ON public."Blog_blog" USING btree (slug);


--
-- Name: Blog_blog_slug_294ca230_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Blog_blog_slug_294ca230_like" ON public."Blog_blog" USING btree (slug varchar_pattern_ops);


--
-- Name: Blog_blog_user_id_30790a38; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Blog_blog_user_id_30790a38" ON public."Blog_blog" USING btree (user_id);


--
-- Name: Blog_blogca_name_98f07c_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Blog_blogca_name_98f07c_idx" ON public."Blog_blogcategory" USING btree (name);


--
-- Name: Blog_blogcomment_blog_id_c8a950a7; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Blog_blogcomment_blog_id_c8a950a7" ON public."Blog_blogcomment" USING btree (blog_id);


--
-- Name: Blog_blogcomment_user_id_40eb5780; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Blog_blogcomment_user_id_40eb5780" ON public."Blog_blogcomment" USING btree (user_id);


--
-- Name: Core_social_us_id_ce696600; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Core_social_us_id_ce696600" ON public."Core_social" USING btree (us_id);


--
-- Name: Order_basket_user_id_0a8631f5; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Order_basket_user_id_0a8631f5" ON public."Order_basket" USING btree (user_id);


--
-- Name: Order_basketitem_basket_id_d0274554; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Order_basketitem_basket_id_d0274554" ON public."Order_basketitem" USING btree (basket_id);


--
-- Name: Order_basketitem_size_id_bd66651f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Order_basketitem_size_id_bd66651f" ON public."Order_basketitem" USING btree (size_id);


--
-- Name: Order_basketitem_version_id_6af22e76; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Order_basketitem_version_id_6af22e76" ON public."Order_basketitem" USING btree (version_id);


--
-- Name: Order_wishlist_user_id_11f8a804; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Order_wishlist_user_id_11f8a804" ON public."Order_wishlist" USING btree (user_id);


--
-- Name: Order_wishlist_version_id_4862ad97; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Order_wishlist_version_id_4862ad97" ON public."Order_wishlist" USING btree (version_id);


--
-- Name: Product_bra_name_168660_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_bra_name_168660_idx" ON public."Product_brand" USING btree (name);


--
-- Name: Product_brand_admin_id_bdfc6042; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_brand_admin_id_bdfc6042" ON public."Product_brand" USING btree (admin_id);


--
-- Name: Product_cat_name_1e8232_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_cat_name_1e8232_idx" ON public."Product_category" USING btree (name);


--
-- Name: Product_category_parent_id_4b9e6c44; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_category_parent_id_4b9e6c44" ON public."Product_category" USING btree (parent_id);


--
-- Name: Product_pro_name_026bf9_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_pro_name_026bf9_idx" ON public."Product_product" USING btree (name);


--
-- Name: Product_product_brand_id_752cf846; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_product_brand_id_752cf846" ON public."Product_product" USING btree (brand_id);


--
-- Name: Product_product_category_id_ded7ea18; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_product_category_id_ded7ea18" ON public."Product_product" USING btree (category_id);


--
-- Name: Product_productversion_color_id_03410d16; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_productversion_color_id_03410d16" ON public."Product_productversion" USING btree (color_id);


--
-- Name: Product_productversion_discount_discount_id_cca3d33e; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_productversion_discount_discount_id_cca3d33e" ON public."Product_productversion_discount" USING btree (discount_id);


--
-- Name: Product_productversion_discount_productversion_id_c5b8b283; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_productversion_discount_productversion_id_c5b8b283" ON public."Product_productversion_discount" USING btree (productversion_id);


--
-- Name: Product_productversion_product_id_72bd396c; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_productversion_product_id_72bd396c" ON public."Product_productversion" USING btree (product_id);


--
-- Name: Product_productversion_slug_ad054406; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_productversion_slug_ad054406" ON public."Product_productversion" USING btree (slug);


--
-- Name: Product_productversion_slug_ad054406_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_productversion_slug_ad054406_like" ON public."Product_productversion" USING btree (slug varchar_pattern_ops);


--
-- Name: Product_productversiondetail_size_id_5281b737; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_productversiondetail_size_id_5281b737" ON public."Product_productversiondetail" USING btree (size_id);


--
-- Name: Product_productversiondetail_version_id_127d1c14; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_productversiondetail_version_id_127d1c14" ON public."Product_productversiondetail" USING btree (version_id);


--
-- Name: Product_versionimage_version_id_2cebdaab; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_versionimage_version_id_2cebdaab" ON public."Product_versionimage" USING btree (version_id);


--
-- Name: Product_versionreview_user_id_1e4e3f74; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_versionreview_user_id_1e4e3f74" ON public."Product_versionreview" USING btree (user_id);


--
-- Name: Product_versionreview_version_id_b610a58b; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "Product_versionreview_version_id_b610a58b" ON public."Product_versionreview" USING btree (version_id);


--
-- Name: User_contactinformation_user_id_17bb51d4; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "User_contactinformation_user_id_17bb51d4" ON public."User_contactinformation" USING btree (user_id);


--
-- Name: User_subsciriberemail_email_827b6315_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "User_subsciriberemail_email_827b6315_like" ON public."User_subsciriberemail" USING btree (email varchar_pattern_ops);


--
-- Name: User_user_email_8849e89a_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "User_user_email_8849e89a_like" ON public."User_user" USING btree (email varchar_pattern_ops);


--
-- Name: User_user_groups_group_id_ca46cfeb; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "User_user_groups_group_id_ca46cfeb" ON public."User_user_groups" USING btree (group_id);


--
-- Name: User_user_groups_user_id_8a581615; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "User_user_groups_user_id_8a581615" ON public."User_user_groups" USING btree (user_id);


--
-- Name: User_user_user_permissions_permission_id_6ee76041; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "User_user_user_permissions_permission_id_6ee76041" ON public."User_user_user_permissions" USING btree (permission_id);


--
-- Name: User_user_user_permissions_user_id_321bdf68; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "User_user_user_permissions_user_id_321bdf68" ON public."User_user_user_permissions" USING btree (user_id);


--
-- Name: User_user_username_a2105554_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX "User_user_username_a2105554_like" ON public."User_user" USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: Blog_blog Blog_blog_category_id_0138f8a9_fk_Blog_blogcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Blog_blog"
    ADD CONSTRAINT "Blog_blog_category_id_0138f8a9_fk_Blog_blogcategory_id" FOREIGN KEY (category_id) REFERENCES public."Blog_blogcategory"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Blog_blog Blog_blog_user_id_30790a38_fk_User_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Blog_blog"
    ADD CONSTRAINT "Blog_blog_user_id_30790a38_fk_User_user_id" FOREIGN KEY (user_id) REFERENCES public."User_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Blog_blogcomment Blog_blogcomment_blog_id_c8a950a7_fk_Blog_blog_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Blog_blogcomment"
    ADD CONSTRAINT "Blog_blogcomment_blog_id_c8a950a7_fk_Blog_blog_id" FOREIGN KEY (blog_id) REFERENCES public."Blog_blog"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Blog_blogcomment Blog_blogcomment_user_id_40eb5780_fk_User_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Blog_blogcomment"
    ADD CONSTRAINT "Blog_blogcomment_user_id_40eb5780_fk_User_user_id" FOREIGN KEY (user_id) REFERENCES public."User_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Core_social Core_social_us_id_ce696600_fk_Core_aboutus_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Core_social"
    ADD CONSTRAINT "Core_social_us_id_ce696600_fk_Core_aboutus_id" FOREIGN KEY (us_id) REFERENCES public."Core_aboutus"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Order_basket Order_basket_user_id_0a8631f5_fk_User_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Order_basket"
    ADD CONSTRAINT "Order_basket_user_id_0a8631f5_fk_User_user_id" FOREIGN KEY (user_id) REFERENCES public."User_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Order_basketitem Order_basketitem_basket_id_d0274554_fk_Order_basket_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Order_basketitem"
    ADD CONSTRAINT "Order_basketitem_basket_id_d0274554_fk_Order_basket_id" FOREIGN KEY (basket_id) REFERENCES public."Order_basket"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Order_basketitem Order_basketitem_size_id_bd66651f_fk_Product_size_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Order_basketitem"
    ADD CONSTRAINT "Order_basketitem_size_id_bd66651f_fk_Product_size_id" FOREIGN KEY (size_id) REFERENCES public."Product_size"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Order_basketitem Order_basketitem_version_id_6af22e76_fk_Product_p; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Order_basketitem"
    ADD CONSTRAINT "Order_basketitem_version_id_6af22e76_fk_Product_p" FOREIGN KEY (version_id) REFERENCES public."Product_productversion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Order_wishlist Order_wishlist_user_id_11f8a804_fk_User_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Order_wishlist"
    ADD CONSTRAINT "Order_wishlist_user_id_11f8a804_fk_User_user_id" FOREIGN KEY (user_id) REFERENCES public."User_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Order_wishlist Order_wishlist_version_id_4862ad97_fk_Product_productversion_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Order_wishlist"
    ADD CONSTRAINT "Order_wishlist_version_id_4862ad97_fk_Product_productversion_id" FOREIGN KEY (version_id) REFERENCES public."Product_productversion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_brand Product_brand_admin_id_bdfc6042_fk_User_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_brand"
    ADD CONSTRAINT "Product_brand_admin_id_bdfc6042_fk_User_user_id" FOREIGN KEY (admin_id) REFERENCES public."User_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_category Product_category_parent_id_4b9e6c44_fk_Product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_category"
    ADD CONSTRAINT "Product_category_parent_id_4b9e6c44_fk_Product_category_id" FOREIGN KEY (parent_id) REFERENCES public."Product_category"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_product Product_product_brand_id_752cf846_fk_Product_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_product"
    ADD CONSTRAINT "Product_product_brand_id_752cf846_fk_Product_brand_id" FOREIGN KEY (brand_id) REFERENCES public."Product_brand"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_product Product_product_category_id_ded7ea18_fk_Product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_product"
    ADD CONSTRAINT "Product_product_category_id_ded7ea18_fk_Product_category_id" FOREIGN KEY (category_id) REFERENCES public."Product_category"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_productversion_discount Product_productversi_discount_id_cca3d33e_fk_Product_d; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_productversion_discount"
    ADD CONSTRAINT "Product_productversi_discount_id_cca3d33e_fk_Product_d" FOREIGN KEY (discount_id) REFERENCES public."Product_discount"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_productversion Product_productversi_product_id_72bd396c_fk_Product_p; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_productversion"
    ADD CONSTRAINT "Product_productversi_product_id_72bd396c_fk_Product_p" FOREIGN KEY (product_id) REFERENCES public."Product_product"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_productversion_discount Product_productversi_productversion_id_c5b8b283_fk_Product_p; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_productversion_discount"
    ADD CONSTRAINT "Product_productversi_productversion_id_c5b8b283_fk_Product_p" FOREIGN KEY (productversion_id) REFERENCES public."Product_productversion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_productversiondetail Product_productversi_size_id_5281b737_fk_Product_s; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_productversiondetail"
    ADD CONSTRAINT "Product_productversi_size_id_5281b737_fk_Product_s" FOREIGN KEY (size_id) REFERENCES public."Product_size"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_productversiondetail Product_productversi_version_id_127d1c14_fk_Product_p; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_productversiondetail"
    ADD CONSTRAINT "Product_productversi_version_id_127d1c14_fk_Product_p" FOREIGN KEY (version_id) REFERENCES public."Product_productversion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_productversion Product_productversion_color_id_03410d16_fk_Product_color_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_productversion"
    ADD CONSTRAINT "Product_productversion_color_id_03410d16_fk_Product_color_id" FOREIGN KEY (color_id) REFERENCES public."Product_color"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_versionimage Product_versionimage_version_id_2cebdaab_fk_Product_p; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_versionimage"
    ADD CONSTRAINT "Product_versionimage_version_id_2cebdaab_fk_Product_p" FOREIGN KEY (version_id) REFERENCES public."Product_productversion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_versionreview Product_versionrevie_version_id_b610a58b_fk_Product_p; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_versionreview"
    ADD CONSTRAINT "Product_versionrevie_version_id_b610a58b_fk_Product_p" FOREIGN KEY (version_id) REFERENCES public."Product_productversion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_versionreview Product_versionreview_user_id_1e4e3f74_fk_User_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."Product_versionreview"
    ADD CONSTRAINT "Product_versionreview_user_id_1e4e3f74_fk_User_user_id" FOREIGN KEY (user_id) REFERENCES public."User_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: User_contactinformation User_contactinformation_user_id_17bb51d4_fk_User_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_contactinformation"
    ADD CONSTRAINT "User_contactinformation_user_id_17bb51d4_fk_User_user_id" FOREIGN KEY (user_id) REFERENCES public."User_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: User_user_groups User_user_groups_group_id_ca46cfeb_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_user_groups"
    ADD CONSTRAINT "User_user_groups_group_id_ca46cfeb_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: User_user_groups User_user_groups_user_id_8a581615_fk_User_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_user_groups"
    ADD CONSTRAINT "User_user_groups_user_id_8a581615_fk_User_user_id" FOREIGN KEY (user_id) REFERENCES public."User_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: User_user_user_permissions User_user_user_permi_permission_id_6ee76041_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_user_user_permissions"
    ADD CONSTRAINT "User_user_user_permi_permission_id_6ee76041_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: User_user_user_permissions User_user_user_permissions_user_id_321bdf68_fk_User_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."User_user_user_permissions"
    ADD CONSTRAINT "User_user_user_permissions_user_id_321bdf68_fk_User_user_id" FOREIGN KEY (user_id) REFERENCES public."User_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_User_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_User_user_id" FOREIGN KEY (user_id) REFERENCES public."User_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_User_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT "social_auth_usersocialauth_user_id_17d28448_fk_User_user_id" FOREIGN KEY (user_id) REFERENCES public."User_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

