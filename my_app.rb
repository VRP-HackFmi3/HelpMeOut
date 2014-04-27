require 'rubygems'
require 'bundler'

Bundler.require
require 'sinatra/json'

module HelpMeOut
  class HelpMeOutBase < Sinatra::Base
    enable :sessions

    set :views, File.expand_path('../views', __FILE__)
    set :public_folder, File.expand_path('../public', __FILE__)

    not_found do
      haml :not_found
    end

    DB = Sequel.sqlite('database/development.db')

  end
end

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

PATHS = {
  '/'           => HelpMeOut::WebsiteController,
  '/user'       => HelpMeOut::AuthenticationController,
  '/answer'     => HelpMeOut::AnswerController,
  '/question'  => HelpMeOut::QuestionController,
  '/channel'    => HelpMeOut::ChannelController,
  '/chat'       => HelpMeOut::ChatController,
  '/profile'    => HelpMeOut::ProfileController,
  '/qaapi'      => HelpMeOut::AnswerApiController
}
