require_relative "../bussines/skillset_matcher.rb"

module HelpMeOut
  class AnswerApiController < HelpMeOutBase
  	helpers Sinatra::JSON

    post '/' do
        result = json :code => -1
    	if !session["username"] then
    		result = json :code => 5
    	elsif !params["ynQuestion"] then
    		result = json :code => 1
    	else
    		if params["answer"] then
    			user = User.find(username:session["username"])
    			question = Question.find(id:params["ynQuestion"])
    			if question then
    				type = AnswerType.find(name:"YesNo")

    				answer = Answer.create(answer_type:type,question:question,user:user,text:params["answer"],time_answered:DateTime.now)
                    question.add_answer(answer)
    				result = json :code => 0
    			else
    				result = json :code => 3
    			end
    		else
    			result = json :code => 2
    		end
    	end
        result
    end

    get '/' do
    	question = SkillsetMatcher.match_question session["username"]
        result = 0
    	if question then
    		result = json :question => {:id => question.id ,:time => question.time_expires, :title => question.title, :text=> question.text}
    	end
        puts result
        result
    end
  end
end