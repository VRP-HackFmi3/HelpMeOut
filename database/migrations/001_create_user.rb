Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id, index: true
      foreign_key :rank_id, :ranks
      String :username, size: 32, unique: true, null: false   
      String :password, null: false
      String :salt, null: false
      String :first_name
      String :last_name
      String :email, null: false
      Integer :xp, default: 0
    end
  end
end