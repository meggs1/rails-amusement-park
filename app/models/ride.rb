class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if not_enough_tickets && too_short
            not_enough_tickets_message + " " + too_short_message.delete_prefix("Sorry. ")
        elsif not_enough_tickets
            not_enough_tickets_message
        elsif too_short
            too_short_message
        else 
            successful_ride   
            "Thanks for riding the #{self.attraction.name}!"              
        end
    end

    def not_enough_tickets
        self.user.tickets < self.attraction.tickets
    end

    def not_enough_tickets_message
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end

    def too_short
        self.user.height < self.attraction.min_height
    end

    def too_short_message
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    end

    def successful_ride
        self.user.update(
            :tickets => (self.user.tickets - self.attraction.tickets),
            :nausea => (self.user.nausea + self.attraction.nausea_rating),
            :happiness => (self.user.happiness + self.attraction.happiness_rating)
        )   
    end
end
