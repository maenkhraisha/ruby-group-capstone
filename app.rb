require_relative 'musicalbum'
require_relative 'genre'
require 'date'
require_relative 'modules/music_options'

class App
  include Music
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
    add_albums
  end

  def create_genre
    create_genres
  end

  def add_game; end
end
