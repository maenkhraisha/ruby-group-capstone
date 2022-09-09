require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :archived, :publish_date
  attr_reader :id

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @id = id
    @on_spotify = on_spotify
    @publish_date = publish_date
    @archived = can_be_archived?
  end

  def can_be_archived?
    super && @on_spotify ? true : false
  end
end
