

CREATE TABLE coordenacoes (
	coordenacao_id SERIAL NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	nome VARCHAR(100) NOT NULL,
	CONSTRAINT pk_coordenacoes PRIMARY KEY (coordenacao_id)
);

CREATE TABLE cargos (
	cargo_id SERIAL NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	CONSTRAINT pk_cargos PRIMARY KEY (cargo_id)
);

CREATE TABLE papeis (
	papel_id SERIAL NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	CONSTRAINT pk_papeis PRIMARY KEY (papel_id)
);

CREATE TABLE pessoas (
	pessoa_id SERIAL NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	nome VARCHAR(100) NOT NULL,
	cargo_id INTEGER NOT NULL,
	salario NUMERIC(10,2),
	custo NUMERIC(10,2),
	tipo_contratacao VARCHAR,
	CONSTRAINT pk_pessoas PRIMARY KEY (pessoa_id),
	CONSTRAINT fk_gerente_projeto FOREIGN KEY (cargo_id) REFERENCES cargos (cargo_id)
);

CREATE TABLE projetos (
	projeto_id SERIAL NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	nome VARCHAR(100) NOT NULL,
	gerente_id INTEGER NOT NULL,
        coordenacao_id INTEGER NOT NULL,
	valor NUMERIC(10,2),
	status NUMERIC(10,2),
	CONSTRAINT pk_projetos PRIMARY KEY (projeto_id),
	CONSTRAINT fk_gerente_projeto FOREIGN KEY (gerente_id) REFERENCES pessoas (pessoa_id),
	CONSTRAINT fk_coordenacao_projeto FOREIGN KEY (coordenacao_id) REFERENCES coordenacoes (coordenacao_id)
);

CREATE TABLE tipos_objetivo (
       tipo_objetivo_id SERIAL NOT NULL PRIMARY KEY,
       nome VARCHAR NOT NULL
);

CREATE TABLE objetivos (
	objetivo_id SERIAL NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	tipo_objetivo_id INTEGER NOT NULL,
	descricao VARCHAR(2000) NOT NULL,
	projeto_id INTEGER NOT NULL,
	CONSTRAINT pk_objetivos PRIMARY KEY (objetivo_id),
	CONSTRAINT fk_objetivo_do_projeto FOREIGN KEY (projeto_id) REFERENCES projetos (projeto_id),
        CONSTRAINT fk_tipo_do_objetivo FOREIGN KEY (tipo_objetivo_id) REFERENCES tipos_objetivo (tipo_objetivo_id)
);

CREATE TABLE tipos_restricao (
       tipo_restricao_id SERIAL NOT NULL PRIMARY KEY,
       nome VARCHAR NOT NULL
);

CREATE TABLE restricoes (
	importancia INTEGER NOT NULL,
	projeto_id INTEGER NOT NULL,
	tipo_restricao_id INTEGER NOT NULL,
	CONSTRAINT pk_restricoes PRIMARY KEY (importancia, projeto_id, tipo_restricao_id),
	CONSTRAINT fk_restricao_do_projeto FOREIGN KEY (projeto_id) REFERENCES projetos (projeto_id),
	CONSTRAINT fk_tipo_da_restricao FOREIGN KEY (tipo_restricao_id) REFERENCES tipos_restricao (tipo_restricao_id)
);

CREATE TABLE riscos (
	risco_id SERIAL NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	projeto_id INTEGER NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	CONSTRAINT pk_riscos PRIMARY KEY (risco_id),
	CONSTRAINT fk_risco_do_projeto FOREIGN KEY (projeto_id) REFERENCES projetos (projeto_id)
);

CREATE TABLE alocacoes (
	projeto_id INTEGER NOT NULL,
	pessoa_id INTEGER NOT NULL,
	papel_id INTEGER NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	CONSTRAINT pk_alocacoes PRIMARY KEY (projeto_id, pessoa_id, data_inicio, data_fim),
	CONSTRAINT fk_projetos_alocacoes FOREIGN KEY (projeto_id) REFERENCES projetos (projeto_id),
	CONSTRAINT fk_pessoas_alocacoes FOREIGN KEY (pessoa_id) REFERENCES pessoas (pessoa_id),
	CONSTRAINT fk_papeis_alocacoes FOREIGN KEY (papel_id) REFERENCES papeis (papel_id)
);

CREATE TABLE metas (
	meta_id SERIAL NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	objetivo_id INTEGER NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	CONSTRAINT pk_metas PRIMARY KEY (meta_id),
	CONSTRAINT fk_meta_do_objetivo FOREIGN KEY (objetivo_id) REFERENCES objetivos (objetivo_id)
);


CREATE TABLE medicoes (
	medicao_id SERIAL NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	meta_id INTEGER NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	CONSTRAINT pk_medicoes PRIMARY KEY (medicao_id),
	CONSTRAINT fk_medicao_da_meta FOREIGN KEY (meta_id) REFERENCES metas (meta_id)
);
