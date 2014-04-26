module HelpMeOut
  class WebsiteController < HelpMeOutBase
    get '/' do
      @items = Field.all
      redirect '/user/login' if not user_logged?
      haml :home
    end

    helpers AuthenticationHelpers
  end
end
