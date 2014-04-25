Sequel.migration do
  change do
    create_table(:abilitiesusers) do
      primary_key :id
      foreign_key :user_id, :users
      foreign_key :field_id , :fields
      unique [:user_id, :field_id]
    end
  end
end