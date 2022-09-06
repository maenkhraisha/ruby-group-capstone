require_relative 'app'
class Menu
  @app = App.new
  def display_menu
    puts "\nWelcome to your catalog!"
    puts 'Please choose from the following tasks by entering a number'
    puts "1 - To list items\n2 - To add items\n3 - To exit "
    choice = gets.chomp.to_i
    case choice
    when 1
      display_first_list
    when 2
      add_item
    when 3
      exit_app
    else
      puts 'Invalid selection'
    end
  end

  def display_first_list
    puts "\nPlease choose from the following tasks by entering a number"
    puts "1 - To list all books\n2 - To list all music albums\n3 - To list all games
4 - For next listings\n5 - Back to main menu\n6 - Exit "
    choice = gets.chomp.to_i
    case choice
    when 1
      @app.list_books
    when 2
      @app.list_music
    when 3
      @app.list_games
    when 4
      display_second_list
    when 5
      display_menu
    when 6
      exit_app
    else
      puts 'Invalid selection'
    end
  end

  def display_second_list
    puts "\nPlease choose from the following tasks by entering a number"
    puts "1 - To list all labels\n2 - To list all genres\n3 - To list all authors\n4 - previous
5 - Back to main menu\n6 - Exit"
    choice = gets.chomp.to_i
    case choice
    when 1
      @app.list_label
    when 2
      @app.list_genre
    when 3
      @app.list_authors
    when 4
      display_first_list
    when 5
      display_menu
    when 6
      exit_app
    else
      puts 'Invalid selection'
    end
  end

  def add_item
    puts "\nPlease choose from the following tasks by entering a number"
    puts "1 - To add a book\n2 - To add a music album\n3 - To add a game\n4 - Back to main menu\n5 - Exit"
    choice = gets.chomp.to_i
    case choice
    when 1
      @app.add_book
    when 2
      @app.add_album
    when 3
      @app.add_game
    when 4
      display_menu
    when 5
      exit_app
    else
      puts 'Invalid selection'
    end
  end

  def exit_app
    puts 'Thank you for using this app!'
    exit
  end
end
