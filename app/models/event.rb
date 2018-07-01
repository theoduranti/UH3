class Event < ApplicationRecord
    
    belongs_to :creator, class_name: "Ele", optional: true
    has_and_belongs_to_many :eleattendees, class_name: "Ele"

    belongs_to :creator, class_name: "Pro", optional: true
    belongs_to :professor, class_name: "Pro", optional: true
    has_and_belongs_to_many :proinvitatees, class_name: "Pro"


    def self.search(search)
        if search
            where(["lower(name) LIKE ? or lower(description) LIKE ? or lower(discipline) LIKE ?","%#{search.downcase}%","%#{search.downcase}%","%#{search.downcase}%"])
        else
            all
        end
    end

    def self.search2(search2)
        if search2
            where(["discipline LIKE ?", "%#{search2}%"])
        else
            all
        end
    end

end
