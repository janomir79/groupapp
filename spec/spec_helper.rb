# By Oto Brglez - <oto.brglez@opalab.com> 

require File.join(File.dirname(__FILE__), '..', 'lib/groupapp.rb')


#require 'sinatra'
require 'rspec'
require 'rack/test'
#require 'haml'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false


RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  Sinatra::Application
end