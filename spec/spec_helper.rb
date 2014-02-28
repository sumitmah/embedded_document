$LOAD_PATH.unshift 'lib'

require 'embedded_document'
require 'pry'
#
#`script/ci_fetch_error_definitions`
#
#Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}
#
#Pools::Errors.initialize do |config|
#  config.location = 'tmp/pools_error_definitions/error_definitions.yml'
#  config.trap_errors = false
#end
#
#VCR.configure do |config|
#  config.cassette_library_dir = 'spec/cassettes'
#  config.hook_into :webmock
#  config.configure_rspec_metadata!
#  config.allow_http_connections_when_no_cassette = true
#end
#
#RSpec.configure do |c|
#  c.treat_symbols_as_metadata_keys_with_true_values = true
#end