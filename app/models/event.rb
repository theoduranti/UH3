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
            where(["lower(discipline) LIKE ?", "%#{search2.downcase}%"])
        else
            all
        end
    end

    def self.search3(search3)
        if search3
            asubscribe.each do |i|
                eleve = Ele.find_by_id(i)
                eleveemail = eleve.email
                where(["eleveemail LIKE ?", "%#{search3}%"])
            end
        else
            all
        end
    end


end
