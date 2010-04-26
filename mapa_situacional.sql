--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alocacoes; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE alocacoes (
    projeto_id integer NOT NULL,
    pessoa_id integer NOT NULL,
    papel_id integer NOT NULL,
    data_inicio date NOT NULL,
    data_fim date NOT NULL
);


ALTER TABLE public.alocacoes OWNER TO fila;

--
-- Name: cargos; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE cargos (
    cargo_id integer NOT NULL,
    data_inicio date,
    data_fim date,
    descricao character varying(100) NOT NULL
);


ALTER TABLE public.cargos OWNER TO fila;

--
-- Name: cargos_cargo_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE cargos_cargo_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cargos_cargo_id_seq OWNER TO fila;

--
-- Name: cargos_cargo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE cargos_cargo_id_seq OWNED BY cargos.cargo_id;


--
-- Name: coordenacoes; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE coordenacoes (
    coordenacao_id integer NOT NULL,
    data_inicio date,
    data_fim date,
    nome character varying(100) NOT NULL,
    direcao character varying
);


ALTER TABLE public.coordenacoes OWNER TO fila;

--
-- Name: coordenacoes_coordenacao_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE coordenacoes_coordenacao_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.coordenacoes_coordenacao_id_seq OWNER TO fila;

--
-- Name: coordenacoes_coordenacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE coordenacoes_coordenacao_id_seq OWNED BY coordenacoes.coordenacao_id;


--
-- Name: desembolsos; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE desembolsos (
    desembolso_id integer NOT NULL,
    projeto_id integer NOT NULL,
    data_prevista date NOT NULL,
    valor numeric(10,2),
    data_empenho date,
    empenho character varying,
    data_nad date,
    nad character varying,
    data_liquidacao date,
    liquidacao character varying,
    data_pagamento date,
    pagamento character varying
);


ALTER TABLE public.desembolsos OWNER TO fila;

--
-- Name: desembolsos_desembolso_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE desembolsos_desembolso_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.desembolsos_desembolso_id_seq OWNER TO fila;

--
-- Name: desembolsos_desembolso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE desembolsos_desembolso_id_seq OWNED BY desembolsos.desembolso_id;


--
-- Name: licoes_aprendidas; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE licoes_aprendidas (
    licao_id integer NOT NULL,
    projeto_id integer NOT NULL,
    data date NOT NULL,
    descricao character varying
);


ALTER TABLE public.licoes_aprendidas OWNER TO fila;

--
-- Name: licoes_aprendidas_licao_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE licoes_aprendidas_licao_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.licoes_aprendidas_licao_id_seq OWNER TO fila;

--
-- Name: licoes_aprendidas_licao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE licoes_aprendidas_licao_id_seq OWNED BY licoes_aprendidas.licao_id;


--
-- Name: medicoes; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE medicoes (
    medicao_id integer NOT NULL,
    data_medicao date,
    meta_id integer NOT NULL,
    descricao character varying(200) NOT NULL,
    percentual numeric(10,2),
    aceite_registrado date
);


ALTER TABLE public.medicoes OWNER TO fila;

--
-- Name: medicoes_medicao_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE medicoes_medicao_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.medicoes_medicao_id_seq OWNER TO fila;

--
-- Name: medicoes_medicao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE medicoes_medicao_id_seq OWNED BY medicoes.medicao_id;


--
-- Name: metas; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE metas (
    meta_id integer NOT NULL,
    data_inicio date,
    data_fim date,
    objetivo_id integer NOT NULL,
    descricao character varying(200) NOT NULL
);


ALTER TABLE public.metas OWNER TO fila;

--
-- Name: metas_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE metas_meta_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.metas_meta_id_seq OWNER TO fila;

--
-- Name: metas_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE metas_meta_id_seq OWNED BY metas.meta_id;


--
-- Name: objetivos; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE objetivos (
    objetivo_id integer NOT NULL,
    data_inicio date,
    data_fim date,
    tipo_objetivo_id integer NOT NULL,
    descricao character varying(2000) NOT NULL,
    projeto_id integer NOT NULL
);


ALTER TABLE public.objetivos OWNER TO fila;

--
-- Name: objetivos_objetivo_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE objetivos_objetivo_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.objetivos_objetivo_id_seq OWNER TO fila;

--
-- Name: objetivos_objetivo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE objetivos_objetivo_id_seq OWNED BY objetivos.objetivo_id;


--
-- Name: papeis; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE papeis (
    papel_id integer NOT NULL,
    data_inicio date,
    data_fim date,
    descricao character varying(100) NOT NULL
);


ALTER TABLE public.papeis OWNER TO fila;

--
-- Name: papeis_papel_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE papeis_papel_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.papeis_papel_id_seq OWNER TO fila;

--
-- Name: papeis_papel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE papeis_papel_id_seq OWNED BY papeis.papel_id;


--
-- Name: pessoas; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE pessoas (
    pessoa_id integer NOT NULL,
    data_inicio date,
    data_fim date,
    nome character varying(100) NOT NULL,
    cargo_id integer NOT NULL,
    salario numeric(10,2),
    custo numeric(10,2),
    tipo_contratacao character varying
);


ALTER TABLE public.pessoas OWNER TO fila;

--
-- Name: pessoas_pessoa_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE pessoas_pessoa_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pessoas_pessoa_id_seq OWNER TO fila;

--
-- Name: pessoas_pessoa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE pessoas_pessoa_id_seq OWNED BY pessoas.pessoa_id;


--
-- Name: projetos; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE projetos (
    projeto_id integer NOT NULL,
    data_inicio date,
    data_fim date,
    nome character varying(100) NOT NULL,
    gerente_id integer NOT NULL,
    coordenacao_id integer NOT NULL,
    valor numeric(10,2)
);


ALTER TABLE public.projetos OWNER TO fila;

--
-- Name: projetos_projeto_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE projetos_projeto_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.projetos_projeto_id_seq OWNER TO fila;

--
-- Name: projetos_projeto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE projetos_projeto_id_seq OWNED BY projetos.projeto_id;


--
-- Name: restricoes; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE restricoes (
    importancia integer NOT NULL,
    projeto_id integer NOT NULL,
    tipo_restricao_id integer NOT NULL
);


ALTER TABLE public.restricoes OWNER TO fila;

--
-- Name: riscos; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE riscos (
    risco_id integer NOT NULL,
    data_inicio date,
    data_fim date,
    projeto_id integer NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE public.riscos OWNER TO fila;

--
-- Name: riscos_risco_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE riscos_risco_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.riscos_risco_id_seq OWNER TO fila;

--
-- Name: riscos_risco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE riscos_risco_id_seq OWNED BY riscos.risco_id;


--
-- Name: status; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE status (
    status_id integer NOT NULL,
    projeto_id integer NOT NULL,
    data date NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE public.status OWNER TO fila;

--
-- Name: status_status_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE status_status_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.status_status_id_seq OWNER TO fila;

--
-- Name: status_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE status_status_id_seq OWNED BY status.status_id;


--
-- Name: tipos_objetivo; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE tipos_objetivo (
    tipo_objetivo_id integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE public.tipos_objetivo OWNER TO fila;

--
-- Name: tipos_objetivo_tipo_objetivo_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE tipos_objetivo_tipo_objetivo_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipos_objetivo_tipo_objetivo_id_seq OWNER TO fila;

--
-- Name: tipos_objetivo_tipo_objetivo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE tipos_objetivo_tipo_objetivo_id_seq OWNED BY tipos_objetivo.tipo_objetivo_id;


--
-- Name: tipos_restricao; Type: TABLE; Schema: public; Owner: fila; Tablespace: 
--

CREATE TABLE tipos_restricao (
    tipo_restricao_id integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE public.tipos_restricao OWNER TO fila;

--
-- Name: tipos_restricao_tipo_restricao_id_seq; Type: SEQUENCE; Schema: public; Owner: fila
--

CREATE SEQUENCE tipos_restricao_tipo_restricao_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipos_restricao_tipo_restricao_id_seq OWNER TO fila;

--
-- Name: tipos_restricao_tipo_restricao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fila
--

ALTER SEQUENCE tipos_restricao_tipo_restricao_id_seq OWNED BY tipos_restricao.tipo_restricao_id;


--
-- Name: cargo_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE cargos ALTER COLUMN cargo_id SET DEFAULT nextval('cargos_cargo_id_seq'::regclass);


--
-- Name: coordenacao_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE coordenacoes ALTER COLUMN coordenacao_id SET DEFAULT nextval('coordenacoes_coordenacao_id_seq'::regclass);


--
-- Name: desembolso_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE desembolsos ALTER COLUMN desembolso_id SET DEFAULT nextval('desembolsos_desembolso_id_seq'::regclass);


--
-- Name: licao_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE licoes_aprendidas ALTER COLUMN licao_id SET DEFAULT nextval('licoes_aprendidas_licao_id_seq'::regclass);


--
-- Name: medicao_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE medicoes ALTER COLUMN medicao_id SET DEFAULT nextval('medicoes_medicao_id_seq'::regclass);


--
-- Name: meta_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE metas ALTER COLUMN meta_id SET DEFAULT nextval('metas_meta_id_seq'::regclass);


--
-- Name: objetivo_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE objetivos ALTER COLUMN objetivo_id SET DEFAULT nextval('objetivos_objetivo_id_seq'::regclass);


--
-- Name: papel_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE papeis ALTER COLUMN papel_id SET DEFAULT nextval('papeis_papel_id_seq'::regclass);


--
-- Name: pessoa_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE pessoas ALTER COLUMN pessoa_id SET DEFAULT nextval('pessoas_pessoa_id_seq'::regclass);


--
-- Name: projeto_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE projetos ALTER COLUMN projeto_id SET DEFAULT nextval('projetos_projeto_id_seq'::regclass);


--
-- Name: risco_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE riscos ALTER COLUMN risco_id SET DEFAULT nextval('riscos_risco_id_seq'::regclass);


--
-- Name: status_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE status ALTER COLUMN status_id SET DEFAULT nextval('status_status_id_seq'::regclass);


--
-- Name: tipo_objetivo_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE tipos_objetivo ALTER COLUMN tipo_objetivo_id SET DEFAULT nextval('tipos_objetivo_tipo_objetivo_id_seq'::regclass);


--
-- Name: tipo_restricao_id; Type: DEFAULT; Schema: public; Owner: fila
--

ALTER TABLE tipos_restricao ALTER COLUMN tipo_restricao_id SET DEFAULT nextval('tipos_restricao_tipo_restricao_id_seq'::regclass);


--
-- Name: desembolsos_pkey; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY desembolsos
    ADD CONSTRAINT desembolsos_pkey PRIMARY KEY (desembolso_id);


--
-- Name: licoes_aprendidas_pkey; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY licoes_aprendidas
    ADD CONSTRAINT licoes_aprendidas_pkey PRIMARY KEY (licao_id);


--
-- Name: pk_alocacoes; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY alocacoes
    ADD CONSTRAINT pk_alocacoes PRIMARY KEY (projeto_id, pessoa_id, data_inicio, data_fim);


--
-- Name: pk_cargos; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY cargos
    ADD CONSTRAINT pk_cargos PRIMARY KEY (cargo_id);


--
-- Name: pk_coordenacoes; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY coordenacoes
    ADD CONSTRAINT pk_coordenacoes PRIMARY KEY (coordenacao_id);


--
-- Name: pk_medicoes; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY medicoes
    ADD CONSTRAINT pk_medicoes PRIMARY KEY (medicao_id);


--
-- Name: pk_metas; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY metas
    ADD CONSTRAINT pk_metas PRIMARY KEY (meta_id);


--
-- Name: pk_objetivos; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY objetivos
    ADD CONSTRAINT pk_objetivos PRIMARY KEY (objetivo_id);


--
-- Name: pk_papeis; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY papeis
    ADD CONSTRAINT pk_papeis PRIMARY KEY (papel_id);


--
-- Name: pk_pessoas; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY pessoas
    ADD CONSTRAINT pk_pessoas PRIMARY KEY (pessoa_id);


--
-- Name: pk_projetos; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY projetos
    ADD CONSTRAINT pk_projetos PRIMARY KEY (projeto_id);


--
-- Name: pk_restricoes; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY restricoes
    ADD CONSTRAINT pk_restricoes PRIMARY KEY (importancia, projeto_id, tipo_restricao_id);


--
-- Name: pk_riscos; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY riscos
    ADD CONSTRAINT pk_riscos PRIMARY KEY (risco_id);


--
-- Name: status_pkey; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pkey PRIMARY KEY (status_id);


--
-- Name: tipos_objetivo_pkey; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY tipos_objetivo
    ADD CONSTRAINT tipos_objetivo_pkey PRIMARY KEY (tipo_objetivo_id);


--
-- Name: tipos_restricao_pkey; Type: CONSTRAINT; Schema: public; Owner: fila; Tablespace: 
--

ALTER TABLE ONLY tipos_restricao
    ADD CONSTRAINT tipos_restricao_pkey PRIMARY KEY (tipo_restricao_id);


--
-- Name: desembolsos_projeto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY desembolsos
    ADD CONSTRAINT desembolsos_projeto_id_fkey FOREIGN KEY (projeto_id) REFERENCES projetos(projeto_id);


--
-- Name: fk_coordenacao_projeto; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY projetos
    ADD CONSTRAINT fk_coordenacao_projeto FOREIGN KEY (coordenacao_id) REFERENCES coordenacoes(coordenacao_id);


--
-- Name: fk_gerente_projeto; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY pessoas
    ADD CONSTRAINT fk_gerente_projeto FOREIGN KEY (cargo_id) REFERENCES cargos(cargo_id);


--
-- Name: fk_gerente_projeto; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY projetos
    ADD CONSTRAINT fk_gerente_projeto FOREIGN KEY (gerente_id) REFERENCES pessoas(pessoa_id);


--
-- Name: fk_medicao_da_meta; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY medicoes
    ADD CONSTRAINT fk_medicao_da_meta FOREIGN KEY (meta_id) REFERENCES metas(meta_id);


--
-- Name: fk_meta_do_objetivo; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY metas
    ADD CONSTRAINT fk_meta_do_objetivo FOREIGN KEY (objetivo_id) REFERENCES objetivos(objetivo_id);


--
-- Name: fk_objetivo_do_projeto; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY objetivos
    ADD CONSTRAINT fk_objetivo_do_projeto FOREIGN KEY (projeto_id) REFERENCES projetos(projeto_id);


--
-- Name: fk_papeis_alocacoes; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY alocacoes
    ADD CONSTRAINT fk_papeis_alocacoes FOREIGN KEY (papel_id) REFERENCES papeis(papel_id);


--
-- Name: fk_pessoas_alocacoes; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY alocacoes
    ADD CONSTRAINT fk_pessoas_alocacoes FOREIGN KEY (pessoa_id) REFERENCES pessoas(pessoa_id);


--
-- Name: fk_projetos_alocacoes; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY alocacoes
    ADD CONSTRAINT fk_projetos_alocacoes FOREIGN KEY (projeto_id) REFERENCES projetos(projeto_id);


--
-- Name: fk_restricao_do_projeto; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY restricoes
    ADD CONSTRAINT fk_restricao_do_projeto FOREIGN KEY (projeto_id) REFERENCES projetos(projeto_id);


--
-- Name: fk_risco_do_projeto; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY riscos
    ADD CONSTRAINT fk_risco_do_projeto FOREIGN KEY (projeto_id) REFERENCES projetos(projeto_id);


--
-- Name: fk_tipo_da_restricao; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY restricoes
    ADD CONSTRAINT fk_tipo_da_restricao FOREIGN KEY (tipo_restricao_id) REFERENCES tipos_restricao(tipo_restricao_id);


--
-- Name: fk_tipo_do_objetivo; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY objetivos
    ADD CONSTRAINT fk_tipo_do_objetivo FOREIGN KEY (tipo_objetivo_id) REFERENCES tipos_objetivo(tipo_objetivo_id);


--
-- Name: licoes_aprendidas_projeto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY licoes_aprendidas
    ADD CONSTRAINT licoes_aprendidas_projeto_id_fkey FOREIGN KEY (projeto_id) REFERENCES projetos(projeto_id);


--
-- Name: status_projeto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fila
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_projeto_id_fkey FOREIGN KEY (projeto_id) REFERENCES projetos(projeto_id);


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

