class Question < Sequel::Model
  many_to_one :field
	one_to_many :answers
end
