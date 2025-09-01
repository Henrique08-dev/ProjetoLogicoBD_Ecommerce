-- Inserção de dados nas tabelas.

USE ecommerce;

-- Inserindo dados na tabela ClientePF
INSERT INTO ClientePF (CPF, DataNascimento) VALUES
('12345678901', '1985-03-15'),
('23456789012', '1990-07-22'),
('34567890123', '1982-11-30'),
('45678901234', '1995-05-18'),
('56789012345', '1988-12-05'),
('67890123456', '1992-09-14'),
('78901234567', '1980-02-28'),
('89012345678', '1998-06-10'),
('90123456789', '1987-04-25'),
('01234567890', '1993-08-08');
-- Inserindo dados na tabela ClientePJ
INSERT INTO ClientePJ (CNPJ, RazaoSocial, NomeFantasia) VALUES
('12345678000195', 'Tech Solutions Ltda', 'TechSol'),
('23456789000186', 'Comércio Varejista S.A.', 'ComVar'),
('34567890000177', 'Indústrias Reunidas', 'IndReu'),
('45678901000168', 'Serviços Gerais EIRELI', 'SerGer'),
('56789012000159', 'Alimentos Saudáveis Ltda', 'AliSad');
-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (PrimeiroNome, UltimoNome, Email, Telefone, TipoCliente, ClientePF_idClientePF, ClientePJ_idClientePJ) VALUES
('João', 'Silva', 'joao.silva@email.com', '(11)99999-1111', 'PF', 1, NULL),
('Maria', 'Santos', 'maria.santos@email.com', '(11)99999-2222', 'PF', 2, NULL),
('Pedro', 'Oliveira', 'pedro.oliveira@email.com', '(11)99999-3333', 'PF', 3, NULL),
('Ana', 'Costa', 'ana.costa@email.com', '(11)99999-4444', 'PF', 4, NULL),
('Carlos', 'Pereira', 'carlos.pereira@email.com', '(11)99999-5555', 'PF', 5, NULL),
('Tech Solutions', 'Ltda', 'contato@techsol.com', '(11)3333-1111', 'PJ', NULL, 1),
('Comércio', 'Varejista', 'vendas@comvar.com', '(11)3333-2222', 'PJ', NULL, 2),
('Indústrias', 'Reunidas', 'compras@indreu.com', '(11)3333-3333', 'PJ', NULL, 3),
('Serviços', 'Gerais', 'contato@serger.com', '(11)3333-4444', 'PJ', NULL, 4),
('Alimentos', 'Saudáveis', 'sac@alisd.com', '(11)3333-5555', 'PJ', NULL, 5);
-- Inserindo dados na tabela Endereco
INSERT INTO Endereco (Logradouro, Numero, Complemento, Bairro, Cidade, Estado, CEP, Cliente_idCliente, TipoEndereco) VALUES
('Rua das Flores', '123', 'Apto 101', 'Centro', 'São Paulo', 'SP', '01001000', 1, 'Residencial'),
('Avenida Brasil', '456', NULL, 'Jardins', 'São Paulo', 'SP', '01430000', 2, 'Residencial'),
('Rua Augusta', '789', 'Sala 5', 'Consolação', 'São Paulo', 'SP', '01305000', 3, 'Comercial'),
('Alameda Santos', '321', 'Apto 302', 'Cerqueira César', 'São Paulo', 'SP', '01418000', 4, 'Residencial'),
('Praça da Sé', '654', 'Loja 10', 'Sé', 'São Paulo', 'SP', '01001000', 5, 'Comercial'),
('Rua Bela Cintra', '987', NULL, 'Consolação', 'São Paulo', 'SP', '01415000', 6, 'Comercial'),
('Avenida Paulista', '159', 'Andar 12', 'Bela Vista', 'São Paulo', 'SP', '01311000', 7, 'Comercial'),
('Rua Haddock Lobo', '753', NULL, 'Cerqueira César', 'São Paulo', 'SP', '01414000', 8, 'Comercial'),
('Alameda Jaú', '456', 'Apto 201', 'Jardim Paulista', 'São Paulo', 'SP', '01420000', 9, 'Residencial'),
('Rua Oscar Freire', '852', 'Loja 5', 'Jardim América', 'São Paulo', 'SP', '01426000', 10, 'Comercial');
-- Inserindo dados na tabela Fornecedor
INSERT INTO Fornecedor (RazaoSocial, NomeFantasia, CNPJ, Email, Telefone) VALUES
('Fornecedor Nacional Ltda', 'FornNac', '11222333000144', 'contato@fornnac.com', '(11)4444-1111'),
('Distribuidora Comercial S.A.', 'DistCom', '22333444000155', 'vendas@distcom.com', '(11)4444-2222'),
('Indústria de Eletrônicos', 'IndElet', '33444555000166', 'compras@indelet.com', '(11)4444-3333'),
('Importadora de Produtos', 'ImportProd', '44555666000177', 'contato@importprod.com', '(11)4444-4444'),
('Comércio de Materiais', 'ComMat', '55666777000188', 'vendas@commat.com', '(11)4444-5555');
-- Inserindo dados na tabela CategoriaProduto
INSERT INTO CategoriaProduto (Nome, Descricao) VALUES
('Móveis', 'Móveis para casa e escritório'),
('Brinquedos', 'Brinquedos para todas as idades'),
('Vestuário', 'Roupas e acessórios'),
('Comida', 'Alimentos e bebidas'),
('Eletrônico', 'Aparelhos eletrônicos e acessórios');
-- Inserindo dados na tabela Produto
INSERT INTO Produto (Nome, Descricao, Valor, Peso, Dimensoes, CategoriaProduto_idCategoriaProduto) VALUES
('Sofá 3 Lugares', 'Sofá retrátil em couro sintético', 1200.00, 45.5, '200x90x80 cm', 1),
('Mesa de Jantar', 'Mesa de madeira com 6 cadeiras', 899.90, 60.0, '160x90x75 cm', 1),
('Carrinho de Controle Remoto', 'Carrinho elétrico para crianças', 199.90, 2.5, '30x20x15 cm', 2),
('Boneca Articulada', 'Boneca com acessórios inclusos', 79.90, 0.8, '40x20x10 cm', 2),
('Camiseta Básica', 'Camiseta 100% algodão', 39.90, 0.3, 'P/M/G', 3),
('Calça Jeans', 'Calça jeans masculina', 129.90, 0.6, '38 a 50', 3),
('Cesta de Café da Manhã', 'Variedade de pães, frios e bebidas', 149.90, 3.0, '40x30x20 cm', 4),
('Vinho Tinto Seco', 'Vinho tinto seco da serra gaúcha', 89.90, 1.2, '30x8x8 cm', 4),
('Smartphone Android', 'Smartphone com 128GB e câmera tripla', 999.90, 0.4, '16x8x1 cm', 5),
('Tablet 10 polegadas', 'Tablet com 64GB e caneta stylus', 699.90, 0.6, '25x17x1 cm', 5);
-- Inserindo dados na tabela fornecedor-poduto
INSERT INTO Fornecedor_Produto (Fornecedor_idFornecedor, Produto_idProduto, PrecoCusto) VALUES
(1, 1, 800.00),
(1, 2, 600.00),
(2, 3, 120.00),
(2, 4, 45.00),
(3, 5, 25.00),
(3, 6, 80.00),
(4, 7, 90.00),
(4, 8, 55.00),
(5, 9, 700.00),
(5, 10, 500.00);
-- Inserindo dados na tabela Estoque
INSERT INTO Estoque (Localidade, Responsave, Telefone) VALUES
('Centro de Distribuição SP', 'Carlos Almeida', '(11)5555-1111'),
('Galpão Zona Leste', 'Fernanda Silva', '(11)5555-2222'),
('Depósito Zona Sul', 'Roberto Santos', '(11)5555-3333'),
('Armazém Zona Oeste', 'Patrícia Oliveira', '(11)5555-4444'),
('Centro Logístico ABC', 'Ricardo Costa', '(11)5555-5555');
-- Inserindo dados na tabela Produto-Estoque
INSERT INTO Produto_Estoque (Produto_idProduto, Estoque_idEstoque, Quantidade, Localizacao) VALUES
(1, 1, 15, 'Corredor A, Prateleira 3'),
(2, 1, 8, 'Corredor A, Prateleira 4'),
(3, 2, 30, 'Corredor B, Prateleira 1'),
(4, 2, 45, 'Corredor B, Prateleira 2'),
(5, 3, 100, 'Corredor C, Prateleira 1'),
(6, 3, 75, 'Corredor C, Prateleira 2'),
(7, 4, 20, 'Corredor D, Prateleira 1'),
(8, 4, 35, 'Corredor D, Prateleira 2'),
(9, 5, 25, 'Corredor E, Prateleira 1'),
(10, 5, 18, 'Corredor E, Prateleira 2');
-- Inserindo dados na tabela Terceirizado
INSERT INTO Terceirizado (RazaoSocial, NomeFantasia, CNPJ, Localidade, Email, Telefone) VALUES
('Vendas Online Ltda', 'VenOn', '66777888000199', 'São Paulo', 'contato@venon.com', '(11)6666-1111'),
('Marketplace Digital', 'MarkDig', '77888999000100', 'Rio de Janeiro', 'vendas@markdig.com', '(21)6666-2222'),
('E-commerce Solutions', 'EcomSol', '88999000000111', 'Minas Gerais', 'contato@ecomsol.com', '(31)6666-3333'),
('Loja Virtual Brasil', 'LojaVir', '99000111000122', 'Bahia', 'sac@lojavir.com', '(71)6666-4444'),
('Varejo Digital', 'VarDig', '00111222000133', 'Paraná', 'vendas@vardig.com', '(41)6666-5555');
-- Inserindo dados na tabela Terceirizado-Produto
INSERT INTO Terceirizado_Produto (Terceirizado_idTerceirizado, Produto_idProduto, Quantidade, PrecoVenda) VALUES
(1, 1, 5, 1250.00),
(1, 2, 3, 950.00),
(2, 3, 10, 220.00),
(2, 4, 15, 90.00),
(3, 5, 20, 45.00),
(3, 6, 15, 140.00),
(4, 7, 8, 160.00),
(4, 8, 12, 95.00),
(5, 9, 6, 1050.00),
(5, 10, 4, 750.00);
-- Inserindo dados na tabela Pedido
INSERT INTO Pedido (StatusPedido, Descricao, Cliente_idCliente, Frete, TotalPedido, DataPedido) VALUES
('Entregue', 'Pedido de móveis para sala', 1, 50.00, 1250.00, '2023-05-10 14:30:00'),
('Separado', 'Pedido de eletrônicos', 2, 25.00, 1024.90, '2023-05-15 10:15:00'),
('Em andamento', 'Pedido de vestuário', 3, 15.00, 169.80, '2023-05-18 16:45:00'),
('Entregue', 'Pedido corporativo - presentes', 6, 0.00, 239.80, '2023-05-20 09:30:00'),
('Cancelado', 'Pedido cancelado pelo cliente', 4, 20.00, 149.90, '2023-05-22 11:20:00'),
('Em andamento', 'Pedido de alimentos', 5, 30.00, 179.80, '2023-05-25 13:10:00'),
('Separado', 'Pedido de brinquedos', 7, 35.00, 279.80, '2023-05-28 15:40:00'),
('Entregue', 'Pedido de eletrônicos premium', 8, 0.00, 1699.80, '2023-06-01 17:25:00'),
('Em andamento', 'Pedido variado', 9, 40.00, 309.70, '2023-06-05 12:15:00'),
('Separado', 'Pedido corporativo - brindes', 10, 0.00, 199.90, '2023-06-10 14:50:00');
-- Inserindo dados na tabela Pedido-Produto
INSERT INTO Pedido_Produto (Pedido_idPedido, Produto_idProduto, Quantidade, PrecoUnitario) VALUES
(1, 1, 1, 1200.00),
(2, 9, 1, 999.90),
(3, 5, 2, 39.90),
(3, 6, 1, 129.90),
(4, 3, 1, 199.90),
(4, 4, 1, 79.90),
(5, 7, 1, 149.90),
(6, 7, 1, 149.90),
(7, 3, 1, 199.90),
(7, 4, 1, 79.90),
(8, 9, 1, 999.90),
(8, 10, 1, 699.90),
(9, 5, 3, 39.90),
(9, 8, 2, 89.90),
(10, 4, 2, 79.90);
-- Inserindo dados na tabela Pagamento
INSERT INTO Pagamento (TipoPagamento, Detalhes, StatusPagamento) VALUES
('Cartão Crédito', 'Parcelado em 3x', 'Aprovado'),
('Pix', 'Pagamento instantâneo', 'Aprovado'),
('Cartão Débito', 'Débito em conta', 'Aprovado'),
('Boleto', 'Vencimento em 7 dias', 'Aprovado'),
('Cartão Crédito', 'Parcelado em 2x', 'Recusado'),
('Pix', 'Pagamento instantâneo', 'Aprovado'),
('Cartão Crédito', 'Parcelado em 4x', 'Aprovado'),
('Cartão Crédito', 'Parcelado em 6x', 'Aprovado'),
('Boleto', 'Vencimento em 5 dias', 'Pendente'),
('Cartão Débito', 'Débito em conta', 'Aprovado');
-- Inserindo dados na tabela Pedido-Pagamento
INSERT INTO Pedido_Pagamento (Pedido_idPedido, Pagamento_idPagamento, ValorPago, DataPagamento) VALUES
(1, 1, 1250.00, '2023-05-10 14:35:00'),
(2, 2, 1024.90, '2023-05-15 10:20:00'),
(3, 3, 169.80, '2023-05-18 16:50:00'),
(4, 4, 239.80, '2023-05-20 09:35:00'),
(5, 5, 149.90, '2023-05-22 11:25:00'),
(6, 6, 179.80, '2023-05-25 13:15:00'),
(7, 7, 279.80, '2023-05-28 15:45:00'),
(8, 8, 1699.80, '2023-06-01 17:30:00'),
(9, 9, 309.70, '2023-06-05 12:20:00'),
(10, 10, 199.90, '2023-06-10 14:55:00');
-- Inserindo dados na tabela Entrega
INSERT INTO Entrega (CodigoRastreio, StatusEntrega, DataEnvio, DataEntrega, Transportadora, Pedido_idPedido) VALUES
('BR123456789SP', 'Entregue', '2023-05-11', '2023-05-13', 'Correios', 1),
('BR234567890SP', 'Saiu para entrega', '2023-05-16', NULL, 'Transportadora Express', 2),
('BR345678901SP', 'Preparando', NULL, NULL, 'Logística Rápida', 3),
('BR456789012SP', 'Entregue', '2023-05-21', '2023-05-23', 'Correios', 4),
(NULL, 'Preparando', NULL, NULL, 'Entregas Now', 5),
('BR678901234SP', 'Em trânsito', '2023-05-26', NULL, 'Transportadora Nacional', 6),
('BR789012345SP', 'Enviado', '2023-05-29', NULL, 'Logística Fácil', 7),
('BR890123456SP', 'Entregue', '2023-06-02', '2023-06-05', 'Entregas Rápidas', 8),
('BR901234567SP', 'Preparando', NULL, NULL, 'Transportadora Central', 9),
('BR012345678SP', 'Enviado', '2023-06-11', NULL, 'Correios', 10);

