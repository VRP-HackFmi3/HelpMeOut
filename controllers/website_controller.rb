module HelpMeOut
  class WebsiteController < HelpMeOutBase
    get '/' do
      @items = Field.all
      redirect '/user/login' if not user_logged?
      redirect '/question/allquestions'
    end

    helpers AuthenticationHelpers
  end
end
