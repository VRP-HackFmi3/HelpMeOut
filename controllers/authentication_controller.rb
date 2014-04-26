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
        User.create(username: params[:username], password: params[:password], email: params[:email])
        redirect '/user/login'
      end

      haml :register
    end

    post '/login' do

      user = User.find(username: params[:username])

      unless user.nil?
        if user.password == params[:password]
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
