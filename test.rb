require 'sequel'
DB = Sequel.sqlite('./database/development.db')

Dir['./{models}/*.rb'].each { |file| require file }

DB.run("DELETE FROM interests_users")
DB.run("DELETE FROM abilities_users")
User.where("1").delete
Field.where("1").delete

u = User.new(:username => "asd", :password => 123456, :email => "asdf@aas.bg")
u.save

u2 = User.new(:username => "asdg", :password => 123456, :email => "asdg@aas.bg")
u2.save

f = Field.new(name: "asdsd")
f.save

fu = Field.new(name: "asdf")
fu.save

u.add_interest(f)
u.add_ability(f)

fu.add_userability(u2)
fu.add_userinterest(u2)