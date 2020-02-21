require "report_builder"
require "date"

Before do
  @service = ->(klass) { klass.new }
end

at_exit do
  date = Time.now.strftime("%d/%B/%Y")
  time = Time.now.strftime("%HH%MM%SS")
  @infos = {
    "Data do Teste" => date,
    "Hora do Teste" => time,
  }

  ReportBuilder.configure do |config|
    config.input_path = "log/report.json"
    config.report_path = "log/report"
    config.report_types = [:html, :json]
    config.report_title = "HTTParty"
    config.additional_info = @infos
    config.color = "indigo"
  end
  ReportBuilder.build_report
end
