class Floor < ActiveRecord::Base
    has_many :mopfloors
    has_many :mops, through: :mopfloors

    def self.shiniest_rating
      self.maximum(:shininess)
    end
    
    def self.shiniest_floor
      self.where("shininess = ?", self.shiniest_rating)
      #Floor.all.find do |t| t.flr if t.shininess == maximum end
    end
end