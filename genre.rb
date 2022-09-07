require_relative 'item'

class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    @items = []
    @id = Random.rand(1..1000)
    @name = name
  end

  def add_item(item)
    @items << item
    item.add_genre = self
    p @items
  end
end
