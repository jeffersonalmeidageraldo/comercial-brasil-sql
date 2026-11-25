-- =====================================================
-- PROJETO: COMERCIAL BRASIL
-- AUTOR: Jefferson Almeida Geraldo
-- DATA: 24/11/2026
-- BANCO DE DADOS: PostgreSQL
-- FERRAMENTA: DBeaver
-- ETAPA 01: Fundamentos de SQL
-- =====================================================

-- ATENÇÃO:
-- Executar a inserção de registros apenas uma vez.
-- Todos os dados utilizados são fictícios.


-- =====================================================
-- 01. VERIFICAÇÃO DO BANCO DE DADOS
-- =====================================================

SELECT CURRENT_DATABASE();


-- =====================================================
-- 02. CRIAÇÃO DA TABELA CLIENTES
-- =====================================================

CREATE TABLE IF NOT EXISTS clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100),
    email VARCHAR(150),
    data_cadastro DATE
);


-- =====================================================
-- 03. INSERÇÃO DE DADOS FICTÍCIOS
-- =====================================================

INSERT INTO clientes (nome, cidade, email, data_cadastro)
VALUES
    ('Carlos Silva', 'Itabirito',
     'carlos@example.com', '2026-11-24'),

    ('Maria Souza', 'Mariana',
     'maria@example.com', '2026-11-20'),

    ('Pedro Santos', 'Ouro Preto',
     'pedro@example.com', '2026-11-21'),

    ('Ana Oliveira', 'Itabirito',
     'ana@example.com', '2026-11-22'),

    ('Paulo Costa', 'Belo Horizonte',
     'paulo@example.com', '2026-11-23'),

    ('Juliana Lima', 'Mariana',
     'juliana@example.com', '2026-11-24');


-- =====================================================
-- 04. CONSULTAS BÁSICAS
-- =====================================================

-- Visualizar todos os clientes

SELECT *
FROM clientes;


-- =====================================================
-- 05. FILTROS COM WHERE
-- =====================================================

-- Clientes de Itabirito

SELECT *
FROM clientes
WHERE cidade = 'Itabirito';

-- Clientes de Mariana

SELECT *
FROM clientes
WHERE cidade = 'Mariana';

-- Clientes de Ouro Preto

SELECT *
FROM clientes
WHERE cidade = 'Ouro Preto';

-- Clientes de Belo Horizonte

SELECT *
FROM clientes
WHERE cidade = 'Belo Horizonte';


-- =====================================================
-- 06. OPERADORES LÓGICOS AND E OR
-- =====================================================

-- Clientes de Mariana cadastrados a partir de 21/11

SELECT *
FROM clientes
WHERE cidade = 'Mariana'
AND data_cadastro >= '2026-11-21';

-- Clientes de Mariana ou Itabirito

SELECT *
FROM clientes
WHERE cidade = 'Mariana'
OR cidade = 'Itabirito';

-- Clientes de Ouro Preto ou Belo Horizonte

SELECT *
FROM clientes
WHERE cidade = 'Ouro Preto'
OR cidade = 'Belo Horizonte';

-- Clientes de Itabirito cadastrados a partir de 23/11

SELECT *
FROM clientes
WHERE cidade = 'Itabirito'
AND data_cadastro >= '2026-11-23';


-- =====================================================
-- 07. ORDENAÇÃO DOS RESULTADOS
-- =====================================================

-- Ordem alfabética crescente

SELECT *
FROM clientes
ORDER BY nome ASC;

-- Ordem alfabética decrescente

SELECT *
FROM clientes
ORDER BY nome DESC;


-- =====================================================
-- 08. FUNÇÃO DE AGREGAÇÃO COUNT
-- =====================================================

-- Quantidade total de clientes

SELECT COUNT(*) AS total_clientes
FROM clientes;

-- Quantidade de clientes de Mariana

SELECT COUNT(*) AS total_clientes
FROM clientes
WHERE cidade = 'Mariana';

-- Quantidade de clientes de Itabirito

SELECT COUNT(*) AS total_clientes
FROM clientes
WHERE cidade = 'Itabirito';

-- Quantidade de clientes cadastrados a partir de 22/11

SELECT COUNT(*) AS total_clientes
FROM clientes
WHERE data_cadastro >= '2026-11-22';


-- =====================================================
-- 09. AGRUPAMENTO COM GROUP BY
-- =====================================================

-- Quantidade de clientes por cidade

SELECT cidade, COUNT(*) AS quantidade_clientes
FROM clientes
GROUP BY cidade;

-- Cidades com maior quantidade de clientes

SELECT cidade, COUNT(*) AS quantidade_clientes
FROM clientes
GROUP BY cidade
ORDER BY quantidade_clientes DESC, cidade ASC;

-- Cidades com menor quantidade de clientes

SELECT cidade, COUNT(*) AS quantidade_clientes
FROM clientes
GROUP BY cidade
ORDER BY quantidade_clientes ASC;


-- =====================================================
-- 10. FILTRAGEM DE GRUPOS COM HAVING
-- =====================================================

-- Cidades com dois ou mais clientes

SELECT cidade, COUNT(*) AS quantidade_clientes
FROM clientes
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- Cidades com exatamente um cliente

SELECT cidade, COUNT(*) AS quantidade_clientes
FROM clientes
GROUP BY cidade
HAVING COUNT(*) = 1;


-- =====================================================
-- 11. ANÁLISE TEMPORAL DOS CADASTROS
-- =====================================================

-- Quantidade de clientes cadastrados por dia

SELECT data_cadastro, COUNT(*) AS total_cadastros
FROM clientes
GROUP BY data_cadastro
ORDER BY data_cadastro ASC;

-- Dias com dois ou mais cadastros

SELECT data_cadastro, COUNT(*) AS total_cadastros
FROM clientes
GROUP BY data_cadastro
HAVING COUNT(*) >= 2;


-- =====================================================
-- FIM DA ETAPA 01
-- =====================================================