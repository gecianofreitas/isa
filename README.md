-- Criação da tabela de produtos
CREATE TABLE produtos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  estoque INT NOT NULL
);

-- Criação da tabela de pedidos
CREATE TABLE pedidos (
  id SERIAL PRIMARY KEY,
  id_produto INT REFERENCES produtos(id),
  cliente VARCHAR(100) NOT NULL,
  data_pedido DATE DEFAULT CURRENT_DATE,
  quantidade INT NOT NULL
);

-- Inserindo registros na tabela produtos
INSERT INTO produtos (nome, preco, estoque) VALUES
('Livro A', 49.90, 10),
('Livro B', 59.90, 5),
('Livro C', 39.90, 8);

-- Inserindo registros na tabela pedidos
INSERT INTO pedidos (id_produto, cliente, quantidade) VALUES
(1, 'Maria Oliveira', 2),
(2, 'João Silva', 1),
(3, 'Ana Lima', 3);
