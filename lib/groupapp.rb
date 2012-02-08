# By Oto Brglez - <oto.brglez@opalab.com> 

require 'bundler'
require 'json'
Bundler.require

# OmniAuth.config.full_host = "http://groupapp.opalab.com"

class Groupapp < Sinatra::Base

	use Rack::Session::Cookie
	use OmniAuth::Builder do
		provider :facebook,
			ENV['GROUPAPP_FB_KEY'],
			ENV['GROUPAPP_FB_SECRET'],
			{scope: 'user_groups'}
	end

	set :views, 'views'

	get '/main.css' do scss :main; end

	get '/' do
		haml :landing_page
	end

	get '/auth/:name/callback' do
		auth = request.env['omniauth.auth']

		# auth.to_json

		JSON.pretty_generate(auth)
	end

	get '/testout' do
		me = {name: "Oto", priimek: "Brglez"}
		me.to_json
	end

end