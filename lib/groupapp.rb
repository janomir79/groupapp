# By Oto Brglez - <oto.brglez@opalab.com> 

require 'bundler'
Bundler.require

class Groupapp < Sinatra::Base

	set :public, 'public'
	set :views, 'views'

	get '/main.css' do scss :main; end

	get '/' do
		haml :landing_page
	end

end