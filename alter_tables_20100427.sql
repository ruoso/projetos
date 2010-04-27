CREATE TABLE servicos (
       servico_id SERIAL PRIMARY KEY,
       data_inicio DATE,
       data_fim DATE,
       nome VARCHAR NOT NULL,
       coordenacao_id INTEGER NOT NULL REFERENCES coordenacoes(coordenacao_id)
);

ALTER TABLE alocacoes ADD COLUMN servico_id INTEGER REFERENCES servicos(servico_id);
ALTER TABLE alocacoes DROP CONSTRAINT pk_alocacoes;
ALTER TABLE alocacoes ALTER COLUMN projeto_id DROP NOT NULL;
ALTER TABLE alocacoes 
 ADD CONSTRAINT alocacoes_servico_ou_projeto
  CHECK (
   (servico_id IS NULL AND projeto_id IS NOT NULL)
   OR
   (servico_id IS NOT NULL and projeto_id IS NULL)
  );
CREATE UNIQUE INDEX pk_alocacoes ON alocacoes (projeto_id, servico_id, papel_id, data_inicio, data_fim);

ALTER TABLE objetivos ALTER COLUMN projeto_id DROP NOT NULL;
ALTER TABLE objetivos ADD COLUMN servico_id INTEGER REFERENCES servicos(servico_id);
ALTER TABLE objetivos 
 ADD CONSTRAINT objetivos_servico_ou_projeto
  CHECK (
   (servico_id IS NULL AND projeto_id IS NOT NULL)
   OR
   (servico_id IS NOT NULL and projeto_id IS NULL)
  );

ALTER TABLE riscos ADD COLUMN efeito VARCHAR;
ALTER TABLE riscos ADD COLUMN acao_planejada VARCHAR;