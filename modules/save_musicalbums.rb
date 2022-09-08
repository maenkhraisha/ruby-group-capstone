require 'json'

module Music_files
  def save_music
    music_array = []
    @music_list.each do |album|
      music_array << 
      {
        id: album.id,
        publish_date: album.publish_date,
        archived: album.archived,
        on_spotify: album.on_spotify,
        genre: {
          id: album.genre.id,
          genre: album.genre.name
        },
      }
    end
    write_json(music_array, './storageFiles/musicAlbum.json')
  end

  def save_genre
    genres = []
    @genre_list.each do |genre|
      genres << genre
    end
    write_json(genres, './storageFiles/genre.json')
  end

  def load_music
    @music_list = []
    music_file = './storageFiles/musicAlbum.json'
    unless File.empty?(music_file)
      file = File.read(music_file)
      JSON
        .parse(file)
        .map do |element|
          new_album = MusicAlbum.new(element['on_spotify'], element['publish_date'])
          @music_list << new_album
          music_genre = Genre.new(element['genre']['genre'])   
          music_genre.add_item(new_album)
      end
    else
      []
    end   
    @music_list
  end

  def load_genre
    @genre_list = []
    genre_file = './storageFiles/genre.json'
    unless File.empty?(genre_file)
      file = File.read(genre_file)
      JSON
        .parse(file)
        .each do |element|
          @genre_list << element
        end
      else
        []
      end
  end

  def write_json(array, filename)
    return unless File.exist?(filename)

    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write(filename, JSON.generate(array, opts))
  end
end
