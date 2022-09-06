require './item'

class Book < item
  def initialize(args)
    super(args[:genre], args[:author], args[:source], args[:label], args[:publish_date], args[:archived])
    @publisher = args[:publisher]
    @cover_state = args[:cover_state]
  end

  def can_be_archived?
    super.can_be_archived? || cover_state == 'bad'
  end
end
