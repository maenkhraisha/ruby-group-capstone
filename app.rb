require_relative 'book'
require_relative 'musicalbum'
require_relative 'game'
require_relative 'genre'
require_relative 'author'
require_relative 'label'
require 'date'
require_relative 'modules/music_options'
require_relative 'modules/game_options'
require_relative 'modules/json_games'
require_relative './modules/json_storage'

class App
  include Music
  include MusicFiles
  include Games
  include GameFiles
  attr_accessor :book_list, :label_list, :music_list, :genre_list, :games_list, :author_list

  def initialize
    @book_list = load_book
    @label_list = load_label
    @music_list = load_music
    @genre_list = load_genre
    @games_list = []
    @author_list = load_authors
  end

  def list_book
    list_books
  end

  def list_music
    list_musics
  end

  def list_games
    list_game
  end

  def list_label
    list_labels
  end

  def list_genre
    list_genres
  end

  def list_authors
    list_author
  end

  def add_book
    add_books
  end

  def add_album
    add_albums
  end

  def create_genre
    create_genres
  end

  def add_game
    add_games
  end
end
