require 'date'

class Item
  attr_reader :id, :genre, :publish_date, :archived

  def initialize(id = Random.rand(1...1000))
    @id = id
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = nil
    @archived = false
  end

  def can_be_archived?
    (Date.today - Date.strptime(@publish_date)).to_i > 3650
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    genre.is_a(Genre) && @genre.nil? && (
      @genre = genre
      genre.add_item(self)
    )
  end
  private :can_be_archived?
end
