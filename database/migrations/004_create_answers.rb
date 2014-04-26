Sequel.migration do
  change do
    create_table(:answers) do
      primary_key :id, index: true
      foreign_key :answertype_id, :answertypes, index: true
      foreign_key :question_id, :questions, index: true
      foreign_key :user_id, :users, index: true
      String :text, null: false
      DateTime :time_answered
    end
  end
end