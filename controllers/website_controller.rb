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
    
    helpers AuthenticationHelpers
  end
end
