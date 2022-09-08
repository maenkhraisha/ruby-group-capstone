require_relative 'musicalbum'
require_relative 'genre'
require 'date'
require_relative 'modules/music_options'
require_relative './modules/save_musicalbums'

class App
  include Music
  include MusicFiles
  attr_accessor :book_list, :label_list, :music_list, :genre_list, :games_list, :author_list

  def initialize
    @book_list = []
    @label_list = []
    @music_list = load_music
    @genre_list = load_genre
    @games_list = []
    @author_list = []
  end

  def list_books; end

  def list_music
    list_musics
  end

  def list_games; end

  def list_label; end

  def list_genre
    list_genres
  end

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
