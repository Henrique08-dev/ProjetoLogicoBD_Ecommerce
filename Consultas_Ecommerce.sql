-- Fazendo as consultas no DB ecommerce.
USE ecommerce;

-- Recuperações simples com SELECT
SELECT * FROM Produto;
SELECT PrimeiroNome, UltimoNome, Email FROM Cliente;
SELECT Nome, Valor FROM Produto;

-- Utilizando filtros com WHERE Statement
-- Selecionando produtos onde o valor é maior que 500.
SELECT * FROM Produto WHERE Valor > 500;
-- Selecionando todos os Clientes do tipo PJ = Pessoa Juridica
SELECT * FROM Cliente WHERE TipoCliente = 'PJ';
-- Selecionando todos os pedidos onde o status é "Entregue".
SELECT * FROM Pedido WHERE StatusPedido = 'Entregue';
-- Selecionando todos os pedidos onde a categoria do produto tem ID = 5.
SELECT * FROM Produto WHERE CategoriaProduto_idCategoriaProduto = 5;

-- Expressões para gerar atributos derivados
-- Gerando preço com desconto e nomeando categoria de acordo com o preço.
SELECT 
    Nome, 
    Valor, 
    Valor * 0.9 AS PrecoComDesconto,
    CASE 
        WHEN Valor > 1000 THEN 'Premium'
        WHEN Valor > 500 THEN 'Intermediário'
        ELSE 'Econômico'
    END AS CategoriaPreco
FROM Produto;
-- Concatenando nome do cliente para gerar o nome completo e gerando a idade derivado da data de nascimento e data atual.
SELECT 
    PrimeiroNome,
    UltimoNome,
    CONCAT(PrimeiroNome, ' ', UltimoNome) AS NomeCompleto,
    YEAR(CURRENT_DATE) - YEAR(DataNascimento) AS Idade
FROM Cliente c
INNER JOIN ClientePF pf ON c.ClientePF_idClientePF = pf.idClientePF;

-- Ordenação de dados com ORDER BY
-- Ordenando itens de acordo com o valor do maior para o menor
SELECT * FROM Produto ORDER BY Valor DESC;
-- Ordenando clientes pelo Primeiro nome e Ultimo nome
SELECT * FROM Cliente ORDER BY PrimeiroNome, UltimoNome;
-- Ordenando pela data do pedido do mais recente para o mais antigo
SELECT * FROM Pedido ORDER BY DataPedido DESC;
-- Ordenando Nome e valor dos produtos de acordo com o valor do menor para o maior.
SELECT Nome, Valor FROM Produto ORDER BY Valor ASC;

-- Condições de filtros aos grupos - HAVING statement
-- Filtrando as categorias de produto que tem o preço médio maior que 300.
SELECT 
    CategoriaProduto_idCategoriaProduto,
    COUNT(*) AS QuantidadeProdutos,
    AVG(Valor) AS PrecoMedio
FROM Produto
GROUP BY CategoriaProduto_idCategoriaProduto
HAVING AVG(Valor) > 300;
-- Filtrando os clientes com um total de pedidos maior que 1, exibindo o ID e o valor total gasto.
SELECT 
    Cliente_idCliente,
    COUNT(*) AS TotalPedidos,
    SUM(TotalPedido) AS ValorTotalGasto
FROM Pedido
GROUP BY Cliente_idCliente
HAVING COUNT(*) > 1;
-- Selecionando os status dos pedidos e a sua quantidade de cada status, exibindo apenas os maiores que 1 e o valor médio do pedido.
SELECT 
    StatusPedido,
    COUNT(*) AS QuantidadePedidos,
    AVG(TotalPedido) AS ValorMedio
FROM Pedido
GROUP BY StatusPedido
HAVING COUNT(*) > 1;

-- Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados.
-- Quais os clientes que mais compram? 
SELECT 
    c.idCliente,
    CONCAT(c.PrimeiroNome, ' ', c.UltimoNome) AS Cliente,
    c.TipoCliente,
    COUNT(p.idPedido) AS TotalPedidos,
    SUM(p.TotalPedido) AS TotalGasto,
    AVG(p.TotalPedido) AS TicketMedio
FROM Cliente c
INNER JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.idCliente
HAVING TotalGasto > 0
ORDER BY TotalGasto DESC;
-- Produtos com suas categorias e fornecedores.
SELECT 
    pr.Nome AS Produto,
    cp.Nome AS Categoria,
    f.RazaoSocial AS Fornecedor,
    fp.PrecoCusto
FROM Produto pr
INNER JOIN CategoriaProduto cp ON pr.CategoriaProduto_idCategoriaProduto = cp.idCategoriaProduto
INNER JOIN Fornecedor_Produto fp ON pr.idProduto = fp.Produto_idProduto
INNER JOIN Fornecedor f ON fp.Fornecedor_idFornecedor = f.idFornecedor;
-- Quais os produtos mais vendidos de acordo com a receita total?
SELECT 
    p.Nome AS Produto,
    cp.Nome AS Categoria,
    SUM(pp.Quantidade) AS TotalVendido,
    SUM(pp.Quantidade * pp.PrecoUnitario) AS ReceitaTotal
FROM Produto p
INNER JOIN Pedido_Produto pp ON p.idProduto = pp.Produto_idProduto
INNER JOIN CategoriaProduto cp ON p.CategoriaProduto_idCategoriaProduto = cp.idCategoriaProduto
GROUP BY p.idProduto, cp.idCategoriaProduto
ORDER BY ReceitaTotal DESC;
-- Pedidos com detalhes do pagamento
SELECT 
    p.idPedido,
    p.DataPedido,
    p.TotalPedido,
    pg.TipoPagamento,
    pg.StatusPagamento,
    pp.ValorPago,
    pp.DataPagamento
FROM Pedido p
INNER JOIN Pedido_Pagamento pp ON p.idPedido = pp.Pedido_idPedido
INNER JOIN Pagamento pg ON pp.Pagamento_idPagamento = pg.idPagamento;


