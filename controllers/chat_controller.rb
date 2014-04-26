module HelpMeOut
  class ChatController < HelpMeOutBase
    before '/*' do
      protected!
    end

  	get '/chat' do
  		haml :chat
  	end

    helpers AuthenticationHelpers
  end
end
