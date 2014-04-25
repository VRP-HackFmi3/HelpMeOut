class User < Sequel::Model
  one_to_many :questions
  many_to_many :fields, :join_table=>:abilitiesusers
  many_to_many :fields, :join_table=>:interestsusers
end