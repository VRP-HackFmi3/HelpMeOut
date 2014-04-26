Sequel.migration do
  change do
    create_table(:answer_types) do
      primary_key :id, index: true
      String :name, unique: true, null: false
      Integer :score, default: 0
    end
  end
end