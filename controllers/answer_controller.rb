module HelpMeOut
  class AnswerController < HelpMeOutBase
    before '/*' do
      protected!
    end

    get '/add/:question_id' do
      session["questionId"] = params[:question_id]
      @question = Question.find(id: params[:question_id])
      haml :add_answer
    end

    post '/add/:question_id' do
      question = Question.find(id: params[:question_id])
      p question.title
      user = find_current_user
      p user.username
      answer_type = AnswerType.find(name: 'YesNo')
      p answer_type.name
      a = Answer.create(answer_type: answer_type, question: question, user: user, text: params[:text], time_answered: DateTime.now)

      p a.text
      redirect '/question/show/' + question.id.to_s
    end

    helpers UserHelpers, AuthenticationHelpers
  end
end
