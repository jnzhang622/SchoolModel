class Mop < ActiveRecord::Base
    has_many :janitormops
    has_many :mopfloors
end