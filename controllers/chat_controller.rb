module HelpMeOut
  class ChatController < HelpMeOutBase
    before '/*' do
      protected!
    end

  	get '/chat' do
  		haml :chat
  	end

    helpers UserHelpers, WebsiteHelpers, AuthenticationHelpers, ViewHelpers
  end
end
