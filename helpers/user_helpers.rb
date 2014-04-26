module HelpMeOut
  module DataBaseHelpers
    module UserHelpers
      def create_user(username, password, email, xp = 0)
        user = User.create(
          username: username,
          password: password,
          # first_name: first_name,
          # last_name: last_name,
          email: email,
          xp: xp
        )
        user.insert
        # user = User.new(username: username, password: password)
        # to_sentence(user.errors) if !user.save
      end

      def find_user_by_username_and_password(username, password)
        User.find(username: username, password: password)
      end

      def find_current_user
        User.find(username: session[:username])
      end
    end
  end
end
