# By Oto Brglez - <oto.brglez@opalab.com> 

require 'sinatra'
require 'rack/test'
require 'haml'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

require File.join(File.dirname(__FILE__), '..', 'lib/groupapp.rb')
