module HelpMeOut
  class AuthenticationController < HelpMeOutBase
    get '/register' do
      DB = Sequel.connect('sqlite://development.db')
      @items = DB[:fields]
      haml :register
    end
    
    get '/allSkills' do
      DB = Sequel.connect('sqlite://development.db')
      @items = DB[:fields]
      @items.to_json
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
      if user.password == params[:password]
        session[:username] = params[:username]
        redirect_home
      else
        set_message("Wrong username or password.", :login)
      end
    end

    get '/logout' do
      session.clear
      redirect_home
    end

    helpers AuthenticationHelpers, WebsiteHelpers
    helpers ViewHelpers
  end
end
