module Music
  def add_albums
    puts 'Album on spotify? [y/n]: '
    response = gets.chomp
    on_spotify = response == 'y'
    puts 'When was the music published? [yyyy-mm-dd]: '
    publish_date = gets.chomp
    @new_album = MusicAlbum.new(on_spotify, publish_date)
    @music_list << @new_album
    create_genre
    puts 'Music added successfully'
    p @genre_list
    main
  end

  def create_genres
    puts 'What is the genre of the music? '
    genre = gets.chomp
    @genre_list.push(genre) unless @genre_list.include?(genre)
    music_genre = Genre.new(genre)
    music_genre.add_item(@new_album)
  end
end
