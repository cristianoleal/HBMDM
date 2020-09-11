Quando('eu faço login com {string} e {string}') do |usuario, senha|
  @login_page.visitLogin
  @login_page.with(usuario, senha)
  end
  
  Então('devo ser autenticado') do
    expect(@tela_login.botao_bemvindo).to be true
  end

  Então('devo ver a mensagem {string}') do |texto|
    expect(@login_page.alert).to have_content texto
  end
