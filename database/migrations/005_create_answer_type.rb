Sequel.migration do
  change do
    create_table(:answertypes) do
      primary_key :id, index: true
      String :name, unique: true, null: false
      Integer :score, default: 0
    end
  end
end