require 'digest/sha2'

module HelpMeOut
  module AuthenticationHelpers
    def user_logged?
      session[:username]
    end

    def generate_salt()
      alphabet = [('0'..'9'), ('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...16).map { alphabet[rand(alphabet.length)] }.join
    end

    def short_password(password)
      "The password is too short." if password.size < 6
    end

    def passwords_dont_match(password, repeated_password)
      "The passwords don't match." if password != repeated_password
    end

    def hash_password(password,salt)
      salted_password = password + salt
      Digest::SHA2.new << salted_password
    end

    def passwords_dont_meet_criteria(password, repeated_password)
      short_password(password) or passwords_dont_match(password, repeated_password)
    end

    def protected!
      halt 401, (haml :index) unless user_logged?
    end

  end
end
