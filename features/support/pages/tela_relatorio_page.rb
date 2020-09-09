class TelaRelatorioPage
    include Capybara::DSL

    def telaRelatorio
        find("a[id='tab_relatorios']").click
    end

    def campoPesquisa
        find("label[for=texto-pesquisa]").visible?
    end

    def filtroRelatorio(filtro)
        find('input[id=texto-pesquisa]').set filtro
    end

    def relatorioPadrao(linkRelatorio)
        find("a[href='/Relatorios/#{linkRelatorio}']").click
    end

    def relatorioEficienciaEquipeEntrega
        find("a[href='/Relatorios/EficienciaEquipeEntrega']").click
    end

    def selecionarUnidadeNegocio
        select('CDD Blumenau', from: 'CodigoUnidadeNegocio')
    end

    def rangeData
        find("#DataInicial").set '01082020'
        find("#DataFinal").set '08082020'
    end

    def downloadRelatorio
        find("input[type='submit']").click
        sleep 3
    end

    def selecionarTodosCampos
        select('Todas', from: 'CodigoGrupoUnidadeAntiga')
        select('Todas', from: 'CodigoGrupoUnidadeNova')
        select('Todas', from: 'CodigoUnidadeNegocio')
        select('Todos', from: 'TipoSegmentoFilter')
        select('Todas', from: 'CodigoTipoFrota')
        select('Todas', from: 'CodigoTransportadora')
        select('Todos', from: 'SituacaoMapa')
        select('Por Veículo', from: 'AgrupamentoPorMotorista')
        select('Todos', from: 'PosicaoOk')
        select('Todas', from: 'ForaDaSequencia')
        select('Todas', from: 'DistanciaMaior')
        select('Todos', from: 'Almoco')
    end

    def campoVazio
        find('#FiltroMotorista').set ''
        find('#FiltroAjudante').set ''
        find('#FiltroPlacaVeiculo').set ''
        find('#FiltroCliente').set ''
    end

    def checkCampo
        uncheck('NoHorario')
        check('Antecipadas')
        check('Atrasadas')
    end

    def qtdLinhasTabela
        all("div[id='gridSintetico'] table tbody tr").size
    end

    def relatorioVazio
        'Nenhum registro encontrado.'
    end

end