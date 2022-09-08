require_relative 'save_musicalbums'

module Music
  include MusicFiles
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
  end

  def create_genres
    if @genre_list.length.positive?
      response = genre_options
      if response
        list = list_genres
        puts list.to_s
        reply = gets.chomp.to_i
        music_genre = Genre.new(@genre_list[reply - 1])
        music_genre.add_item(@new_album)
        save_music
      else
        new_genre
      end
    else
      new_genre
    end
  end

  def list_genres
    if @genre_list.length <= 0
      puts 'The genre list is empty, please add to begin!'
    else
      puts 'List of all available genre'
      @genre_list.each_with_index do |genre, index|
        puts " #{index + 1}: #{genre} "
      end
    end
  end

  def new_genre
    puts 'What is the genre of the music? '
    genre = gets.chomp
    @genre_list.push(genre) unless @genre_list.include?(genre)
    music_genre = Genre.new(genre)
    music_genre.add_item(@new_album)
    save_music
    save_genre
  end

  def genre_options
    puts 'Would you like to choose from an existing genre? '
    puts 'Please Select 1 to  Choose from the list of genre or 2 to add new genre'
    choice = gets.chomp.to_i
    case choice
    when 1
      true
    when 2
      false
    else
      puts 'Invalid option'
    end
  end

  def list_musics
    puts 'List of all albums'
    @music_list.each_with_index do |album, index|
      # rubocop:disable Layout/LineLength
      puts "#{index + 1} ID #{album.id} | Published date - #{album.publish_date} | On spotify? #{album.on_spotify ? 'Yes' : 'No'} | Genre - #{album.genre.name}"
      # rubocop:enable Layout/LineLength
    end
  end
end
