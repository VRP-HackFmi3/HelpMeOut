module HelpMeOut
  class QuestionController < HelpMeOutBase
    before '/*' do
      protected!
    end

    get '/' do
      questions = Question.all
      questions = questions.sort_by { |q| q.time_expires.to_time.to_i }
        .select { |q| q.time_expires.to_time.to_i - Time.now.to_i > 0 }

      @time_out = questions.take 10

      next_day = DateTime.now.to_date + 1
      @tomorrow = questions.select { |question| question.time_expires.to_date == next_day }

      @yes_no = questions.select { |question| question.type == 1 }

      @my_questions = Question.where(user: find_current_user).sort_by { |q| q.time_created.to_time.to_i }

      haml :home
      #take from query string
      #try to find question
      #see if current user is user is master of question
      #if ChannelManager contains current questionId initialize session["questionId"]
    end

    get '/add' do
      @items = Field.all
      haml :create_question
    end

    post '/add' do
      user_id = find_current_user.id.to_i
      created = Time.now.to_i
      expires = date_string_to_int(params[:time])
      field_id = Field.find(name: params[:skills]).id.to_i
      yes_no = params[:check] == "on" ? 1 : 0

      Question.create(
        title: params[:title],
        text: params[:text],
        user_id: user_id,
        time_closed: false,
        status: false,
        time_created: created,
        time_expires: expires,
        field_id: field_id,
        type: yes_no,
      )

      redirect '/helpcenter'
    end

    get '/allquestions' do
      questions = Question.all
      questions = questions.sort_by { |question| question.time_expires.to_time.to_i }
      @questions = questions.select { |question| question.time_expires.to_time.to_i - Time.now.to_i > 0 }
      haml :home
    end

    get '/myquestions' do
      user = find_current_user

      @questions = Question.where(user: user).all.sort_by { |question| question.time_created.to_time.to_i }
      haml :home
    end

    get '/tryquestion' do
      # def find_field(id)
      #   return Field.find(id:paid)
      # end

      @question = Questions.first(id:params[:id]);
      haml :tryquestion
    end

    get '/show/:question_id' do
      @question = Question.find(id: params[:question_id])
      @answers = Answer.where(question: @question).all
      haml :show_question
    end

    get '/nextday' do
      next_day = DateTime.now.to_date + 1
      questions = Question.all
      questions = questions.sort_by { |question| question.time_expires.to_date }
      @questions = questions.select { |question| question.time_expires.to_date == next_day }
      haml :home
    end

    helpers UserHelpers, WebsiteHelpers, AuthenticationHelpers, ViewHelpers
  end
end
