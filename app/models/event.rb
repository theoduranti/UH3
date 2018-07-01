class Event < ApplicationRecord
    
    belongs_to :creator, class_name: "Ele", optional: true
    has_and_belongs_to_many :eleattendees, class_name: "Ele"

    belongs_to :creator, class_name: "Pro", optional: true
    belongs_to :professor, class_name: "Pro", optional: true
    has_and_belongs_to_many :proinvitatees, class_name: "Pro"


    def self.search(search)
        if search
            where(["name LIKE ? or description LIKE ? or discipline LIKE ?","%#{search}%","%#{search}%","%#{search}%"])
        else
            all
        end
    end

    def self.find(find)
        if find
            where(["discipline LIKE ?", "%#{find}%"])
        else
            all
        end
    end

end
