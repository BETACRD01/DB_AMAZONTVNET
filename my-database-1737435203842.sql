--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (PGlite 0.2.0)
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

--
-- Name: meta; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA meta;


ALTER SCHEMA meta OWNER TO postgres;

--
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;


--
-- Name: EXTENSION vector; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: embeddings; Type: TABLE; Schema: meta; Owner: postgres
--

CREATE TABLE meta.embeddings (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    content text NOT NULL,
    embedding public.vector(384) NOT NULL
);


ALTER TABLE meta.embeddings OWNER TO postgres;

--
-- Name: embeddings_id_seq; Type: SEQUENCE; Schema: meta; Owner: postgres
--

ALTER TABLE meta.embeddings ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME meta.embeddings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: migrations; Type: TABLE; Schema: meta; Owner: postgres
--

CREATE TABLE meta.migrations (
    version text NOT NULL,
    name text,
    applied_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE meta.migrations OWNER TO postgres;

--
-- Name: banco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banco (
    id_banco bigint NOT NULL,
    nocuenta character varying(20),
    nombre_banco character varying(60)
);


ALTER TABLE public.banco OWNER TO postgres;

--
-- Name: banco_id_banco_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banco_id_banco_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banco_id_banco_seq OWNER TO postgres;

--
-- Name: color_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.color_vehiculo (
    id_color_vehiculo bigint NOT NULL,
    descripcion character varying(255),
    estado integer
);


ALTER TABLE public.color_vehiculo OWNER TO postgres;

--
-- Name: color_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.color_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.color_vehiculo_id_seq OWNER TO postgres;

--
-- Name: combustible; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combustible (
    id_combustible bigint NOT NULL,
    descripcion character varying(255),
    estado integer,
    octanaje character varying(255)
);


ALTER TABLE public.combustible OWNER TO postgres;

--
-- Name: combustible_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.combustible_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.combustible_id_seq OWNER TO postgres;

--
-- Name: consumo_combustible; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumo_combustible (
    id_consumo_combustible bigint NOT NULL,
    estado integer NOT NULL,
    id_combustible bigint,
    id_orden_combustible bigint
);


ALTER TABLE public.consumo_combustible OWNER TO postgres;

--
-- Name: consumo_combustible_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consumo_combustible_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.consumo_combustible_id_seq OWNER TO postgres;

--
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamento (
    id_departamento bigint NOT NULL,
    descripcion_departamento text,
    nombre_departamento character varying(100)
);


ALTER TABLE public.departamento OWNER TO postgres;

--
-- Name: departamento_id_departamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamento_id_departamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamento_id_departamento_seq OWNER TO postgres;

--
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    id_empleado bigint NOT NULL,
    apellidos character varying(100),
    direccion character varying(250),
    estado boolean,
    identificacion character varying(13),
    nombres character varying(100),
    telefono character varying(13),
    codigo integer NOT NULL,
    cambio date,
    cargo character varying(255),
    clave character varying(255),
    codigotemporal character varying(255),
    cuenta character varying(255),
    discapacidad boolean,
    disdescripcion character varying(255),
    disporcentaje integer,
    email character varying(255),
    estadocivil character varying(255),
    fechacaducidad date,
    fechaemision date,
    matricula boolean,
    meses integer,
    movil character varying(255),
    nacimiento date,
    pantalla character varying(255),
    tipo character varying(255),
    tipocuenta character varying(255),
    tipoidentificacion character varying(255),
    usuario character varying(255)
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- Name: empleado_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleado_id_empleado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empleado_id_empleado_seq OWNER TO postgres;

--
-- Name: empleadp_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleadp_id_empleado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empleadp_id_empleado_seq OWNER TO postgres;

--
-- Name: marca_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca_vehiculo (
    id_marca_vehiculo bigint NOT NULL,
    descripcion character varying(255),
    estado integer
);


ALTER TABLE public.marca_vehiculo OWNER TO postgres;

--
-- Name: marca_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marca_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.marca_vehiculo_id_seq OWNER TO postgres;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id_menu bigint NOT NULL,
    icono_menu character varying(50),
    nombre_menu character varying(20)
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_id_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_id_menu_seq OWNER TO postgres;

--
-- Name: nomcargafamiliar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nomcargafamiliar (
    id_nomcargafamiliar bigint NOT NULL,
    apellidos character varying(255),
    direccion character varying(255),
    disdescripcion character varying(255),
    disporcentaje integer,
    estado boolean,
    fechanacimiento date,
    identificacion character varying(255),
    nom_parentesco character varying(255),
    nombres character varying(255),
    telefono character varying(255),
    tipoid character varying(255),
    id_usuario bigint,
    discapacidad boolean
);


ALTER TABLE public.nomcargafamiliar OWNER TO postgres;

--
-- Name: nomcargafamiliar_id_nomcargafamiliar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nomcargafamiliar_id_nomcargafamiliar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nomcargafamiliar_id_nomcargafamiliar_seq OWNER TO postgres;

--
-- Name: orden_combustible; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden_combustible (
    id_orden_combustible bigint NOT NULL,
    estado integer,
    estado_orden integer NOT NULL,
    fecha_anulacion timestamp(6) without time zone,
    fecha_autorizacion timestamp(6) without time zone,
    fecha_compra timestamp(6) without time zone,
    fecha_envio timestamp(6) without time zone,
    fecha_finalizacion timestamp(6) without time zone,
    fecha_orden timestamp(6) without time zone,
    justificacion character varying(255),
    kilometraje_carga numeric(19,2),
    numero_galones numeric(19,2),
    numero_orden character varying(255),
    observacion character varying(255),
    observacion_administrador character varying(255),
    valor_compra numeric(19,2),
    voucher character varying(255),
    id_combustible bigint,
    id_proveedor_combustible bigint,
    id_tipo_documento bigint,
    id_vehiculo bigint
);


ALTER TABLE public.orden_combustible OWNER TO postgres;

--
-- Name: orden_combustible_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orden_combustible_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orden_combustible_id_seq OWNER TO postgres;

--
-- Name: orden_mantenimiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden_mantenimiento (
    id_orden_mantenimiento bigint NOT NULL,
    cambio_repuesto boolean,
    descripcion character varying(255),
    especificacion character varying(255),
    estado integer,
    estado_orden integer,
    fecha_anulacion timestamp(6) without time zone,
    fecha_autorizacion timestamp(6) without time zone,
    fecha_envio timestamp(6) without time zone,
    fecha_finalizacion timestamp(6) without time zone,
    fecha_mantenimiento timestamp(6) without time zone,
    fecha_orden timestamp(6) without time zone,
    justificacion_anulacion character varying(255),
    kilometraje_actual numeric(19,2),
    kilometraje_ingreso numeric(19,2),
    kilometraje_retorno numeric(19,2),
    lugar_mantenimiento character varying(255),
    numero_orden character varying(255),
    observacion character varying(255),
    observacion_administrador character varying(255),
    razon_orden character varying(255),
    id_taller_autorizado bigint,
    id_tipo_documento bigint,
    id_vehiculo bigint
);


ALTER TABLE public.orden_mantenimiento OWNER TO postgres;

--
-- Name: orden_mantenimiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orden_mantenimiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orden_mantenimiento_id_seq OWNER TO postgres;

--
-- Name: permiso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permiso (
    id_permiso bigint NOT NULL,
    activo boolean,
    permiso_actualizar boolean,
    permiso_crear boolean,
    permiso_eliminar boolean,
    permiso_leer boolean,
    id_rol bigint,
    id_submenu bigint
);


ALTER TABLE public.permiso OWNER TO postgres;

--
-- Name: permiso_id_permiso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permiso_id_permiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permiso_id_permiso_seq OWNER TO postgres;

--
-- Name: proveedor_combustible; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedor_combustible (
    id_proveedor_combustible bigint NOT NULL,
    estado integer,
    nombre character varying(255)
);


ALTER TABLE public.proveedor_combustible OWNER TO postgres;

--
-- Name: proveedor_combustible_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedor_combustible_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proveedor_combustible_id_seq OWNER TO postgres;

--
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol (
    id_rol bigint NOT NULL,
    nombre_rol character varying(30)
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rol_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rol_id_rol_seq OWNER TO postgres;

--
-- Name: secuencia_documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.secuencia_documento (
    id_secuencia_documento bigint NOT NULL,
    descripcion character varying(120),
    estado integer,
    incremental integer,
    prefijo character varying(255),
    sufijo character varying(255),
    valor_actual integer,
    tipo_documento_id bigint
);


ALTER TABLE public.secuencia_documento OWNER TO postgres;

--
-- Name: secuencia_documento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.secuencia_documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.secuencia_documento_id_seq OWNER TO postgres;

--
-- Name: servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicio (
    id_servicio bigint NOT NULL,
    estado integer,
    nombre character varying(255)
);


ALTER TABLE public.servicio OWNER TO postgres;

--
-- Name: servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servicio_id_seq OWNER TO postgres;

--
-- Name: servicio_mantenimiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicio_mantenimiento (
    id_servicio_mantenimiento bigint NOT NULL,
    estado integer,
    id_orden_mantenimiento bigint,
    id_servicio bigint
);


ALTER TABLE public.servicio_mantenimiento OWNER TO postgres;

--
-- Name: servicio_mantenimiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicio_mantenimiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servicio_mantenimiento_id_seq OWNER TO postgres;

--
-- Name: submenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.submenu (
    id_submenu bigint NOT NULL,
    icono_submenu character varying(50),
    nombre_formulario character varying(60),
    nombre_submenu character varying(60),
    url character varying(200),
    id_menu bigint
);


ALTER TABLE public.submenu OWNER TO postgres;

--
-- Name: submenu_id_submenu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.submenu_id_submenu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submenu_id_submenu_seq OWNER TO postgres;

--
-- Name: taller_autorizado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taller_autorizado (
    id_taller_autorizado bigint NOT NULL,
    correo character varying(255),
    direccion character varying(255),
    estado integer,
    nombre character varying(255),
    propietario character varying(255),
    telefono character varying(255)
);


ALTER TABLE public.taller_autorizado OWNER TO postgres;

--
-- Name: taller_autorizado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taller_autorizado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.taller_autorizado_id_seq OWNER TO postgres;

--
-- Name: tipo_documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_documento (
    id_tipo_documento bigint NOT NULL,
    descripcion character varying(120),
    detalle character varying(40),
    estado integer
);


ALTER TABLE public.tipo_documento OWNER TO postgres;

--
-- Name: tipo_documento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_documento_id_seq OWNER TO postgres;

--
-- Name: tipo_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_vehiculo (
    id_tipo_vehiculo bigint NOT NULL,
    descripcion character varying(255),
    estado integer
);


ALTER TABLE public.tipo_vehiculo OWNER TO postgres;

--
-- Name: tipo_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_vehiculo_id_seq OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario bigint NOT NULL,
    clave character varying(255),
    nombre_usuario character varying(20),
    usuario character varying(255),
    id_rol bigint,
    apellidos character varying(255),
    cambio date,
    cargo character varying(255),
    codigotemporal character varying(255),
    cuenta character varying(255),
    direccion character varying(255),
    discapacidad boolean,
    disdescripcion character varying(255),
    disporcentaje integer,
    email character varying(255),
    estado boolean,
    estadocivil character varying(255),
    fechacaducidad date,
    fechaemision date,
    identificacion character varying(255),
    matricula boolean,
    meses integer,
    movil character varying(255),
    nacimiento date,
    nombres character varying(255),
    pantalla character varying(255),
    telefono character varying(255),
    tipo character varying(255),
    tipocuenta character varying(255),
    tipoidentificacion character varying(255),
    id_banco bigint,
    id_departamento bigint
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehiculo (
    id_vehiculo bigint NOT NULL,
    anio integer,
    estado integer,
    kilometraje numeric(19,2),
    placa character varying(255),
    cantidad_tanqueo numeric(19,2),
    id_color_vehiculo bigint,
    id_combustible bigint,
    id_marca_vehiculo bigint,
    id_tipo_vehiculo bigint
);


ALTER TABLE public.vehiculo OWNER TO postgres;

--
-- Name: vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehiculo_id_seq OWNER TO postgres;

--
-- Data for Name: embeddings; Type: TABLE DATA; Schema: meta; Owner: postgres
--



--
-- Data for Name: migrations; Type: TABLE DATA; Schema: meta; Owner: postgres
--

INSERT INTO meta.migrations VALUES ('202407160001', 'embeddings', '2025-01-10 03:11:41.569+00');


--
-- Data for Name: banco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.banco VALUES (1, NULL, 'PICHINCHA');
INSERT INTO public.banco VALUES (2, NULL, 'AUSTRO');
INSERT INTO public.banco VALUES (3, NULL, 'COOP. TENA LTDA.');


--
-- Data for Name: color_vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: combustible; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: consumo_combustible; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamento VALUES (1, 'ENCARGADOS DE CAPTAR CLIENTES', 'VENTAS');
INSERT INTO public.departamento VALUES (2, 'ENCARGADO DE SOPORTE Y MANTENIMIENTO DE LAS REDES DE INTERNET', 'TECNICOS');
INSERT INTO public.departamento VALUES (3, NULL, 'RECURSOS HUMANOS');
INSERT INTO public.departamento VALUES (4, NULL, 'ADMINISTRATIVO');
INSERT INTO public.departamento VALUES (5, NULL, 'MARKETING');


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: marca_vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.menu VALUES (1, 'fas fa-tools', 'ADMINISTRACION');
INSERT INTO public.menu VALUES (2, 'fas fa-user', 'PERSONAS');
INSERT INTO public.menu VALUES (3, 'fas fa-check', 'ASISTENCIA');


--
-- Data for Name: nomcargafamiliar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nomcargafamiliar VALUES (4, 'ROMERO ANDY', 'ARDHIDONA, SANTA RITA', '', 0, true, '2020-01-26', '1501098987', 'HIJO/A', 'DANIEL ALEXANDER', NULL, 'C', 3, false);
INSERT INTO public.nomcargafamiliar VALUES (3, 'ROMERO ANDY', 'ARCHIDONA, SANTA RITA, BARRIO AMAZONAS', '', 0, true, '2015-03-28', '1509898765', 'HIJO/A', 'MAILEN KARELYS', NULL, 'C', 3, false);
INSERT INTO public.nomcargafamiliar VALUES (5, 'ROMERO PALATE', 'ARCHIDONA, SANTA RITA', '', 0, true, '1990-02-08', '1721059127', 'UNIÓN DE HECHO', 'WILSON HERNAN', NULL, 'C', 3, false);
INSERT INTO public.nomcargafamiliar VALUES (6, 'ROMERO ANDY', 'sdsdsd', '', 0, true, '2025-01-05', '1501092837', 'HIJO/A', 'MAURICIO', NULL, 'C', 5, false);
INSERT INTO public.nomcargafamiliar VALUES (7, 'valladares', 'smsmsmd d dmdmd ', 'dfdfsdf', 0, true, '2025-01-08', '1500762917', 'HIJO/A', 'shair', NULL, 'C', 7, false);


--
-- Data for Name: orden_combustible; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: orden_mantenimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.permiso VALUES (2, true, true, true, true, true, 1, 2);
INSERT INTO public.permiso VALUES (3, true, true, true, true, true, 1, 3);
INSERT INTO public.permiso VALUES (4, true, true, true, true, true, 1, 4);
INSERT INTO public.permiso VALUES (5, true, true, true, true, true, 1, 5);
INSERT INTO public.permiso VALUES (1, true, true, true, true, true, 1, 1);


--
-- Data for Name: proveedor_combustible; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rol VALUES (1, 'ADMINISTRADOR');


--
-- Data for Name: secuencia_documento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: servicio_mantenimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: submenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.submenu VALUES (2, 'fas fa-key', 'frmPermiso', 'Permiso', '/empleado/faces/pages/management/permisos.xhtml', 1);
INSERT INTO public.submenu VALUES (3, 'fas fa-briefcase', 'frmDepartamento', 'Departamento', '/empleado/faces/pages/management/departamento.xhtml', 1);
INSERT INTO public.submenu VALUES (4, 'fas fa-landmark', 'frmBanco', 'Banco', '/empleado/faces/pages/management/banco.xhtml', 1);
INSERT INTO public.submenu VALUES (1, 'fas fa-user-shield', 'frmRol', 'Rol', '/empleado/faces/pages/management/rol.xhtml', 1);
INSERT INTO public.submenu VALUES (5, 'fa fa-users', 'frmEmpleado', 'Empleados', '/empleado/faces/pages/management/empleados.xhtml', 2);


--
-- Data for Name: taller_autorizado; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tipo_documento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tipo_vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES (1, '328fe8496a99b986fef5f3713564838663b51870395645b99364ed27f8b9b74e2d3df0a64d28c666a1abcd72e95826db47926dd7acb01768d96b30e1e29894d3', 'WILSON HERNAN', 'romero', 1, 'ROMERO PALATE', '2024-12-25', 'DIRECTOR TÉCNICO', NULL, '22794', 'ARCHIDONA, SANTA RITA', true, 'aaaaaaa', 5, 'romerowilsonhernan@gmail.com', true, 'SOLTERO/A', '2025-01-01', '2021-01-01', '1721059127', true, NULL, '0994349534', '1990-02-08', 'WILSON HERNAN', 'Interna', '(06) 2770-429', NULL, NULL, 'C', 1, 2);
INSERT INTO public.usuario VALUES (3, NULL, NULL, NULL, NULL, 'ANDY TAPUY', '2025-01-01', 'JEFE TECNICO', NULL, '22000000', 'ARCHDIONA, SANTA RITA', false, '', 0, 'adelaida@gmail.com', true, 'SOLTERO/A', '2027-01-29', '2025-01-01', '1500943707', true, NULL, '0979876765', '1995-04-16', 'ADELAIDA BELEN', 'Interna', '(06) 2877-230', NULL, 'AHORROS', 'C', 1, 1);
INSERT INTO public.usuario VALUES (5, NULL, NULL, NULL, NULL, 'asas', '2025-01-05', 'JEFE DE VENTAS', NULL, '22444444', 'assas', false, '', 0, 'adelaida@gmail.com', true, 'SOLTERO/A', '2025-01-05', '2025-01-05', '121212', true, NULL, '1212222222', '2025-01-01', 'assa', 'Interna', '(12) 1212-121', NULL, 'AHORROS', 'C', 1, 1);
INSERT INTO public.usuario VALUES (7, NULL, NULL, NULL, NULL, 'Valladares', '2025-01-07', 'tecnico jr', NULL, '36363636363', ' cakke 1 a', false, 'nada', 0, 'wilshito@gmail.com', true, 'SOLTERO/A', '2025-01-07', '2025-01-06', '1716865488', true, NULL, '0980394199', '2025-01-08', 'Wilson', 'Interna', '(09) 8039-499', NULL, 'AHORROS', 'C', 1, 2);
INSERT INTO public.usuario VALUES (6, NULL, NULL, NULL, NULL, 'asasas', '2025-01-01', 'JEFE DE VENTAS', NULL, '22000000', 'addsd', false, '', 0, 'adelaida@gmail.com', false, 'SOLTERO/A', '2025-01-01', '2025-01-01', '232323', true, NULL, '2323232333', '2025-01-01', 'asasas', 'Interna', '(32) 3232-323', NULL, 'AHORROS', 'C', 1, 1);


--
-- Data for Name: vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: embeddings_id_seq; Type: SEQUENCE SET; Schema: meta; Owner: postgres
--

SELECT pg_catalog.setval('meta.embeddings_id_seq', 1, false);


--
-- Name: banco_id_banco_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banco_id_banco_seq', 3, true);


--
-- Name: color_vehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.color_vehiculo_id_seq', 1, false);


--
-- Name: combustible_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.combustible_id_seq', 1, false);


--
-- Name: consumo_combustible_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consumo_combustible_id_seq', 1, false);


--
-- Name: departamento_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamento_id_departamento_seq', 1, true);


--
-- Name: empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_id_empleado_seq', 1, false);


--
-- Name: empleadp_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleadp_id_empleado_seq', 1, false);


--
-- Name: marca_vehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marca_vehiculo_id_seq', 1, false);


--
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_id_menu_seq', 1, false);


--
-- Name: nomcargafamiliar_id_nomcargafamiliar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nomcargafamiliar_id_nomcargafamiliar_seq', 7, true);


--
-- Name: orden_combustible_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orden_combustible_id_seq', 1, false);


--
-- Name: orden_mantenimiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orden_mantenimiento_id_seq', 1, false);


--
-- Name: permiso_id_permiso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permiso_id_permiso_seq', 1, false);


--
-- Name: proveedor_combustible_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedor_combustible_id_seq', 1, false);


--
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_id_rol_seq', 1, false);


--
-- Name: secuencia_documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.secuencia_documento_id_seq', 1, false);


--
-- Name: servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicio_id_seq', 1, false);


--
-- Name: servicio_mantenimiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicio_mantenimiento_id_seq', 1, false);


--
-- Name: submenu_id_submenu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.submenu_id_submenu_seq', 1, false);


--
-- Name: taller_autorizado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taller_autorizado_id_seq', 1, false);


--
-- Name: tipo_documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_documento_id_seq', 1, false);


--
-- Name: tipo_vehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_vehiculo_id_seq', 1, false);


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 7, true);


--
-- Name: vehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehiculo_id_seq', 1, false);


--
-- Name: embeddings embeddings_pkey; Type: CONSTRAINT; Schema: meta; Owner: postgres
--

ALTER TABLE ONLY meta.embeddings
    ADD CONSTRAINT embeddings_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: meta; Owner: postgres
--

ALTER TABLE ONLY meta.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: banco banco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (id_banco);


--
-- Name: color_vehiculo color_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color_vehiculo
    ADD CONSTRAINT color_vehiculo_pkey PRIMARY KEY (id_color_vehiculo);


--
-- Name: combustible combustible_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combustible
    ADD CONSTRAINT combustible_pkey PRIMARY KEY (id_combustible);


--
-- Name: consumo_combustible consumo_combustible_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumo_combustible
    ADD CONSTRAINT consumo_combustible_pkey PRIMARY KEY (id_consumo_combustible);


--
-- Name: departamento departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id_departamento);


--
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);


--
-- Name: marca_vehiculo marca_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca_vehiculo
    ADD CONSTRAINT marca_vehiculo_pkey PRIMARY KEY (id_marca_vehiculo);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);


--
-- Name: nomcargafamiliar nomcargafamiliar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomcargafamiliar
    ADD CONSTRAINT nomcargafamiliar_pkey PRIMARY KEY (id_nomcargafamiliar);


--
-- Name: orden_combustible orden_combustible_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_combustible
    ADD CONSTRAINT orden_combustible_pkey PRIMARY KEY (id_orden_combustible);


--
-- Name: orden_mantenimiento orden_mantenimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_mantenimiento
    ADD CONSTRAINT orden_mantenimiento_pkey PRIMARY KEY (id_orden_mantenimiento);


--
-- Name: permiso permiso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (id_permiso);


--
-- Name: proveedor_combustible proveedor_combustible_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor_combustible
    ADD CONSTRAINT proveedor_combustible_pkey PRIMARY KEY (id_proveedor_combustible);


--
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);


--
-- Name: secuencia_documento secuencia_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secuencia_documento
    ADD CONSTRAINT secuencia_documento_pkey PRIMARY KEY (id_secuencia_documento);


--
-- Name: servicio_mantenimiento servicio_mantenimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio_mantenimiento
    ADD CONSTRAINT servicio_mantenimiento_pkey PRIMARY KEY (id_servicio_mantenimiento);


--
-- Name: servicio servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (id_servicio);


--
-- Name: submenu submenu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submenu
    ADD CONSTRAINT submenu_pkey PRIMARY KEY (id_submenu);


--
-- Name: taller_autorizado taller_autorizado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taller_autorizado
    ADD CONSTRAINT taller_autorizado_pkey PRIMARY KEY (id_taller_autorizado);


--
-- Name: tipo_documento tipo_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_pkey PRIMARY KEY (id_tipo_documento);


--
-- Name: tipo_vehiculo tipo_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_vehiculo
    ADD CONSTRAINT tipo_vehiculo_pkey PRIMARY KEY (id_tipo_vehiculo);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- Name: vehiculo vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (id_vehiculo);


--
-- Name: orden_combustible fk1d5pygli6kq1rho93rv63pemv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_combustible
    ADD CONSTRAINT fk1d5pygli6kq1rho93rv63pemv FOREIGN KEY (id_proveedor_combustible) REFERENCES public.proveedor_combustible(id_proveedor_combustible);


--
-- Name: permiso fk2pkjkorv7ljvcpl6n5fgv26rl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT fk2pkjkorv7ljvcpl6n5fgv26rl FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);


--
-- Name: orden_mantenimiento fk6glb3dkg9xneg0eyrsohxq3vn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_mantenimiento
    ADD CONSTRAINT fk6glb3dkg9xneg0eyrsohxq3vn FOREIGN KEY (id_tipo_documento) REFERENCES public.tipo_documento(id_tipo_documento);


--
-- Name: orden_mantenimiento fk798gotq2mwtp9je0m1gy8jw82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_mantenimiento
    ADD CONSTRAINT fk798gotq2mwtp9je0m1gy8jw82 FOREIGN KEY (id_taller_autorizado) REFERENCES public.taller_autorizado(id_taller_autorizado);


--
-- Name: servicio_mantenimiento fk9fb2tajgkag882ib546c9twe1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio_mantenimiento
    ADD CONSTRAINT fk9fb2tajgkag882ib546c9twe1 FOREIGN KEY (id_servicio) REFERENCES public.servicio(id_servicio);


--
-- Name: usuario fka3yk6ipw357rppcd2oaj91g7s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fka3yk6ipw357rppcd2oaj91g7s FOREIGN KEY (id_banco) REFERENCES public.banco(id_banco);


--
-- Name: nomcargafamiliar fka4p8m7ngel73pvjju4tdexfq1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomcargafamiliar
    ADD CONSTRAINT fka4p8m7ngel73pvjju4tdexfq1 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: vehiculo fkaffxja0p4aonn4mw1h8cvmohn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT fkaffxja0p4aonn4mw1h8cvmohn FOREIGN KEY (id_combustible) REFERENCES public.combustible(id_combustible);


--
-- Name: orden_combustible fkbjfk4shs2k4ikogl4mfynkyod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_combustible
    ADD CONSTRAINT fkbjfk4shs2k4ikogl4mfynkyod FOREIGN KEY (id_combustible) REFERENCES public.combustible(id_combustible);


--
-- Name: consumo_combustible fkcuuxau7w1e6e15bgka8nggsdr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumo_combustible
    ADD CONSTRAINT fkcuuxau7w1e6e15bgka8nggsdr FOREIGN KEY (id_orden_combustible) REFERENCES public.orden_combustible(id_orden_combustible);


--
-- Name: orden_mantenimiento fkdof50ggkj1bx0xid2yfgyy73u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_mantenimiento
    ADD CONSTRAINT fkdof50ggkj1bx0xid2yfgyy73u FOREIGN KEY (id_vehiculo) REFERENCES public.vehiculo(id_vehiculo);


--
-- Name: orden_combustible fkehf2sue983fvrbnlp20ge7s42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_combustible
    ADD CONSTRAINT fkehf2sue983fvrbnlp20ge7s42 FOREIGN KEY (id_tipo_documento) REFERENCES public.tipo_documento(id_tipo_documento);


--
-- Name: usuario fkfjrcatmd50ywwe1o2bn99whr8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkfjrcatmd50ywwe1o2bn99whr8 FOREIGN KEY (id_departamento) REFERENCES public.departamento(id_departamento);


--
-- Name: secuencia_documento fkghi08mg0hraujf4eh2k161vo9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secuencia_documento
    ADD CONSTRAINT fkghi08mg0hraujf4eh2k161vo9 FOREIGN KEY (tipo_documento_id) REFERENCES public.tipo_documento(id_tipo_documento);


--
-- Name: consumo_combustible fkh7ifphj1r24dv9wiclm9fu9ql; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumo_combustible
    ADD CONSTRAINT fkh7ifphj1r24dv9wiclm9fu9ql FOREIGN KEY (id_combustible) REFERENCES public.combustible(id_combustible);


--
-- Name: vehiculo fkitwfp7ulbb7r8be6mfl551pm2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT fkitwfp7ulbb7r8be6mfl551pm2 FOREIGN KEY (id_color_vehiculo) REFERENCES public.color_vehiculo(id_color_vehiculo);


--
-- Name: orden_combustible fkiyn59bmtslsep7y0h3mggqnw9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_combustible
    ADD CONSTRAINT fkiyn59bmtslsep7y0h3mggqnw9 FOREIGN KEY (id_vehiculo) REFERENCES public.vehiculo(id_vehiculo);


--
-- Name: vehiculo fkjxput0e6n011tfd1a3xvg0t8g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT fkjxput0e6n011tfd1a3xvg0t8g FOREIGN KEY (id_tipo_vehiculo) REFERENCES public.tipo_vehiculo(id_tipo_vehiculo);


--
-- Name: permiso fkk91v5nnau7v1jv0wss6mgt8hk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT fkk91v5nnau7v1jv0wss6mgt8hk FOREIGN KEY (id_submenu) REFERENCES public.submenu(id_submenu);


--
-- Name: usuario fkmyv3138vvci6kaq3y5kt4cntu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkmyv3138vvci6kaq3y5kt4cntu FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);


--
-- Name: submenu fknvky3hw0sdhneuj2idrb83iec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submenu
    ADD CONSTRAINT fknvky3hw0sdhneuj2idrb83iec FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);


--
-- Name: vehiculo fkphk6ped5t38fasoij4dbu4w2a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT fkphk6ped5t38fasoij4dbu4w2a FOREIGN KEY (id_marca_vehiculo) REFERENCES public.marca_vehiculo(id_marca_vehiculo);


--
-- Name: servicio_mantenimiento fkqqd4n0gwcreue4r42y8c0qy7d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio_mantenimiento
    ADD CONSTRAINT fkqqd4n0gwcreue4r42y8c0qy7d FOREIGN KEY (id_orden_mantenimiento) REFERENCES public.orden_mantenimiento(id_orden_mantenimiento);


--
-- PostgreSQL database dump complete
--

