Hanami::Model.migration do
  change do
    alter_table :tweets do
      add_foreign_key :user_id, :users, key: :id, type: 'uuid', on_delete: :cascade,  null: false
    end
  end
end