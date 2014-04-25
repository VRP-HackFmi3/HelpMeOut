class User < Sequel::Model
  one_to_many :questions
  one_to_many :answers
  many_to_many :skills
  many_to_one :rank
end