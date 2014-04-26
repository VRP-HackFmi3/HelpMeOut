module HelpMeOut
  class WebsiteController < HelpMeOutBase
  	# get '/register' do
  	# 	haml :register
  	# end

    # get '/' do
    #   haml :homepage
    # end
  	get '/create_event' do
  	  haml :create_event
  	end
  	get '/' do
  	  haml :home
  	end
  end
end
