class Janitormop < ActiveRecord::Base
    belongs_to :janitor
    belongs_to :mop
end