class Subject < ActiveRecord::Base
    has_many :studentsubjects
    has_many :students, through: :studentsubjects

end