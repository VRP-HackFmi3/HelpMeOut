module HelpMeOut
end

module HelpMeOut::Domain
end

module HelpMeOut::Domain::Chat
	class Member
		attr_accessor :username,:socket

		def ==(member)
			@username == member.username
		end

		def message(msg)
			@socket.send msg
		end
	end
end