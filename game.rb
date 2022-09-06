require './item'

class game
    def initialize(multiplier, last_play_date)
        @multiplier = multiplier
        @last_play_date = last_play_date
    end

    def can_be_archived?
    end
end