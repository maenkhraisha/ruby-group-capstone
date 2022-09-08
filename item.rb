require 'date'

class Item
  attr_reader :id, :publish_date, :archived

  def initializer(publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
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

  def add_label(label)
    label.is_a(label) && @label.nil? && (
      @label = label
      label.add_item(self)
    )
  end

  def add_author(author)
    author.is_a(author) && @author.nil? && (
      @author = author
      author.add_item(self)
    )
  end
  # private :can_be_archived?
end
