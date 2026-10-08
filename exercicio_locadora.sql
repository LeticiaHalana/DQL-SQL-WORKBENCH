-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS locadora_db;
USE locadora_db;

-- Remoção das tabelas para reexecução do script
DROP TABLE IF EXISTS locacoes;
DROP TABLE IF EXISTS filmes;
DROP TABLE IF EXISTS clientes;

-- Tabela 1: Clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    cidade VARCHAR(50) NOT NULL
);

-- Tabela 2: Filmes
CREATE TABLE filmes (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(30) NOT NULL,
    ano_lancamento INT NOT NULL,
    preco_diaria DECIMAL(5,2) NOT NULL,
    classificacao_indicativa VARCHAR(10)
);

-- Tabela 3: Locações
CREATE TABLE locacoes (
    id_locacao INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_filme INT NOT NULL,
    data_locacao DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao_real DATE,
    valor_pago DECIMAL(5,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme)
);

-- Inserção de Dados: Clientes
INSERT INTO clientes (nome, email, telefone, cidade) VALUES
('Carlos Eduardo Silva', 'carlos.silva@email.com', '(11) 98765-4321', 'São Paulo'),
('Mariana Santos', 'mariana.santos@email.com', NULL, 'Campinas'),
('Roberto Alves', NULL, '(21) 97654-3210', 'Rio de Janeiro'),
('Patricia Lima', 'patricia.lima@email.com', '(31) 96543-2109', 'Belo Horizonte'),
('Fernanda Costa', NULL, NULL, 'São Paulo'),
('Lucas Mendes', 'lucas.mendes@email.com', '(11) 95432-1098', 'Santos'),
('Juliana Paes', 'juliana.paes@email.com', '(21) 94321-0987', 'Niterói'),
('Gabriel Oliveira', NULL, '(41) 93210-9876', 'Curitiba'),
('Aline Barbosa', 'aline.barbosa@email.com', '(11) 92109-8765', 'São Paulo'),
('Rodrigo Rocha', 'rodrigo.rocha@email.com', NULL, 'Campinas'),
('Beatriz Martins', NULL, '(31) 91098-7654', 'Belo Horizonte'),
('Thiago Ferreira', 'thiago.ferreira@email.com', '(41) 90987-6543', 'Curitiba'),
('Camila Rodrigues', 'camila.r@email.com', '(11) 98888-7777', 'São Paulo'),
('Diego Souza', NULL, NULL, 'Rio de Janeiro'),
('Vanessa Nunes', 'vanessa.nunes@email.com', '(21) 97777-6666', 'Niterói');

-- Inserção de Dados: Filmes
INSERT INTO filmes (titulo, genero, ano_lancamento, preco_diaria, classificacao_indicativa) VALUES
('Matrix', 'Ação', 1999, 8.50, '14 anos'),
('O Poderoso Chefão', 'Drama', 1972, 6.00, '16 anos'),
('De Volta para o Futuro', 'Sci-Fi', 1985, 7.00, 'Livre'),
('Jurassic Park', 'Aventura', 1993, 7.50, '12 anos'),
('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 2001, 9.00, '12 anos'),
('Pulp Fiction', 'Crime', 1994, 6.50, '18 anos'),
('Interestelar', 'Sci-Fi', 2014, 10.00, '10 anos'),
('Vingadores: Ultimato', 'Ação', 2019, 12.00, '12 anos'),
('Toy Story', 'Animação', 1995, 5.00, 'Livre'),
('O Iluminado', 'Terror', 1980, 6.00, '16 anos'),
('Gladiador', 'Ação', 2000, 7.50, '16 anos'),
('Forrest Gump', 'Drama', 1994, 6.00, '12 anos'),
('Avatar', 'Sci-Fi', 2009, 9.50, '12 anos'),
('Coringa', 'Drama', 2019, 11.00, '16 anos'),
(' Divertida Mente', 'Animação', 2015, 8.00, NULL);

-- Inserção de Dados: Locações
INSERT INTO locacoes (id_cliente, id_filme, data_locacao, data_devolucao_prevista, data_devolucao_real, valor_pago) VALUES
(1, 1, '2024-09-01', '2024-09-03', '2024-09-03', 17.00),
(2, 3, '2024-09-02', '2024-09-04', '2024-09-04', 14.00),
(3, 8, '2024-09-05', '2024-09-07', NULL, NULL),
(4, 5, '2024-09-06', '2024-09-08', '2024-09-09', 27.00),
(5, 9, '2024-09-10', '2024-09-12', '2024-09-11', 10.00),
(6, 7, '2024-09-12', '2024-09-14', NULL, NULL),
(7, 2, '2024-09-15', '2024-09-17', '2024-09-17', 12.00),
(8, 4, '2024-09-18', '2024-09-20', '2024-09-20', 15.00),
(9, 10, '2024-09-20', '2024-09-22', NULL, NULL),
(10, 6, '2024-09-22', '2024-09-24', '2024-09-23', 13.00),
(1, 12, '2024-09-25', '2024-09-27', '2024-09-27', 12.00),
(11, 11, '2024-09-28', '2024-09-30', NULL, NULL),
(12, 13, '2024-10-01', '2024-10-03', '2024-10-03', 19.00),
(13, 14, '2024-10-02', '2024-10-04', NULL, NULL),
(14, 15, '2024-10-03', '2024-10-05', '2024-10-05', 16.00);
