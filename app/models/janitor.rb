class Janitor < ActiveRecord::Base
    belongs_to :school
    has_many :janitormops
    has_many :mops, through: :janitormops

end