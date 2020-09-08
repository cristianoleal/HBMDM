#language: pt

Funcionalidade: Login
    Para que eu possa gerenciar as rotas do MDM
    Sendo um usúario previamente cadastrado
    Posso acessar o sistema com o meu usuario e senha
    
    @login_feliz
    Cenario: Acesso
        Quando eu faço login com "cristiano" e "123"
        Então devo ser autenticado
    
    @login_infeliz
    Esquema do Cenario: Login sem sucesso
        Quando eu faço login com <usuario> e <senha>
        Então devo ver a mensagem <texto>

        Exemplos:
            |usuario            |senha           | texto                                |
            |"cristiano"        |"senhaTeste"    | "Usuário ou senha inválidos."        |
            |""                 |"senhaTeste"    | "Usuário é um campo obrigatório."    |
            |"cristiano"        |""              | "Senha é um campo obrigatório."      |