#require '../domain/chat/channel_manager.rb'
require_relative '../domain/chat/channel_manager.rb'

module HelpMeOut
  class ChannelController < HelpMeOutBase
    before '/*' do
      protected!
    end

    set :server, 'thin'
    set :sockets, []

    get '/channel' do
      if !request.websocket?
        puts "failed request to get channel as http"
      else
        request.websocket do |ws|
          ws.onopen do
            puts session["username"]
            puts session["questionId"]
            HelpMeOut::Domain::Chat::ChannelManager.add_to_channel(session["username"],ws,session["questionId"])
            ws.send "Hello #{session['username']}"
          end
          ws.onmessage do |msg|
            EM.next_tick do
              channel = HelpMeOut::Domain::Chat::ChannelManager.channel_of_user(session["username"])
              channel.broadcast(session["username"] + ":" + msg)
            end
          end
          ws.onclose do
            channel = HelpMeOut::Domain::Chat::ChannelManager.channel_of_user(session["username"])
            leftUser = session["username"]
            EM.next_tick do
              if channel then
                channel.broadcast(leftUser + " has left.")
              end
            end
            HelpMeOut::Domain::Chat::ChannelManager.remove_user(session["username"]);
          end
        end
      end
    end

    helpers AuthenticationHelpers
  end
end
