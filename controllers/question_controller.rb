module HelpMeOut
  class QuestionController < HelpMeOutBase
    before '/*' do
      protected!
    end

    get '/' do
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

      Question.create(
        title: params[:title],
        text: params[:text],
        user_id: user_id,
        time_closed: false,
        status: false,
        time_created: created,
        time_expires: expires,
        field_id: field_id
      )

      redirect '/question/allquestions'
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
      def find_field(id)
        return Field.find(id:id)
      end
      @questions = Question.order(:time_expires).limit(1)
      haml :tryquestion
    end

    helpers UserHelpers, WebsiteHelpers, AuthenticationHelpers, ViewHelpers
  end
end
