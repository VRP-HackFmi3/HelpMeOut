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

      Question.create(title: params[:title],
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
      @questions = Question.all#.order(:time_expires)
      haml :home
    end

    get '/myquestions' do
      user = User.find(username: session[:username])
      user_questions = user.questions
    end


    get '/tryquestion' do
      def find_field(id)
        return Field.find(id:id)
      end
      @questions = Question.all
      haml :tryquestion
    end

    helpers UserHelpers, WebsiteHelpers, AuthenticationHelpers
    

    helpers UserHelpers, WebsiteHelpers, AuthenticationHelpers, ViewHelpers

  end
end
