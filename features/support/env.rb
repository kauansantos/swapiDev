require 'httparty'
require 'rspec'
require "json_matchers"
require "json-schema"
require "json_matchers/rspec"
require "json"
require 'allure-cucumber'

# Processo que permite o matcher dos dados (expect) e do schema
include RSpec::Matchers

JSON_VALIDATE = JsonMatchers.schema_root = "./features/schemas"

# Processo que gera o report via Allure
Dir.mkdir 'reports/allure-results/allure-reports-s3' if Dir.exist?('reports/allure-results/allure-reports-s3') == false
Dir.mkdir 'reports/allure-results' if Dir.exist?('reports/allure-results') == false
Dir.mkdir 'reports/html' if Dir.exist?('reports/html') == false
Dir.mkdir 'reports/target' if Dir.exist?('reports/target') == false

Allure.configure do |c|
  c.results_directory = "reports/allure-results"
  c.clean_results_directory = true
end