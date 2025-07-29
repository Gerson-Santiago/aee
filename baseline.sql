-- DROP TABLES (caso deseje executar antes manualmente)
DROP TABLE IF EXISTS alunos CASCADE;
DROP TABLE IF EXISTS consulta_matricula CASCADE;
DROP TABLE IF EXISTS dados_das_escolas CASCADE;

-- TABELA: alunos
CREATE TABLE alunos (
  tipo_de_ensino text,
  serie1 text,
  n_chamada integer,
  nome_aluno text,
  ra varchar(20),
  dig varchar(5),
  uf char(2),
  data_nasci date,
  data_inicial date,
  data_fim date,
  situacao varchar(10),
  data_movimentacao date,
  deficiencia text,
  endereco text,
  transporte_15 varchar(20),
  genero char(1),
  bolsa_familia char(1),
  etnia char(1),
  cod_turma varchar(20),
  periodo varchar(20),
  email_aluno text,
  ra_senha text,
  telefone text,
  nome_responsavel text,
  turma text,
  filtro_serie text,
  cod_escola varchar(20),
  nome_escola text,
  info1 char(1),
  info2 char(1),
  info3 char(1),
  tipo_32 text,
  turma_escola text,
  prof1 text,
  mais_info1 text,
  mais_info2 text,
  mais_info3 text,
  mais_info4 text,
  mais_info5 text,
  mais_info6 text
);

-- TABELA: consulta_matricula
CREATE TABLE consulta_matricula (
  pk_serie text,
  cod_escola text,
  nome_escola text,
  n_classe_sed text,
  tipo_de_ensino text,
  capacidade integer,
  quant_alunos_ativos integer,
  nome_serie_sed text,
  periodo text,
  tipo_ensino_matricula text,
  turma text,
  cod_turma text,
  cod_escola_dup text,
  filtro_serie text,
  link_sala text,
  cod_turma_dup text,
  id text
);

-- TABELA: dados_das_escolas
CREATE TABLE dados_das_escolas (
  cod_escola text,
  cod_ue text,
  nome_escola text,
  inep text,
  endereco text,
  cep text,
  telefone text,
  cod_sed text,
  dir_email text,
  assist_email text,
  coord_email text,
  sec_email text,
  etapa text,
  educacao_infantil text,
  quant_turma_INF integer,
  pre_escola text,
  quant_turma_PRE integer,
  ensino_fundamental text,
  quant_turma_FUND integer,
  turmas_totais integer,
  aee text,
  eee text,
  status_aee text,
  ano_letivo text,
  status_eja text,
  decreto_de_criacao text,
  cnpj text,
  decreto_altera text,
  linkpiloto text,
  turma1 text, turma2 text, turma3 text, turma4 text, turma5 text,
  turma6 text, turma7 text, turma8 text, turma9 text, turma10 text,
  turma11 text, turma12 text, turma13 text, turma14 text, turma15 text,
  turma16 text, turma17 text, turma18 text, turma19 text, turma20 text,
  turma21 text, turma22 text, turma23 text, turma24 text, turma25 text,
  turma26 text, turma27 text, turma28 text, turma29 text, turma30 text,
  turma31 text, turma32 text, turma33 text, turma34 text, turma35 text,
  turma36 text, turma37 text, turma38 text, turma39 text, turma40 text
);

-- IMPORTAÇÃO DOS CSV
\copy alunos(tipo_de_ensino, serie1, n_chamada, nome_aluno, ra, dig, uf, data_nasci, data_inicial, data_fim, situacao, data_movimentacao, deficiencia, endereco, transporte_15, genero, bolsa_familia, etnia, cod_turma, periodo, email_aluno, ra_senha, telefone, nome_responsavel, turma, filtro_serie, cod_escola, nome_escola, info1, info2, info3, tipo_32, turma_escola, prof1, mais_info1, mais_info2, mais_info3, mais_info4, mais_info5, mais_info6) FROM 'csv/alunos.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');


\copy consulta_matricula(pk_serie, cod_escola, nome_escola, n_classe_sed, tipo_de_ensino, capacidade, quant_alunos_ativos, nome_serie_sed, periodo, tipo_ensino_matricula, turma, cod_turma, cod_escola_dup, filtro_serie, link_sala, cod_turma_dup, id) FROM 'csv/consulta_matricula.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');


\copy dados_das_escolas(cod_escola, cod_ue, nome_escola, inep, endereco, cep, telefone, cod_sed, dir_email, assist_email, coord_email, sec_email, etapa, educacao_infantil, quant_turma_INF, pre_escola, quant_turma_PRE, ensino_fundamental, quant_turma_FUND, turmas_totais, aee, eee, status_aee, ano_letivo, status_eja, decreto_de_criacao, cnpj, decreto_altera, linkpiloto, turma1, turma2, turma3, turma4, turma5, turma6, turma7, turma8, turma9, turma10, turma11, turma12, turma13, turma14, turma15, turma16, turma17, turma18, turma19, turma20, turma21, turma22, turma23, turma24, turma25, turma26, turma27, turma28, turma29, turma30, turma31, turma32, turma33, turma34, turma35, turma36, turma37, turma38, turma39, turma40) FROM 'csv/dados_das_escolas.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '');
