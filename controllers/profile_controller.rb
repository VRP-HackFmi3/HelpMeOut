module HelpMeOut
	class ProfileController < HelpMeOutBase
		get "/" do
		  @member = find_current_user
		  @items = Field.all
	  	  haml :profile
		end
		post '/' do
		  p params
		  redirect '/user'
		end
		helpers UserHelpers, WebsiteHelpers, AuthenticationHelpers, ViewHelpers
	end
end