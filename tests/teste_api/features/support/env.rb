require 'cucumber'
require 'httparty'
require 'pry-nav'
require 'rspec'
require 'nokogiri'
require 'base64'

# Definicao do ambiente de execucao Default:uat
$environment = ENV['ENVIRONMENT'] ||= "sandbox"


CONFIG_API = YAML.load_file("features/support/config/environment.yml")
HTTP_LOG = ENV['HTTP_LOG']
PAYLOAD_PATH = YAML.load_file("features/support/config/payload_path.yml")

OpenSSL::SSL.send(:remove_const, :VERIFY_PEER)
OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
HTTParty::Basement.default_options.update(verify: false)