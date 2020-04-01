class CreateStudentsubjects < ActiveRecord::Migration[6.0]
    create_table :studentsubjects do |t|
        t.integer :student_id
        t.integer :subject_id
    end
end