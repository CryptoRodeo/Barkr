Hanami::Model.migration do
  up do
    execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'


    create_table :tweets do
      primary_key :id, 'uuid', null:false, default: Hanami::Model::Sql.function(:uuid_generate_v4)

      column :username, String, null: false
      column :content, String, null:false , size: 240

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end

    down do
      drop_table :tweets
      execute 'DROP EXTENSION IF EXISTS "uuid-ossp"'
  end
end
