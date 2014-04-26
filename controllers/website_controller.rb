module HelpMeOut
  class WebsiteController < HelpMeOutBase


    get '/' do
      if not user_logged?
        haml :index
      else
        @items = Field.all
        redirect '/question/allquestions'
      end
    end    

    get '/ranking' do
      @items = Field.all
      haml :rank
    end

    helpers AuthenticationHelpers
  end
end
