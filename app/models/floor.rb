class floor < ActiveRecord::Base
    has_many :mopfloors
    has_many :mops, through: :mopfloors
end