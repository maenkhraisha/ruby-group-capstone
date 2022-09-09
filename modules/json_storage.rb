require 'json'

module MusicFiles
  def save_book
    book_array = []
    @book_list.each do |book|
      book_array <<
        {
          id: book.id,
          publish_date: book.publish_date,
          publisher: book.publisher,
          cover_state: book.cover_state,
          label: {
            id: book.label.id,
            title: book.label.title,
            color: book.label.color
          }
        }
    end
    write_json(book_array, './storageFiles/books.json')
  end

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
          }
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

  def save_label
    labels = []
    @label_list.each do |label|
      labels <<
        {
          id: label.id,
          title: label.title,
          color: label.color
        }
    end
    write_json(labels, './storageFiles/label.json')
  end

  def load_music
    @music_list = []
    music_file = './storageFiles/musicAlbum.json'
    if File.empty?(music_file)
      []
    else
      file = File.read(music_file)
      JSON
        .parse(file)
        .map do |element|
        new_album = MusicAlbum.new(element['on_spotify'], element['publish_date'])
        @music_list << new_album
        music_genre = Genre.new(element['genre']['genre'])
        music_genre.add_item(new_album)
      end
    end
    @music_list
  end

  def load_book
    @book_list = []
    book_file = './storageFiles/books.json'
    if File.empty?(book_file)
      []
    else
      file = File.read(book_file)
      JSON
        .parse(file)
        .each do |element|
          new_book = Book.new(element['publish_date'], element['publisher'], element['cover_state'])
          @book_list << new_book
          label = Label.new(element['label']['title'], element['label']['color'])
          label.add_item(new_book)
        end
    end
    @book_list
  end

  def load_label
    @label_list = []
    label_file = './storageFiles/label.json'
    if File.empty?(label_file)
      []
    else
      file = File.read(label_file)
      JSON
        .parse(file)
        .each do |element|
          new_label = Label.new(element['title'], element['color'])
          @label_list << new_label
        end
    end
    @label_list
  end

  def load_genre
    @genre_list = []
    genre_file = './storageFiles/genre.json'
    if File.empty?(genre_file)
      []
    else
      file = File.read(genre_file)
      JSON
        .parse(file)
        .each do |element|
          @genre_list << element
        end
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
