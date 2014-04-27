module HelpMeOut
  module UserHelpers

    def find_user_by_username_and_password(username, password)
      User.find(username: username, password: password)
    end

    def find_current_user
      User.find(username: session[:username])
    end
  end
end
