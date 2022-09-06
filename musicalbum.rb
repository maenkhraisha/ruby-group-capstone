require_relative 'item'

class MusicAlbum < Item
  def initialize(on_spotify, publish_date)
    super()
    @on_spotify = on_spotify
    @publish_date = publish_date
  end

  def can_be_archived?
    super && @on_spotify ? true : false
  end
end

# my_album = MusicAlbum.new(false, "2011-06-04")
# p my_album
# puts my_album.can_be_archived?
# puts my_album.id
# p my_album.is_a?(MusicAlbum)
