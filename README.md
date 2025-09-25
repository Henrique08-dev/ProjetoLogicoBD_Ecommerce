Projeto Lógico de Banco de Dados para E-commerce

📋 Descrição do Projeto
Este projeto consiste na modelagem e implementação de um banco de dados relacional para um sistema de e-commerce, contemplando desde a criação do schema até consultas complexas para análise de dados.

🎯 Contexto de Desenvolvimento
O sistema foi desenvolvido para atender às necessidades de um e-commerce que trabalha com:
- Vendas B2C (Business to Consumer) e B2B (Business to Business)
- Múltiplas categorias de produtos (Móveis, Brinquedos, Vestuário, Comida, Eletrônicos)
- Gestão de fornecedores e terceirizados
- Controle de estoque distribuído
- Processos completos de pedidos, pagamentos e entregas

🏗️ Estrutura do Banco de Dados

Entidades Principais
- **Cliente**: Suporte a PF (Pessoa Física) e PJ (Pessoa Jurídica)
- **Produto**: Com categorização e atributos detalhados
- **Fornecedor**: Cadastro de empresas fornecedoras
- **Pedido**: Gestão completa do ciclo de vida do pedido
- **Pagamento**: Múltiplas formas de pagamento
- **Entrega**: Rastreamento e status de entregas

Relacionamentos Complexos
- Cliente → Endereços múltiplos (Residencial, Comercial, Entrega)
- Produto ↔ Fornecedor (Relação muitos-para-muitos)
- Produto ↔ Estoque (Controle de quantidade por localidade)
- Pedido ↔ Produto (Itens do pedido com subtotal automático)
- Pedido ↔ Pagamento (Múltiplas formas de pagamento por pedido)

⚙️ Funcionalidades Implementadas

👥 Gestão de Clientes
- Diferenciação entre PF e PJ
- Múltiplos endereços por cliente
- Contatos e informações específicas por tipo

📦 Gestão de Produtos
- Categorização flexível
- Controle de preço de custo e venda
- Atributos físicos (peso, dimensões)

🤝 Relacionamento com Fornecedores
- Cadastro completo de fornecedores
- Preço de custo por produto-fornecedor
- Gestão de produtos terceirizados

🛒 Processo de Vendas
- Carrinho de compras com subtotal automático
- Múltiplos status de pedido
- Cálculo automático do total do pedido via triggers

💳 Sistema de Pagamentos
- Múltiplas formas de pagamento
- Status de aprovação
- Histórico de transações

🚚 Sistema de Entregas
- Rastreamento de pacotes
- Múltiplos status de entrega
- Gestão de transportadoras

🛠️ Tecnologias Utilizadas
- **MySQL**: SGBD relacional
- **SQL**: Linguagem de consulta e manipulação de dados
- **Triggers**: Automação de cálculos de totais
- **Constraints**: Validação e integridade dos dados

📊 Principais Consultas Implementadas

Análise Comercial
- Clientes que mais compram (valor e quantidade)
- Produtos mais vendidos por receita
- Categorias com melhor performance

Gestão Operacional
- Controle de estoque por localidade
- Status de pedidos e entregas
- Reconciliação de pagamentos

Business Intelligence
- Ticket médio por cliente
- Preço médio por categoria
- Eficiência no processo de entregas

🎯 Objetivos Atendidos
1. **Normalização**: Estrutura em 3ª forma normal
2. **Performance**: Índices e chaves adequadas
3. **Integridade**: Constraints e relações bem definidas
4. **Flexibilidade**: Suporte a diferentes modelos de negócio
5. **Escalabilidade**: Preparado para crescimento

📁 Estrutura de Arquivos
- `Criando_DB_Tabelas_Ecommerce.sql`: Schema completo do banco
- `Populando_Tabela_Ecommerce.sql`: Dados de exemplo para testes
- `Consultas_Ecommerce.sql`: Consultas de análise e business intelligence

---

Desenvolvido como parte da Formação Suzano - Análise de Dados com Power BI - Digital Innovation One
