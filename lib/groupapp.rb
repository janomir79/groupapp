# By Oto Brglez - <oto.brglez@opalab.com> 

require 'bundler'
Bundler.require

class Groupapp < Sinatra::Base

	set :public, 'public'

	get '/' do
		"This is groupapp.opalab.com"
	end

end