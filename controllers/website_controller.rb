module HelpMeOut
  class WebsiteController < HelpMeOutBase
  	# get '/register' do
  	# 	haml :register
  	# end

  	get '/create_event' do
  		haml :create_event
  	end
  end
end
