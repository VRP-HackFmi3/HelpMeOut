module HelpMeOut
  class WebsiteController < HelpMeOutBase
    get '/' do
      redirect '/user/login' if not user_logged?
      haml :home
    end
    helpers AuthenticationHelpers

  	get '/create_event' do
  	  haml :create_event
  	end
  end
end
