class CreateStudents < ActiveRecord::Migration[6.0]
    def change
        create_table :students do |t|
            t.string :name
            t.integer :school_id
        end
    end
end