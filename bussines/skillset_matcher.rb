require 'sinatra'

module HelpMeOut
end

module HelpMeOut::Business
end

class SkillsetMatcher
  def SkillsetMatcher.match_question(user)
    puts user
  	db_user = User.find(username:user)
  	if db_user then
  		abilities = db_user.abilities
  		question = db_user.abilities do |ability|
  			question = Question.find(field:ability)
        return question
  		end
  	end
    nil
  end


end