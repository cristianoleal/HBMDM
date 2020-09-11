Quando('realizo os filtros especificos do relatorio Eficiência Equipe de Entrega') do
  #Verificar filtros
  @tela_relatorio_page.selecionarTodosCampos
  @tela_relatorio_page.rangeData
  @tela_relatorio_page.campoVazio
  @tela_relatorio_page.checkCampo
  @tela_relatorio_page.downloadRelatorio
end

Então('devo exibir o relatorio na tela do MDM') do
  @tela_relatorio_page.telaLoading

  #Quantidades de linhas na tabela maior que 0?
  qtdLinhas = @tela_relatorio_page.qtdLinhasTabela

  if(qtdLinhas > 1)
    expect(qtdLinhas > 1).to be true
  else
    expect(page).to have_content @tela_relatorio_page.relatorioVazio
    puts(@tela_relatorio_page.relatorioVazio)
  end
end

Quando('eu acesso a tela de relatorios') do
  @tela_relatorio_page.telaRelatorio
  expect(@tela_relatorio_page.campoPesquisa).to be true
end

E('realizo o filtro por {string}') do |filtro|
  @tela_relatorio_page.filtroRelatorio(filtro)
end

Então('devo ver o relatorio {string}') do |relatorio|
  expect(page).to have_content relatorio
end

Quando('acesso o relatorio {string}') do |linkRelatorio|
  @tela_relatorio_page.telaRelatorio
  @tela_relatorio_page.relatorioPadrao(linkRelatorio)
end

E('realizo o filtro desejados') do
  @tela_relatorio_page.selecionarUnidadeNegocio
  @tela_relatorio_page.rangeData
end

Então('devo fazer download e verificar o nome do relatorio {string}') do |nomeRelatorio|
  @tela_relatorio_page.downloadRelatorio
  #page.driver.browser.navigate.to("chrome://downloads/")
  #expect(page).to have_content nomeRelatorio
  expect(page).to have_content nomeRelatorio
end

Quando('acesso o relatorio Eficiência Equipe de Entrega') do
  @tela_relatorio_page.telaRelatorio
  @tela_relatorio_page.relatorioEficienciaEquipeEntrega
end
