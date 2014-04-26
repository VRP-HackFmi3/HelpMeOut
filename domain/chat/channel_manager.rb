require_relative 'channel.rb'

module HelpMeOut
end

module HelpMeOut::Domain
end

module HelpMeOut::Domain::Chat
	class ChannelManager
		@@channels = []

		def ChannelManager.add_to_channel(user,socket,questionId)
			channel = @@channels.first do |channel|
				channel.channel_question_id == questionId
			end

			member = Member.new
			member.username = user
			member.socket = socket

			if !channel then
				channel = Channel.new self,member,questionId
				@@channels = @@channels << channel
			end

			channel.add_member member;
		end

		def ChannelManager.remove(channel)
			@@channels.delete channel
		end

		def ChannelManager.channel_of_user(username)
			@@channels.first do |channel|
				channel.any? do |user|
					username == user.username
				end
			end
		end

		def ChannelManager.remove_user(user)
			ChannelManager.channel_of_user(user).remove_member(user)
		end
	end
end