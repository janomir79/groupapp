# By Oto Brglez - <oto.brglez@opalab.com> 

require 'bundler'
Bundler.require

require 'json'
require 'mongoid'
require './models/user'
require './models/group'

class Groupapp < Sinatra::Base

	configure [:development, :test] do Mongoid.logger = Logger.new($stdout); end
	configure :production do Mongoid.logger=Logger.new('/dev/null'); end	
	configure do Mongoid.load!("config/mongoid.yml"); end

	use Rack::Session::Cookie
	use OmniAuth::Builder do
		provider :facebook,
			ENV['GROUPAPP_FB_KEY'], ENV['GROUPAPP_FB_SECRET'],
			{ scope: 'user_groups'}
	end

	set :public, "public"
	set :views, 'views'

	# The magic ;)

	get '/main.css' do scss :main; end
	get '/' do haml :landing_page; end

	get '/auth/:name/callback' do
		auth = request.env['omniauth.auth']
		JSON.pretty_generate(auth)
	end

	get '/pozdrav/:ime' do
		"Zdravo #{params[:ime]}"
	end
	
end
