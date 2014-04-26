module HelpMeOut
  class WebsiteController < HelpMeOutBase
    get '/' do
      @items = Field.all
      redirect '/user/login' if not user_logged?
      redirect '/question/allquestions'
    end
    get '/ranking' do
      @items = Field.all
      haml :rank
    end
    helpers AuthenticationHelpers
  end
end
