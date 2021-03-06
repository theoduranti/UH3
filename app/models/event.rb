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
            if eleve == nil 
                if profe == nil
                    all
                else
                    profeid = profe.id.to_s
                    where(["cast(professor_id as text) LIKE ?", "%#{profeid}%"])
                end
            else
                if profe == nil
                    eleveid = eleve.id.to_s
                    where(["cast(asubscribe as text) LIKE ?", "%#{eleveid}%"])
                else
                    eleveid = eleve.id.to_s
                    profeid = profe.id.to_s
                    where(["cast(asubscribe as text) LIKE ? or cast(professor_id as text) LIKE ?", "%#{eleveid}%", "%#{profeid}%"])
                end
            end
        else
            all
        end
    end



    def self.search4(search4)
        if search4
            datetimenow = DateTime.now 
            if search4 == 'Les 7 prochains jours'
                where('date BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now+7.day).all
            elsif search4 == 'Les 30 prochains jours'
                where('date BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now+30.day).all
            elsif search4 == 'Tous les événements futurs'
                where('date BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now+5.year).all
            elsif search4 == 'Tous les événements passés'
                where('date BETWEEN ? AND ?', DateTime.now-5.year, DateTime.now.beginning_of_day).all
            else
                all
            end
        else
            all
        end
    end




    
    def self.search5(search5)
        if search5 == 'Les lundis'     
            where("trim(to_char(date, 'Day')) = ? ", "Monday")    
        elsif search5 == 'Les mardis'     
            where("trim(to_char(date, 'Day')) = ? ", "Tuesday") 
        elsif search5 == 'Les mercredis'     
            where("trim(to_char(date, 'Day')) = ? ", "Wednesday") 
        elsif search5 == 'Les jeudis'     
            where("trim(to_char(date, 'Day')) = ? ", "Thursday") 
        elsif search5 == 'Les vendredis'     
            where("trim(to_char(date, 'Day')) = ? ", "Friday") 
        elsif search5 == 'Les samedis'     
            where("trim(to_char(date, 'Day')) = ? ", "Saturday")
        elsif search5 == 'Les dimanches'     
            where("trim(to_char(date, 'Day')) = ? ", "Sunday") 
        else
            all
        end
    end

    



    def self.search6(search6)
        if search6 == nil
            all
        else 
            sss = search6.to_s
            where(["cast(date as text) LIKE ?", "%#{sss}%" ])
        end
    end



end
