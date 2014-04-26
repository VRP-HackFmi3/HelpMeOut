module HelpMeOut
  class ChatController < HelpMeOutBase
    before '/*' do
      protected!
    end

  	get '/chat' do
  		session["username"] = "Penko"
  		session["questionId"] = 1122
  		haml :chat
  	end

    helpers AuthenticationHelpers
  end
end
