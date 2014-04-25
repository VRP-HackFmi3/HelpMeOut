Sequel.migration do
    change do
    create_table(:ranks) do
      primary_key :id, index: true
      Integer :score_min, null: false
      String :name, null: false
    end
  end
end
