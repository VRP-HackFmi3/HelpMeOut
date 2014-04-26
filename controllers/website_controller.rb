module HelpMeOut
  class WebsiteController < HelpMeOutBase
  	get '/register' do 
  		haml :register
  	end
  end
end
