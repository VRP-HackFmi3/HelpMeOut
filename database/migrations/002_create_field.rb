Sequel.migration do
  change do
    create_table(:fields) do
      primary_key :id, index: true
      String :name, unique: true, null: false
    end
  end
end