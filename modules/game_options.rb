module Games
  def add_games
    print 'Enter the name of the game: '
    multiplayer = gets.chomp
    print 'When was it last played?:  '
    last_played_at = gets.chomp
    print 'When was the game published?: '
    publish_date = gets.chomp
    @new_game = Game.new(publish_date, multiplayer, last_played_at)
    create_author
    puts 'Game added successfully!'
  end

  def create_author
    puts 'Would you like to select from existing game authors[1] or add a new author[2]'
    response = gets.chomp.to_i
    case response
    when 1
      author = add_existing_author
      author.add_item(@new_game)
    when 2
      author = add_new_author
      @author_list << author.add_item(@new_game)
      p @author_list
    else
      puts 'Invalid option'
    end
  end

  def add_existing_author
    puts 'Existing Authors'
    list_author
    puts 'Select author by ID'
    id = gets.chomp.to_i
    @author_list.find { |author| author.id == id }
  end

  def add_new_author
    puts 'Enter the author\'s first name'
    first_name = gets.chomp
    puts 'Enter the author\'s last name'
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def list_author
    @author_list.each do |author|
      puts "ID: #{author.id} | First name: #{author.first_name} | Last name: #{author.last_name}"
    end
  end

  def list_game
    puts 'List of games'
    @author_list.each do |author|
      author.items.each do |game|
        puts "Game: #{game.multiplayer} | Author: #{game.author.first_name} #{game.author.last_name}"
      end
    end
  end
end
