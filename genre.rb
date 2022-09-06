require_relative 'item'

class Genre < Item
  attr_accessor :name, :items
  attr_reader :id, :publish_date

  def initialize(name)
    super()
    @items = []
    @id = id
    @name = name
    @publish_date = publish_date
  end

  def add_item(item)
    @items.include?(item) || (@items << item)
    item.genre = @name
    item.add_genre(self)
    p @items
  end
end
