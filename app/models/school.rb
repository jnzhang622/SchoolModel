class School < ActiveRecord::Base
    has_many :janitors
    has_many :teachers
    has_many :students
end