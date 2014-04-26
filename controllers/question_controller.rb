module HelpMeOut
  class QuestionController < HelpMeOutBase
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
      puts "NANANNNANNAN"
      # user = find_current_user
      user = User.find(username: session[:username])
      created = Time.now.to_i
      expires = date_string_to_int(params[:time])

      Question.create(title: params[:title],
                      text: params[:text],
                      user_id: user.id.to_i,
                      time_closed: false,
                      status: false,
                      time_created: created,
                      time_expires: expires,
                      )
      redirect '/question/all'
    end

    get '/myquestions' do
      user = User.find(username: session[:username])
      user_questions = user.questions
    end

    helpers UserHelpers, WebsiteHelpers
  end
end
