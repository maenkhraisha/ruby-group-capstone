require 'json'
require_relative 'save_musicalbums'

module GameFiles
  def save_authors
    author_array = []
    @author_list.each do |author|
      author_array <<
        {
          first_name: author.first_name,
          last_name: author.last_name,
          items: author.items.map do |game|
            {
              publish_date: game.publish_date,
              archived: game.archived,
              name: game.multiplayer,
              last_played_at: game.last_played_at
            }
          end
        }
    end
    write_json(author_array, './storageFiles/games.json')
  end

  def load_authors
    @author_list = []
    author_file = './storageFiles/games.json'
    if File.empty?(author_file)
      []
    else
      file = File.read(author_file)
      JSON
        .parse(file)
        .each do |person|
          @author_list << authors = Author.new(person['first_name'], person['last_name'])
          person['items'].each do |game|
            authors.add_item(Game.new(game['publish_date'], game['name'], game['last_played_at']))
          end
        end
    end
    @author_list
  end
end
