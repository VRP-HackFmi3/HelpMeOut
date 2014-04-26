Sequel.migration do
  change do
    create_table(:questions) do
      primary_key :id, index: true
      foreign_key :user_id, :users, index: true
      foreign_key :field_id, :fields, index: true
      foreign_key :answer_type_id, :answer_types, index: true
      String :title, unique: true, null: false
      String :text, null: false
      DateTime :time_created
      DateTime :time_expires
      DateTime :time_closed
      Integer :status
      Integer :type
    end
  end
end
