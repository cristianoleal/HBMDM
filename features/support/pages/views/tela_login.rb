class TelaLoginView
    include Capybara::DSL

    def botao_bemvindo
        find("#spnTop").visible?
    end
    
end