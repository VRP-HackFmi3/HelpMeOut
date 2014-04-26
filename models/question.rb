class Question < Sequel::Model
  	many_to_one :field
  	many_to_one :answer_type
	one_to_many :answers
	many_to_one :user
end
