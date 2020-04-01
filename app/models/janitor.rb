class Janitor < ActiveRecord::Base
    has_many :janitormops
    belongs_to :school
end