require './item'

class book < item
    def initialize(publisher, cover_state)
        @publisher = publisher
        @cover_state = cover_state
    end

    def can_be_archived?
        if(super.can_be_archived? || cover_state == 'bad')
            return true
        else 
            return false
    end
end