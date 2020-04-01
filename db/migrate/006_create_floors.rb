class CreateFloors < ActiveRecord::Migration[6.0]
    def change
        create_table :floors do |t|
            t.string :flr
            t.integer :shininess
        end
    end
end