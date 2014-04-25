class User < Sequel::Model
  one_to_many :questions
  one_to_many :answers
  many_to_one :rank
  many_to_many :fields, :join_table=>:abilitiesusers
  many_to_many :fields, :join_table=>:interestsusers
end