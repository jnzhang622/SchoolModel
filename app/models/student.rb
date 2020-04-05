class Student < ActiveRecord::Base
    belongs_to :school
    has_many :studentsubjects
    has_many :subjects, through: :studentsubjects

end