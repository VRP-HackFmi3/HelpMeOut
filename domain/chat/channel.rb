require_relative "channel_member.rb"

module HelpMeOut
end

module HelpMeOut::Domain
end

module HelpMeOut::Domain::Chat
	class Channel
		attr_accessor :channel_id, :channel_question_id, :channel_members, :manager

		def initialize(manager,owner,question_id)
			@channel_question_id = question_id
			@manager = manager
			@channel_members = [];
		end

		def add_member member
			if member then
				if !@channel_members.include?(member)
					@channel_members = @channel_members << member
				end
			end
		end

		def remove_member(member)
			usr = @channel_members.first do |member|
				member.username == member
			end

			if usr then
				@channel_members.delete usr
			end

			if @channel_members.length == 0 then
				@manager.remove self
			end
		end

		def broadcast(message)
			@channel_members.each do |member|
				member.message message
			end
		end
	end
end