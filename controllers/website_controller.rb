module HelpMeOut
  class WebsiteController < HelpMeOutBase
    before '/*' do
      protected!
    end

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
      user_wanted_fields = find_current_user.interests

      questions = Question.all.select { |question| user_wanted_fields.include? question.field }
      questions = questions.sort_by { |question| question.time_expires.to_time.to_i }
      @time_out = questions.take 10

      next_day = DateTime.now.to_date + 1
      @tomorrow = questions.select { |question| question.time_expires.to_date == next_day }

      @yes_no = questions.select { |question| question.type == 1 }

      @my_questions = questions.sort_by { |q| q.time_created.to_time.to_i }.select { |q| q.user == find_current_user }

      haml :home
    end

    helpers UserHelpers, WebsiteHelpers, AuthenticationHelpers, ViewHelpers
  end
end
