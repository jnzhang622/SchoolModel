class Mop < ActiveRecord::Base
    has_many :janitormops
    has_many :mopfloors
    has_many :janitors, through: :janitormops
    has_many :floors, through: :mopfloors

    
end
