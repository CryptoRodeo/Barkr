Hanami::Model.migration do
  change do
    execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"' 
    create_table :users do
      primary_key :id, 'uuid', null:false, default: Hanami::Model::Sql.function(:uuid_generate_v4)
      column :ip, String, unique: true, null:false, size: 48
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end

    down do
      drop_table :users 
      execute 'DROP EXTENSION IF EXISTS "uuid-ossp"'
  end
end