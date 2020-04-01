class CreateJanitormops < ActiveRecord::Migration[6.0]
    create_table :janitormops do |t|
        t.integer :janitor_id
        t.integer :mop_id
    end
end