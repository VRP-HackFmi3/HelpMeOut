module HelpMeOut
  class WebsiteController < HelpMeOutBase
    get '/' do
      redirect '/user/login' if not user_logged?
      haml :home
    end

    helpers AuthenticationHelpers
  end
end
