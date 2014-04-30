module HelpMeOut
  class AuthenticationController < HelpMeOutBase
   
    get '/register' do
      @items = Field.all
      haml :register
    end

    get '/login' do
      haml :login
    end

    post '/register' do
      @error = passwords_dont_meet_criteria(params[:password], params[:repeated_password])
      unless @error
        salt = generate_salt
        salted_password = hash_password params[:password], salt
        User.create(username: params[:username],salt:salt, password: salted_password, email: params[:email])
        redirect '/user/login'
      end

      haml :register
    end

    post '/login' do

      user = User.find(username: params[:username])

      unless user.nil?
        salted_password = hash_password params[:password], user.salt
        if user.password == salted_password.to_s
          session[:username] = params[:username]
          redirect_home
        else
          set_message("Wrong username or password.", :login)
        end
      end

      set_message("Wrong username or password.", :login)
    end

    get '/logout' do
      session.clear
      redirect_home
    end

    helpers AuthenticationHelpers, WebsiteHelpers
    helpers ViewHelpers
  end
end
