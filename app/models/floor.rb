class Floor < ActiveRecord::Base
    has_many :mopfloors
    has_many :mops, through: :mopfloors

    def self.shiniest_rating
      self.maximum(:shininess)
    end
    
    def self.shiniest_floor
      self.where(:shininess => Floor.shiniest_rating)
      #Floor.all.find do |t| t.flr if t.shininess == maximum end
    end

    def self.dullest_rating
      self.minimum(:shininess)
    end

    def self.dullest_floor
      self.where(:shininess => Floor.dullest_rating)
    end
end