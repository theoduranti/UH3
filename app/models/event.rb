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
            eleve = Ele.find_by_email(search3)
            profe = Pro.find_by_email(search3)
            if !eleve == nil 
                if !profe == nil
                    eleveid = eleve.id.to_s
                    profeid = profe.id.to_s
                    where(["cast(asubscribe as text) LIKE ? or professor_id.to_s LIKE ?", "%#{eleveid}%"], "%#{profeid}%"])
                else 
                    eleveid = eleve.id.to_s
                    where(["cast(asubscribe as text) LIKE ?", "%#{eleveid}%"])
            elsif !profe == nil
                profeid = profe.id.to_s
                where(["professor_id.to_s LIKE ?", "%#{profeid}%"])
            else
                all
            end
        else
            all
        end
    end


end
