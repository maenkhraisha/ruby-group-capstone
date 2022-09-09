require_relative 'json_storage'

module Music
  include MusicFiles
  def add_books
    puts 'Book publish date: '
    publish_date = gets.chomp    
    puts 'Book publisher: '
    publisher = gets.chomp
    puts 'Cover status (good/bad): '
    cover_state = gets.chomp    
    @new_book = Book.new(publish_date,publisher,cover_state)
    create_label
    @book_list << @new_book
    save_book    
    puts 'Book added successfully!'
  end

  def add_label
    puts 'Enter the title of the book'
    title = gets.chomp
    puts 'Enter the cover color'
    color = gets.chomp
    Label.new(title, color)    
  end

  def create_label
    puts 'Would you like to choose from an existing label[1] or add a new label[2]'
    response = gets.chomp.to_i
    case response
    when 1
      label = add_existing_label
      label.add_item(@new_book)      
    when 2
      label = add_label
      @label_list << label.add_item(@new_book)      
    end    
    save_label
  end

 
  def add_existing_label
    puts 'Existing labels'
    @label_list.each do |label|
      puts " #{label.id}: #{label.title} "
    end
    puts 'Select label by number'
    id = gets.chomp.to_i
    @label_list.find { |label| label.id == id}
  end

  # def list_label
  #   if @label_list.length <= 0 
  #     puts 'The label list is empty, please add to begin'
  #   else
  #     puts 'List of all available label'
  #     @label_list.each do |label|
  #       puts " #{label.id}: #{label.title} "
  #     end
  #   end
  # end

  def add_albums
    puts 'Album on spotify? [y/n]: '
    response = gets.chomp
    on_spotify = response == 'y'
    puts 'When was the music published? [yyyy-mm-dd]: '
    publish_date = gets.chomp
    @new_album = MusicAlbum.new(on_spotify, publish_date)
    @music_list << @new_album
    create_genre
    puts 'Music added successfully!'
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

  def list_books
    puts 'List of all books'
    @book_list.each_with_index do |book, index|
      # rubocop:disable Layout/LineLength
      puts "#{index + 1} ID #{book.id} | Published date - #{book.publish_date} | publisher #{book.publisher} | cover state - #{book.cover_state}"
      # rubocop:enable Layout/LineLength
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
