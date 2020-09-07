#language: pt
@login
Funcionalidade: Tela de Relatorio
    Para que eu possa gerenciar os relatorios do MDM
    Sendo um analista de rota
    Posso acessar e fazer donwload dos relatorios desejados

    @equipe_entrega
    Cenario: Acessar relatorio Eficiência Equipe de Entrega
        Quando acesso o relatorio Eficiência Equipe de Entrega
        E realizo os filtros especificos do relatorio Eficiência Equipe de Entrega
        Então devo exibir o relatorio na tela do MDM

    @tela_relatorio
    Esquema do Cenario: Acessar tela relatorios
        Quando eu acesso a tela de relatorios
        E realizo o filtro por <filtro>
        Então devo ver o relatorio <relatorio>

        Exemplos:
            |filtro             |relatorio                |
            |"para"             |"Paradas não Programadas"|   
            |"novo"             |"Detalhes da Rota (novo)"|

    @relatorio_padrao
    Esquema do Cenario: Acessar relatorios
        Quando acesso o relatorio <linkRelatorio>
        E realizo o filtro desejados
        Então devo fazer download e verificar o nome do relatorio <nomeRelatorio>

        Exemplos:
            |linkRelatorio            |nomeRelatorio                                |
            |"AderenciaCustom"        |"Aderência AmBev"                            |
            |"JustificativaPNPNovo"   |"Paradas não Programadas"                    |
            |"DetalhesRotaSintetico"  |"Detalhes da Rota (novo)"                    |
            |"ParceiroAmbev"          |"Parceiro Ambev"                             |
            |"Estadia"                |"Estadia de Veículos"                        |
            |"AderenciaConsolidado"   |"Aderência Consolidado (D-1)"                |
            |"FalhaGPS"               |"Falha de GPS"                               |
            |"NotaDivergente"         |"Notas Divergentes (D-1)"                    |
            |"EscoltaPosicaoHorario"  |"Auditoria de Rota com Posições e Horários"  |
            |"MauUsoFoxtrot"          |"Relatório de mau uso Foxtrot"               |
            |"LogEventosMobile"       |"Logs de Eventos Mobile"                     |
            |"VelocidadeExcedida"     |"Velocidade Excedida"                        |