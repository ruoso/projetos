DROP INDEX pk_alocacoes;
CREATE UNIQUE INDEX alocacoes_projeto ON alocacoes (projeto_id, pessoa_id, papel_id, data_inicio, data_fim);
CREATE UNIQUE INDEX alocacoes_servico ON alocacoes (servico_id, pessoa_id, papel_id, data_inicio, data_fim);
ALTER TABLE alocacoes ADD COLUMN alocacao_id SERIAL PRIMARY KEY;
