class CreateFloors < ActiveRecord::Migration[6.0]
    def change
        create_table :floors do |t|
            t.integer :shininess
        end
    end
end