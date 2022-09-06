require './item'

class Game < item
  def initialize(args)
    super(args[:genre], args[:author], args[:source], args[:label], args[:publish_date], args[:archived])
    @multiplier = args[:multiplier]
    @last_play_date = args[:last_play_date]
  end

  def can_be_archived?; end
end
