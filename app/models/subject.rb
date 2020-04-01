class Subject < ActiveRecord::Base
    has_many :studentsubjects
    has_many :students, through: :studentsubjects

    def all_student_names
        self.students.map(&:name).uniq
    end
end