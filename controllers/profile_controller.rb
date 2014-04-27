module HelpMeOut
	class ProfileController < HelpMeOutBase
		get "/" do
			@member = find_current_member
			haml :profile
		end

		helpers UserHelpers
	end
end