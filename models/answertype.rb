class AnswerType < Sequel::Model
  one_to_many :answers
  one_to_many :questions
end