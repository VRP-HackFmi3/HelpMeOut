class Answer < Sequel::Model
  many_to_one :question
  many_to_one :answer_type
  many_to_one :user
end