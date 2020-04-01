class CreateMopfloors < ActiveRecord::Migration[6.0]
    create_table :mopfloors do |t|
        t.integer :mop_id
        t.integer :floor_id
    end
end