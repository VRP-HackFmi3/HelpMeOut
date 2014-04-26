module HelpMeOut
  class QuestionController < HelpMeOutBase
    get '/' do
      #take from query string
      #try to find question
      #see if current user is user is master of question
      #if ChannelManager contains current questionId initialize session["questionId"]
    end

    get '/add' do
      haml :create_question
    end

    post '/add' do
      user = User.find(username: session[:username])
      created = DateTime.now
      expires = DateTime.parse(params[:time])
      p created
      p expires
      Question.create(title: params[:title],
                      text: params[:text],
                      user: user,
                      time_closed: false,
                      status: false,
                      time_created: created,
                      time_expires: expires,
                      )
    end

    get '/myquestions' do
      user = User.find(username: session[:username])
      user_questions = user.questions
    end
  end
end