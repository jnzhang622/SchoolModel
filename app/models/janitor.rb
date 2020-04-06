class Janitor < ActiveRecord::Base
    belongs_to :school
    has_many :janitormops
    has_many :mops, through: :janitormops

    def my_floors
        self.mops.map {|t| t.floors}.flatten
    end

    def my_floors_count
        self.mops.map {|t| t.floors}.flatten.count
    end

    def self.all_janitor_floors
        self.all.map {|t| t.my_floors_count}
    end

    def shiniest_floor
        self.mops.map {|t| t.floors}.flatten.map {|t| t.shininess}.max
    end

    # def self.most_floors
    #     janitor_floors = Janitor.all_janitor_floors
    #     Janitor.all.select {|j| j.name 
    #     j.my_floors_count == janitor_floors.maximum}
    # end
    # def cleanfloors(floor)
    #     if floor.shininess >= 7
    #         puts "yes"
    #     else puts "no"
    #     end
    #     #Janitor.cleanfloors
    # end



end