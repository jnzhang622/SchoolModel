class School < ActiveRecord::Base
    has_many :janitors
    has_many :janitormops, through: :janitors
    has_many :teachers
    has_many :students
    has_many :studentsubjects, through: :students

    def janitor_count
        self.janitors.count
    end
    def all_janitor_names
        self.janitors.map(&:name)
    end
    def teacher_count
        self.teachers.count
    end
    def all_teacher_names
        self.teachers.map(&:name)
    end
    def student_count
        self.students.count
    end
    def all_student_names
        self.students.map(&:name)
    end
    def all_subject_names
        self.studentsubjects.map do |t| t.subject end
    end
end