-- 1. Criação e Seleção do Banco
CREATE DATABASE IF NOT EXISTS senaitech_db;
USE senaitech_db;

-- 2. Limpeza em Ordem Inversa de Dependência (evitar erros de Foreign Key)
DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS categorias;

-- 3. Tabela 1: CATEGORIAS
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);

-- 4. Tabela 2: PRODUTOS
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- 5. Tabela 3: VENDAS
CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    data_venda DATE NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- 6. Inserção de Dados para Testes
INSERT INTO categorias (nome_categoria) VALUES 
('Eletrônicos'), 
('Acessórios'), 
('Móveis'), 
('Periféricos');

INSERT INTO produtos (nome, preco, estoque, id_categoria) VALUES
('Notebook Gamer', 4500.00, 8, 1),
('Mouse Sem Fio', 89.90, 45, 2),
('Teclado Mecânico', 250.00, 15, 4),
('Monitor 27', 1200.00, 5, 1),
('Cadeira Ergonômica', 890.00, 0, 3),
('Mesa Stand Desk', 1500.00, 3, 3),
('Suporte Monitor', 120.00, 0, NULL); -- Produto sem categoria cadastrada

INSERT INTO vendas (id_produto, quantidade, valor_total, data_venda) VALUES
(1, 1, 4500.00, '2024-10-01'),
(2, 2, 179.80, '2024-10-01'),
(3, 1, 250.00, '2024-10-02'),
(1, 1, 4500.00, '2024-10-03'),
(4, 2, 2400.00, '2024-10-04');
