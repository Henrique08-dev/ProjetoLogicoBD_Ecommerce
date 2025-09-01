CREATE DATABASE ecommerce;
USE ecommerce;

-- Criando tabela Cliente Pessoa Física
CREATE TABLE ClientePF (
	idClientePF INT auto_increment primary key,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    DataNascimento DATE NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );
-- Criando tabela Cliente Pessoa Jurídica 
CREATE TABLE ClientePJ(
	idCLientePJ INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ VARCHAR(14) NOT NULL UNIQUE,
    RazaoSocial VARCHAR(100) NOT NULL,
    NomeFantasia VARCHAR(100),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- Criando tabela Cliente
CREATE TABLE Cliente (
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
    PrimeiroNome VARCHAR(15) NOT NULL,
    UltimoNome VARCHAR(15) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    TipoCliente ENUM('PF','PJ') NOT NULL,
    ClientePF_idClientePF INT,
    ClientePJ_idClientePJ INT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_Cliente_ClientePF FOREIGN KEY (ClientePF_idClientePF) REFERENCES ClientePF(idClientePF),
    CONSTRAINT fk_Cliente_ClientePJ FOREIGN KEY (ClientePJ_idClientePJ) REFERENCES ClientePJ(idClientePJ),
    CONSTRAINT chk_tipo_cliente CHECK (
		(TipoCliente = 'PF' AND ClientePF_idClientePF IS NOT NULL AND ClientePJ_idClientePJ IS NULL) or
        (TipoCliente = 'PJ' AND ClientePJ_idClientePJ IS NOT NULL AND ClientePF_idClientePF IS NULL)
    )
);

-- Criando tabela endereço
CREATE TABLE Endereco(
	idEndereco INT AUTO_INCREMENT PRIMARY KEY,
    Logradouro VARCHAR(100) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Complemento VARCHAR(50),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50) NOT NULL,
    Estado CHAR(2) NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    Cliente_idCliente INT NOT NULL,
    TipoEndereco ENUM('Residencial','Comercial','Entrega') DEFAULT 'Residencial',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_Endereco_Cliente FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);
-- Criando Tabela Fornecedor
CREATE TABLE Fornecedor (
	idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    NomeFantasia VARCHAR(100),
    CNPJ VARCHAR(14) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- Criando Tabela CategoriaProduto
CREATE TABLE CategoriaProduto(
	idCategoriaProduto INT AUTO_INCREMENT PRIMARY KEY,
    Nome ENUM('Móveis', 'Brinquedos', 'Vestuário', 'Comida', 'Eletrônico'),
    Descricao TEXT,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Criando Tabela Produto
CREATE TABLE Produto(
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Valor DECIMAL (10,2) NOT NULL CHECK (Valor >= 0),
    Peso DECIMAL (8,2),
    Dimensoes VARCHAR (50),
    CategoriaProduto_idCategoriaProduto INT,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_Produto_Categoria FOREIGN KEY (CategoriaProduto_idCategoriaProduto) REFERENCES CategoriaProduto(idCategoriaProduto)
);
-- Criando tabela de relacionamento Fornecedor-Produto
-- Essa tabela corresponde a tabela "Disponibilizando um Produto" do modelo conceitual, apenas alterei no projeto lógico para melhor compreensão.
CREATE TABLE Fornecedor_Produto (
	Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    PrecoCusto DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    CONSTRAINT fk_FornecedorProduto_Fornecedor FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    CONSTRAINT fk_FornecedorProduto_Produto FOREIGN KEY (Produto_idProduto) REFERENCES Produto (idProduto)
);
-- Criando a tabela de Estoque
CREATE TABLE Estoque(
	idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    Localidade VARCHAR(100) NOT NULL,
    Responsave VARCHAR(100),
    Telefone VARCHAR(20),
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Criando Tabela de Relacionamento Produto-Estoque
-- Essa tabela corresponde a tabela "Relação de ProdutoxEstoque no modelo conceitual"
CREATE TABLE Produto_Estoque(
	Produto_idProduto INT,
    Estoque_idEstoque INT,
    Quantidade INT NOT NULL DEFAULT 0 CHECK (Quantidade >=0),
    Localizacao VARCHAR(50),
    PRIMARY KEY (Produto_idProduto, Estoque_idEstoque),
    CONSTRAINT fk_ProdutoEstoque_Produto FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    CONSTRAINT fk_ProdutoEstoque_Estoque FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);
-- Criando Tabela Terceirizado
CREATE TABLE Terceirizado (
	idTerceirizado INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    NomeFantasia VARCHAR(100),
    CNPJ VARCHAR (14) NOT NULL UNIQUE,
    Localidade VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefone VARCHAR(100) NOT NULL,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Criando a tabela de Relacionamento Terceirizado-Produto
CREATE TABLE Terceirizado_Produto(
	Terceirizado_idTerceirizado INT,
    Produto_idProduto INT,
    Quantidade INT NOT NULL DEFAULT 0 CHECK (Quantidade >= 0),
    PrecoVenda DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Terceirizado_idTerceirizado, Produto_idProduto),
    CONSTRAINT fk_TerceirizadoProduto_Terceirizado FOREIGN KEY (Terceirizado_idTerceirizado) REFERENCES Terceirizado(idTerceirizado),
    CONSTRAINT fk_TerceirizadoProduto_Produto FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);
-- Criado tabela Pedido
CREATE TABLE Pedido(
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
    StatusPedido ENUM('Em andamento', 'Entregue', 'Separado', 'Cancelado') DEFAULT 'Em andamento',
    Descricao TEXT,
    Cliente_idCliente INT NOT NULL,
    Frete DECIMAL(10,2) DEFAULT 0 CHECK (Frete >= 0),
    TotalPedido DECIMAL(10,2) DEFAULT 0,
    DataPedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_Pedido_Cliente FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);
-- Criando tabela de relacionamento Pedido-Produto
SHOW TABLES;
CREATE TABLE Pedido_Produto(
	Pedido_idPedido INT,
    Produto_idProduto INT,
    Quantidade INT NOT NULL CHECK (Quantidade > 0),
    PrecoUnitario DECIMAL(10,2) NOT NULL,
    Subtotal DECIMAL(10,2) GENERATED ALWAYS AS (Quantidade*PrecoUnitario) STORED,
    PRIMARY KEY (Pedido_idPedido, Produto_idProduto),
    CONSTRAINT fk_PedidoProduto_Pedido FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    CONSTRAINT fk_PedidoProduto_Produto FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);
-- Criando Tabela Pagamento
CREATE TABLE Pagamento(
	idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    TipoPagamento ENUM('Cartão Crédito', 'Cartão Débito','Boleto', 'Pix') NOT NULL,
    Detalhes VARCHAR (100),
    StatusPagamento ENUM('Pendente', 'Aprovado', 'Recusado', 'Estornado') DEFAULT 'Pendente',
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Criando tabela da relação de Pedido e Pagamento
CREATE TABLE Pedido_Pagamento(
    Pedido_idPedido INT,
    Pagamento_idPagamento INT,
    ValorPago DECIMAL(10,2) NOT NULL,
    DataPagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (Pedido_idPedido, Pagamento_idPagamento),
    CONSTRAINT fk_PedidoPagamento_Pedido FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    CONSTRAINT fk_PedidoPagamento_Pagamento FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento)	
);
-- Criando tabela de Entrega
CREATE TABLE Entrega(
    idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    CodigoRastreio VARCHAR(50) UNIQUE,
    StatusEntrega ENUM('Preparando', 'Enviado', 'Em trânsito', 'Saiu para entrega', 'Entregue', 'Devolvido') DEFAULT 'Preparando',
    DataEnvio DATE,
    DataEntrega DATE,
    Transportadora VARCHAR(100),
    Pedido_idPedido INT NOT NULL UNIQUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_Entrega_Pedido FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    CONSTRAINT chk_datas_entrega CHECK (DataEnvio <= DataEntrega OR DataEntrega IS NULL)
);
-- Vou criar Triggers para inserção, atualização e remoção para ser realizado corretamente o calculo do subtotal.
-- Correspondente a tabela Pedido_Produto
-- Trigger para inserção
DELIMITER //
CREATE TRIGGER depois_pedido_produto_inserido
AFTER INSERT ON Pedido_Produto
FOR EACH ROW
BEGIN
    UPDATE Pedido 
    SET TotalPedido = (
        SELECT COALESCE(SUM(Subtotal), 0)
        FROM Pedido_Produto 
        WHERE Pedido_idPedido = NEW.Pedido_idPedido
    )
    WHERE idPedido = NEW.Pedido_idPedido;
END;
//
DELIMITER ;
-- Trigger para atualização
DELIMITER //
CREATE TRIGGER depois_pedido_produto_atualizado
AFTER UPDATE ON Pedido_Produto
FOR EACH ROW
BEGIN
    UPDATE Pedido 
    SET TotalPedido = (
        SELECT COALESCE(SUM(Subtotal), 0)
        FROM Pedido_Produto 
        WHERE Pedido_idPedido = NEW.Pedido_idPedido
    )
    WHERE idPedido = NEW.Pedido_idPedido;
END;
//
DELIMITER ;
-- Trigger para remoção (delete)
DELIMITER //
CREATE TRIGGER depois_pedido_produto_removido
AFTER DELETE ON Pedido_Produto
FOR EACH ROW
BEGIN
    UPDATE Pedido 
    SET TotalPedido = (
        SELECT COALESCE(SUM(Subtotal), 0)
        FROM Pedido_Produto 
        WHERE Pedido_idPedido = OLD.Pedido_idPedido
    )
    WHERE idPedido = OLD.Pedido_idPedido;
END;
//
DELIMITER ;