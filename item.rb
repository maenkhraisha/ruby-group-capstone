require 'date'

class Item
  attr_reader :publish_date, :archived
  attr_accessor :genre, :author, :label

  def initialize(date)
    @id = Random.rand(1..1000)
    @publish_date = date
    @archived = archived
  end

  def can_be_archived?
    (Date.today - Date.strptime(@publish_date)).to_i > 3650
  end
  private :can_be_archived?

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_author=(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end
end
