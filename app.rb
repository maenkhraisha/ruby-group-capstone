require_relative 'musicalbum'
require_relative 'genre'
require 'date'

class App
  attr_accessor :book_list, :label_list, :music_list, :genre_list, :games_list, :author_list

  def initialize()
    @book_list = []
    @label_list = []
    @music_list = []
    @genre_list = []
    @games_list = []
    @author_list = []
  end

  def list_books; end

  def list_music; end

  def list_games; end

  def list_label; end

  def list_genre; end

  def list_authors; end

  def add_book; end

  def add_album
    puts 'Album on spotify? [y/n]: '
    response = gets.chomp
    on_spotify = response == 'y'
    puts 'When was the music published? [yyyy-mm-dd]: '
    publish_date = Date.strptime(gets.chomp)
    new_album = MusicAlbum.new(on_spotify, publish_date)
    puts 'What is the genre of the music? '
    genre = gets.chomp
    @music_list << new_album
    music_genre = Genre.new(genre)
    new_album.genre = genre
    music_genre.add_item(new_album)
    @genre_list.push(genre) unless @genre_list.include?(genre)
    puts 'Music added successfully'
    # get_genre(genre)
    p @genre_list
    main
  end

  def add_game; end
end
