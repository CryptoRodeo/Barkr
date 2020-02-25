Hanami::Model.migration do
  change do
    create_table :tweets do
      primary_key :id

      column :username, String, null: false
      column :content, String, null:false , size: 240

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
