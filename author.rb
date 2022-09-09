class Author
  attr_accessor :items
  attr_reader :id, :last_name, :first_name
  
  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(game)
    @items << game
    game.add_author = self
  end
end
