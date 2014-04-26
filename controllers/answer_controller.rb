module HelpMeOut
  class AnswerController < HelpMeOutBase
    before '/*' do
      protected!
    end

    get '/add/:question_id' do
      session["questionId"] = params[:question_id]
      haml :add_answer
    end

    post '/add/:question_id' do
      question = Question.find(id: params[:question_id])
      user = find_current_user
      answer_type = AnswerType.find(id: params[:answer_type_id])
      Answer.create(type: answer_type,question: question, user: user, text: params[:text], time_answered: DateTime.now)
    end

    helpers UserHelpers, AuthenticationHelpers
  end
end
