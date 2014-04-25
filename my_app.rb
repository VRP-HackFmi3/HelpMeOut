require 'rubygems'
require 'bundler'

module HepMeOut
  Bundler.require

  class HelpMeOutBase < Sinatra::Base
    enable :sessions

    set :views, File.expand_path('../views', __FILE__)
    set :public_folder, File.expand_path(settings.public_path)

    not_found do
      haml :not_found
    end
  end
end

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

DataMapper.auto_upgrade!
DataMapper.finalize

PATHS = {
  '/'           => HelpMeOut::WebsiteController,
  # '/user'       => HelpMeOut::AuthenticationController,
  # '/categories' => HelpMeOut::CategoryController,
  # '/expenses'   => HelpMeOut::ExpenseController,
  # '/report'     => HelpMeOut::ReportController
}

