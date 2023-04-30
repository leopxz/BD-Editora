CREATE DATABASE Editora2;
USE Editora2;

-- Criação das Tabelas

CREATE TABLE departamento (
  id_departamento INT PRIMARY KEY,
  nome_departamento VARCHAR(50) NOT NULL
);

CREATE TABLE pessoa (
  id_pessoa INT PRIMARY KEY,
  nome_pessoa VARCHAR(50) NOT NULL,
  tipo_pessoa VARCHAR(40) NOT NULL,
  id_endereco VARCHAR(80) NOT NULL
);

CREATE TABLE endereco (
  id_endereco INT PRIMARY KEY,
  logradouro VARCHAR(50) NOT NULL,
  id_pessoa INT,
  numero VARCHAR(10) NOT NULL,
  complemento VARCHAR(50) NULL,
  bairro VARCHAR(50) NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  estado VARCHAR(2) NOT NULL,
  cep VARCHAR(10) NOT NULL, 
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE funcionario (
  id_funcionario INT PRIMARY KEY,
  cargo VARCHAR(50) NOT NULL,
  id_departamento INT NOT NULL,
  id_pessoa INT NOT NULL,
  salario DECIMAL (10,2),
  FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento),
  FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE autor (
  id_autor INT PRIMARY KEY,
  id_pessoa INT NOT NULL,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE exemplar (
  id_exemplar INT PRIMARY KEY,
  tipo_exemplar VARCHAR(50) NOT NULL,
  id_autor INT,
  FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

CREATE TABLE livraria (
  id_livraria INT PRIMARY KEY,
  nome_livraria VARCHAR(50) NOT NULL,
  id_endereco INT NOT NULL,
  FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco)
);

CREATE TABLE venda (
  id_venda INT PRIMARY KEY,
  id_livraria INT NOT NULL,
  id_exemplar INT NOT NULL,
  data_venda DATE NOT NULL,
  FOREIGN KEY (id_livraria) REFERENCES livraria(id_livraria),
  FOREIGN KEY (id_exemplar) REFERENCES exemplar(id_exemplar)
);


INSERT INTO departamento (id_departamento, nome_departamento)
VALUES
(01, "RH"),
(02, "Financeiro"),
(03, "Logistica"),
(04, "Escritores"),
(05, "Administrativo"),
(06, "Jornalistico");

INSERT INTO endereco (id_endereco, logradouro, numero, complemento, bairro, cidade, estado, cep)
VALUES
(1, "Av. Republica do libano", 251, "S/C", "Pina", "Recife", "PE", "51110-160"),
(2, "Av. Gov. Agamenon Magalhães", 153, "L1", "Santo_Amaro", "Recife", "PE", "50110-900"),
(3, "R. Dr. João Santos Filho", 255, "Loja_204", "Parnamirim", "Recife", "PE", "52060-615"),
(4, "R. Me. de Deus", 110, "S/C", "São_josé", "Recife", "PE", "50030-030"),
(5, "R. Gervásio Pires", 881, "S/C", "Santo_amaro", "Recife", "PE", "50050-415"),
(6, "Av. Republica do libano", 251, "S/C", "Pina", "Recife", "PE", "51110-160"),
(7, "Av. Dantas Barreto", 1000, "S/C", "São_josé", "Recife", "PE", "50020-000"),
(8, "Praça de Casa Forte", 454, "S/C", "Casa_Forte", "Recife", "PE", "52061-420"),
(9,  "R. Me. de Deus", 110, "S/C", "São_josé", "Recife", "PE", "50030-030"),
(10, "R. do Riachuelo", 671, "S/C", "Boa Vista", "Recife", "PE", "05005-400"),
(11, "R. do Hospício", 164, "S/C", "Boa Vista", "Recife", "PE", "50050-050"),
(12, "Rua Conselheiro Portela", 665, "S/C", "Espinheiro", "Recife", "PE", "52020-030");


INSERT INTO pessoa (id_pessoa, nome_pessoa, tipo_pessoa, id_endereco) 
VALUES

(01, "Arthur_caladinho", "Fisica", 9),
(02, "João_Mota", "Juridica", 2),
(03, "Matheus_TDAH", "Fisica", 3),
(04, "André_Ganja", "Juridica", 4),
(05, "Leonardo_Paixão", "Fisica", 5),
(06, "Humberto_Larga_cedo", "Juridica", 6),
(07, "João_do_judo", "Cooperativa", 7), 
(08, "Arthur_faltoso", "Cooperativa", 8),
(09, "André_maconha", "Cooperativa", 9),
(10, "Matheus_esquecido", "Filantrópica", 10),
(11, "João_java", "Filantrópica", 11),
(12, "Nikolas_martins", "Filantrópica", 12),
(13, "Fernanda_maria", "Filantrópica", 8),
(14, "Arthur_orange", "Fisica", 1),
(15, "Hugo_josé", "Fisica", 5),
(16, "Gustavo_folena", "Fisica", 4),
(17, "Vinicius_sartre", "Juridica", 2),
(18, "Julia_manguinhos", "Juridica", 10),
(19, "Marcela_ellen", "Juridica", 11),
(20, "Yuri_colaço", "Cooperativa", 12);

INSERT INTO funcionario (id_funcionario, cargo, id_departamento, id_pessoa, salario) 
VALUES 
(1, "Recrutador", 1, 1, 2510.00),
(2, "Analista_Financeiro",2, 2, 3560.00),
(3, "Coordenador_rh", 3, 3, 5240.00),
(4, "Redator", 4, 4, 4430.00),
(5, "Administrador", 5, 5, 4962.00),
(6, "Jornalista", 6, 6, 3257.00),
(7, "Jonalista", 6, 7, 3257.00),
(8, "Administrador", 5, 8, 4962.00),
(9, "Coordenador_financeiro", 2, 9, 6436.00),
(10, "Coordenador_administrativo", 5, 10, 6536.00),
(11, "Redator_chefe", 6, 11, 7412),
(12, "Auxiliar_financeiro", 2, 12, 1670.00),
(13, "Auxiliar_financeiro", 2, 13, 1670.00),
(14, "Auxiliar_administrativo", 5, 14, 1770.00),
(15, "Auxiliar_jornalismo", 6, 15, 1570.00), 
(16, "Auxiliar_jornalismo", 6, 16, 1570.00),
(17, "Auxiliar_administrativo", 5, 17, 1770.00),
(18, "Auxiliar_administrativo", 5, 18, 1770.00),
(19, "Auxiliar_administrativo", 5, 19, 1770.00),
(20, "Jornalista", 6, 20, 3257.00);

INSERT INTO autor (id_autor, id_pessoa)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

INSERT INTO exemplar (id_exemplar, tipo_exemplar, id_autor)
VALUES
(1, "revista", 1),
(2, "livro", 2),
(3, "apostilha", 3),
(4, "livro", 4),
(5, "apostilha", 5),
(6, "revista", 6),
(7, "livro", 7),
(8, "livro", 8),
(9, "livro", 9),
(10, "revista", 10),
(11, "revista", 11),
(12, "revista", 12),
(13, "gibi", 13),
(14, "gibi", 14),
(15, "gibi", 15),
(16, "apostilha", 16),
(17, "apostilha", 17),
(18, "apostilha", 18),
(19, "cartaz", 19),
(20, "cartaz", 20);

INSERT INTO livraria (id_livraria, nome_livraria, id_endereco)
VALUES

(1, "Cultura", 1),
(2, "Leitura", 2),
(3, "Imperatriz", 3),
(4, "Livraria_Jaqueira", 4),
(5, "Disal", 5),
(6, "Saraiva", 6),
(7, "PAULUS", 7),
(8, "Livraria_da_praça", 8),
(9, "Livraria_jaqueira", 9),
(10, "Livraria_do_estudante", 10),
(11, "Livraria_antares", 11),
(12, "Livraria_encruzilhada", 12);

INSERT INTO venda (id_venda, id_livraria, id_exemplar, data_venda)
VALUES
(1, 1, 1, '2022-12-31'),
(2, 2, 2, '2023-04-27'),
(3, 3, 3, '2023-07-16'),
(4, 4, 4, '2024-01-01'),
(5, 5, 5, '2001-03-24'),
(6, 6, 6, '2020-09-13'),
(7, 7, 7, '2020-09-28'),
(8, 8, 8, '2020-09-13'),
(9, 9, 9, '2020-09-12'),
(10, 10, 10, '2020-10-10'),
(11, 11, 11, '2020-11-02'),
(12, 12, 12, '2020-12-03'),
(13, 11, 13, '2020-01-04'),
(14, 10, 14, '2020-02-19'),
(15, 9, 15, '2020-03-12'),
(16, 8, 16, '2020-04-05'),
(17, 7, 17, '2020-05-17'),
(18, 6, 18, '2020-06-18'),
(19, 5, 19, '2020-07-15'),
(20, 4, 20, '2020-08-21'); 

-- Criação das Views
CREATE VIEW funcionarios_departamento AS
SELECT f.id_funcionario, f.cargo, d.nome_departamento, p.nome_pessoa
FROM funcionario f
INNER JOIN departamento d ON f.id_departamento = d.id_departamento
INNER JOIN pessoa p ON f.id_pessoa = p.id_pessoa
WHERE p.tipo_pessoa = 'funcionario';

CREATE VIEW autores_exemplares AS
SELECT a.id_autor, p.nome_pessoa, e.tipo_exemplar
FROM autor a
INNER JOIN pessoa p ON a.id_pessoa = p.id_pessoa
INNER JOIN exemplar e ON a.id_autor = e.id_autor;

CREATE VIEW vendas_exemplares AS
SELECT v.id_venda, l.nome_livraria, e.tipo_exemplar, v.data_venda
FROM venda v
INNER JOIN livraria l ON v.id_livraria = l.id_livraria
INNER JOIN exemplar e ON v.id_exemplar = e.id_exemplar;

CREATE VIEW pessoas_enderecos AS
SELECT p.nome_pessoa, e.logradouro, e.numero, e.complemento, e.bairro, e.cidade, e.estado, e.cep
FROM pessoa p
INNER JOIN endereco e ON p.id_endereco = e.id_endereco;

-- Adicionando a coluna email na tabela pessoa
ALTER TABLE pessoa ADD email VARCHAR(255);

-- Inserindo emails para pessoas
UPDATE pessoa SET email = 'arthurcaladinho@example.com' WHERE id_pessoa = 1;
UPDATE pessoa SET email = 'joaomota@example.com' WHERE id_pessoa = 2;
UPDATE pessoa SET email = 'matheustdah@example.com' WHERE id_pessoa = 3;
UPDATE pessoa SET email = 'andreganja@example.com' WHERE id_pessoa = 4;
UPDATE pessoa SET email = 'leonardopaixao@example.com' WHERE id_pessoa = 5;
UPDATE pessoa SET email = 'humbertolargacedo@example.com' WHERE id_pessoa = 6;
UPDATE pessoa SET email = 'joaodojudo@example.com' WHERE id_pessoa = 7;
UPDATE pessoa SET email = 'arthurfaltoso@example.com' WHERE id_pessoa = 8;
UPDATE pessoa SET email = 'andremaconha@example.com' WHERE id_pessoa = 9;
UPDATE pessoa SET email = 'matheusesquecido@example.com' WHERE id_pessoa = 10;
UPDATE pessoa SET email = 'joaojava@example.com' WHERE id_pessoa = 11;
UPDATE pessoa SET email = 'nikolasmartins@example.com' WHERE id_pessoa = 12;
UPDATE pessoa SET email = 'fernandamaria@example.com' WHERE id_pessoa = 13;
UPDATE pessoa SET email = 'arthurorange@example.com' WHERE id_pessoa = 14;
UPDATE pessoa SET email = 'hugojose@example.com' WHERE id_pessoa = 15;
UPDATE pessoa SET email = 'gustavofolena@example.com' WHERE id_pessoa = 16;
UPDATE pessoa SET email = 'viniciussartre@example.com' WHERE id_pessoa = 17;
UPDATE pessoa SET email = 'juliamanguinhos@example.com' WHERE id_pessoa = 18;
UPDATE pessoa SET email = 'marcelaellen@example.com' WHERE id_pessoa = 19;
UPDATE pessoa SET email = 'yuricolaco@example.com' WHERE id_pessoa = 20;

-- Alteração das tabelas 
ALTER TABLE departamento
ADD sigla_departamento VARCHAR(10) NOT NULL;

ALTER TABLE pessoa
MODIFY COLUMN nome_pessoa VARCHAR(100) NOT NULL;

ALTER TABLE endereco
DROP COLUMN complemento;

ALTER TABLE funcionario
ADD data_admissao DATE;

ALTER TABLE autor
ADD pseudonimo VARCHAR(50);

ALTER TABLE exemplar
ADD editora VARCHAR(50) NOT NULL;

ALTER TABLE livraria
MODIFY COLUMN nome_livraria VARCHAR(100) NOT NULL;

ALTER TABLE livraria
MODIFY COLUMN nome_livraria VARCHAR(100) NOT NULL;

ALTER TABLE venda
ADD quantidade INT NOT NULL DEFAULT 1;

ALTER TABLE departamento
DROP COLUMN sigla_departamento;

ALTER TABLE funcionario
ADD data_demissao DATE;

-- Funcionários com salários acima de 5000
SELECT p.nome_pessoa, f.salario
FROM pessoa p
JOIN funcionario f ON p.id_pessoa = f.id_pessoa
WHERE f.salario > 5000;

-- Número de funcionários por departamento
SELECT d.nome_departamento, COUNT(f.id_funcionario) AS num_funcionarios
FROM departamento d
JOIN funcionario f ON d.id_departamento = f.id_departamento
GROUP BY d.nome_departamento;

-- Total de vendas por livraria
SELECT l.nome_livraria, SUM(v.quantidade) AS total_vendas
FROM livraria l
JOIN venda v ON l.id_livraria = v.id_livraria
GROUP BY l.nome_livraria;

-- Funcionários do departamento de Tecnologia
SELECT p.nome_pessoa, d.nome_departamento
FROM pessoa p
JOIN funcionario f ON p.id_pessoa = f.id_pessoa
JOIN departamento d ON f.id_departamento = d.id_departamento
WHERE d.nome_departamento = 'Tecnologia';

-- Média salarial por departamento
SELECT d.nome_departamento, AVG(f.salario) AS media_salarial
FROM departamento d
JOIN funcionario f ON d.id_departamento = f.id_departamento
GROUP BY d.nome_departamento;

-- Funcionários admitidos após a data média de admissão
SELECT p.nome_pessoa, f.data_admissao
FROM pessoa p
JOIN funcionario f ON p.id_pessoa = f.id_pessoa
WHERE f.data_admissao > (
  SELECT AVG(data_admissao) FROM funcionario
);

-- Funcionários com salários acima da média
SELECT p.nome_pessoa, f.salario
FROM pessoa p
JOIN funcionario f ON p.id_pessoa = f.id_pessoa
WHERE f.salario > (
  SELECT AVG(salario) FROM funcionario
);

-- Funcionários com salários acima da média em seu departamento
SELECT p.nome_pessoa, f.salario, d.nome_departamento
FROM pessoa p
JOIN funcionario f ON p.id_pessoa = f.id_pessoa
JOIN departamento d ON f.id_departamento = d.id_departamento
WHERE f.salario > (
  SELECT AVG(salario) FROM funcionario WHERE id_departamento = d.id_departamento
);

-- Departamentos com número de funcionários acima da média
SELECT d.nome_departamento, COUNT(f.id_funcionario) AS num_funcionarios
FROM departamento d
JOIN funcionario f ON d.id_departamento = f.id_departamento
GROUP BY d.nome_departamento
HAVING num_funcionarios > (
  SELECT AVG(num_funcionarios) FROM (
    SELECT COUNT(id_funcionario) AS num_funcionarios
    FROM funcionario
    GROUP BY id_departamento
  ) AS funcionarios_por_departamento
);

-- Livrarias com número de vendas acima da média
SELECT l.nome_livraria, COUNT(v.id_venda) AS num_vendas
FROM livraria l
JOIN venda v ON l.id_livraria = v.id_livraria
GROUP BY l.nome_livraria
HAVING num_vendas > (
  SELECT AVG(num_vendas) FROM (
    SELECT COUNT(id_venda) AS num_vendas
    FROM venda
    GROUP BY id_livraria
  ) AS vendas_por_livraria
);

-- Selecionar todos os departamentos e seus respectivos nomes
SELECT id_departamento, nome_departamento
FROM departamento;

-- Selecionar todos os funcionários com seus respectivos cargos e departamentos
SELECT f.id_funcionario, p.nome_pessoa, f.cargo, d.nome_departamento
FROM funcionario f
JOIN pessoa p ON f.id_pessoa = p.id_pessoa
JOIN departamento d ON f.id_departamento = d.id_departamento;

-- Selecionar todos os autores e seus respectivos exemplares:
SELECT a.id_autor, p.nome_pessoa, e.tipo_exemplar
FROM autor a
JOIN pessoa p ON a.id_pessoa = p.id_pessoa
JOIN exemplar e ON a.id_autor = e.id_autor;

-- Selecionar todas as vendas com informações sobre livrarias e exemplares vendidos
SELECT v.id_venda, l.nome_livraria, e.tipo_exemplar, v.data_venda
FROM venda v
JOIN livraria l ON v.id_livraria = l.id_livraria
JOIN exemplar e ON v.id_exemplar = e.id_exemplar;

-- Selecionar todos os exemplares e seus respectivos autores
SELECT e.id_exemplar, e.tipo_exemplar, p.nome_pessoa AS autor
FROM exemplar e
JOIN autor a ON e.id_autor = a.id_autor
JOIN pessoa p ON a.id_pessoa = p.id_pessoa;

-- Selecionar todos os funcionários com salários acima de um determinado valor (3.000)
SELECT f.id_funcionario, p.nome_pessoa, f.cargo, f.salario
FROM funcionario f
JOIN pessoa p ON f.id_pessoa = p.id_pessoa
WHERE f.salario > 3000;

-- Selecionar o total de exemplares vendidos por tipo
SELECT e.tipo_exemplar, COUNT(v.id_exemplar) AS total_vendas
FROM venda v
JOIN exemplar e ON v.id_exemplar = e.id_exemplar
GROUP BY e.tipo_exemplar;

-- Selecionar todos os funcionários que trabalham no departamento "Logistica"
SELECT f.id_funcionario, p.nome_pessoa, f.cargo
FROM funcionario f
JOIN pessoa p ON f.id_pessoa = p.id_pessoa
JOIN departamento d ON f.id_departamento = d.id_departamento
WHERE d.nome_departamento = 'Logistica';








