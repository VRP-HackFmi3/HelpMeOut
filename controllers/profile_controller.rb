module HelpMeOut
	class ProfileController < HelpMeOutBase
		
		get "/:id" do
		  current_member = find_current_user
		  @profile_user = User.find(id: params[:id])
		  
		  unless @profile_user.first_name.nil? and @profile_user.last_name.nil? 
		    @fullname = @profile_user.first_name + " " + @profile_user.last_name 
		  end

		  @myprofile = current_member.id == @profile_user.id
		  @ranks = Rank.find(id: @profile_user[:rank_id])
	  	haml :profile
		end

		get "/:id/edit" do
		  @member = User.find(id: params[:id])
		  
		  haml :profile
		end

		get "/:id/achievements" do
		  @member = User.find(id: params[:id])
		  
		  haml :achievements
		end
	
		post '/:id/edit' do
		  p params
		  redirect '/user'
		end

		helpers UserHelpers, WebsiteHelpers, AuthenticationHelpers, ViewHelpers
	end
end