module HelpMeOut
  class WebsiteController < HelpMeOutBase


    get '/' do
      if not user_logged?
        haml :index
      else
        @items = Field.all
        redirect '/helpcenter'
      end
    end    

    get '/ranking' do
      @items = Field.all
      haml :rank
    end
 
    get '/achievements' do
      haml :achievements
    end

    get '/helpcenter' do
      questions = Question.all
      @questions = questions.sort_by { |question| question.time_expires.to_time.to_i }
      haml :home
    end

    helpers UserHelpers, WebsiteHelpers, AuthenticationHelpers, ViewHelpers
  end
end
