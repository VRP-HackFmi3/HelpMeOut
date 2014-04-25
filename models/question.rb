class Question < Sequel::Model
  many_to_one :skill
	one_to_many :answers
end
