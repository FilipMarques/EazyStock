## Funcionalidades

- **Criação de Conta**: Demonstração de como cadastrar e gerenciar contas de usuário.
- **Adicionar Itens**: Adicione notas detalhadas sobre os itens.
- **Persistência de Dados**: Mostra como os dados são salvos e recuperados.
- **Edição de Itens**: Demonstração de como editar as informações dos itens.

## Como Usar

1. **Criação de Conta**
    - Abra o aplicativo eazyStock.
    - Crie uma conta (só precisa de email e senha)

2. **Adicionando Itens**
    - Após fazer login, clique em "Ver Itens".
    - Insira as informações necessárias sobre o item.
    - Salve para adicionar o item à sua lista.

3. **Editando Itens**
    - Na sua lista de itens, selecione o item que deseja editar.
    - Faça as alterações desejadas.
    - Salve para atualizar as informações do item.

4. **Persistência de Dados**
    - Todos os itens adicionados e editados são salvos na sua conta.
    - Você pode sair da conta e fazer login novamente sem perder suas informações.

## Arquitetura MVVM

eazyStock é construído usando a arquitetura MVVM (Model-View-ViewModel), que separa a lógica de negócios da interface do usuário de maneira clara. Aqui está um breve resumo dos componentes:

- **Model**: Representa os dados e a lógica de negócios. No eazyStock, isso inclui a definição dos itens e a interação com o banco de dados.
- **View**: A interface do usuário. No eazyStock, isso inclui os componentes React que exibem os itens e formulários.
- **ViewModel**: Liga a View e o Model. No eazyStock, o ViewModel gerencia os dados exibidos na View e responde às ações do usuário.
