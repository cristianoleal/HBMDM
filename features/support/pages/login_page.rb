class LoginPage
    include Capybara::DSL
    
    def visitLogin
        visit '/'
    end

    def with(usuario, senha)
        find("input[name=Usuario]").set usuario
        find("input[name=Senha]").set senha
        find("input[class=button]").click
    end

    def alert
        find("#painelErro").text
    end
end