module HelpMeOut
  class ChatController < HelpMeOutBase
  	get '/chat' do 
  		session["username"] = "Penko"
  		session["questionId"] = 1122
  		haml :chat
  	end
  end
end