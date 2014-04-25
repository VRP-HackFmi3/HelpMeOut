class Answer < Sequel::Model
  many_to_one :question
  many_to_one :answertype
  many_to_one :user
end