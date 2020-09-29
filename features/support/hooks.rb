require "report_builder"
require "date"

Before do
    @login_page = LoginPage.new
    @tela_login = TelaLoginView.new
    @tela_relatorio_page = TelaRelatorioPage.new
end

Before("@login") do
    user = CONFIG["users"]["user_admin"]
    @login_page.visitLogin
    @login_page.with(user["usuario"], user["senha"])
    @tela_login.botao_bemvindo
end

After do |scenario|
    #if sceario.failed?
    temp_shot = page.save_screenshot("log/temp_shot.png")
    screenshot = Base64.encode64(File.open(temp_shot, "rb").read)
    embed(screenshot, "image/png", "Screenshot")
    #end
end

d = DateTime.now
@current_date = d.to_s.tr(":", "-")

at_exit do
    ReportBuilder.configure do |config|
        config.input_path = "log/report.json"
        config.report_path = "log/" + @current_date
        config.report_types = [:html]
        config.report_title = "Relatorio de testes do MDM - HBSIS"
        config.compress_image = true
        config.additional_info = { "App" => "Web", "Data de execução"=> @current_date }
        config.color = "indigo"
    end
    ReportBuilder.build_report
end



