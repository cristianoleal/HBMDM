class TelaLoginView
    include Capybara::DSL

    def botao_sair
        find("#spnTop").visible?
    end
    
end