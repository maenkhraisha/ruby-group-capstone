require './item'

class Label < Item
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title, color)
    super()
    @id = Random.rand(1..10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.include?(item) || (@items << item)
    item.add_label(self)
  end
end
