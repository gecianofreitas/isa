-- Criação da tabela 'produtos'
CREATE TABLE produtos (
    id_produto INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    preco REAL NOT NULL,
    estoque INTEGER NOT NULL
);

-- Criação da tabela 'pedidos'
CREATE TABLE pedidos (
    id_pedido INTEGER PRIMARY KEY,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Inserção de registros na tabela 'produtos'
INSERT INTO produtos (id_produto, nome, preco, estoque) VALUES (1, 'Livro A', 45.90, 10);
INSERT INTO produtos (id_produto, nome, preco, estoque) VALUES (2, 'Livro B', 32.50, 15);
INSERT INTO produtos (id_produto, nome, preco, estoque) VALUES (3, 'Livro C', 60.00, 5);

-- Inserção de registros na tabela 'pedidos'
INSERT INTO pedidos (id_pedido, id_produto, quantidade, data_pedido) VALUES (1, 1, 2, '2025-06-20');
INSERT INTO pedidos (id_pedido, id_produto, quantidade, data_pedido) VALUES (2, 3, 1, '2025-06-22');
INSERT INTO pedidos (id_pedido, id_produto, quantidade, data_pedido) VALUES (3, 2, 4, '2025-06-24');

-- Atualização do estoque após um pedido
UPDATE produtos SET estoque = estoque - 2 WHERE id_produto = 1;

-- Remoção de um pedido (exemplo)
DELETE FROM pedidos WHERE id_pedido = 2;

-- Consulta de produtos com estoque menor que 10
SELECT nome, preco FROM produtos WHERE estoque < 10;

-- Consulta de pedidos realizados
SELECT p.id_pedido, pr.nome AS produto, p.quantidade, p.data_pedido
FROM pedidos p
JOIN produtos pr ON p.id_produto = pr.id_produto;
