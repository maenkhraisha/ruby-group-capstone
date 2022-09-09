require './item'

class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :id

  def initialize(date, publisher, cover_state)
    super(date)
    @id = id
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super.can_be_archived? || @cover_state == 'bad'
  end
end
