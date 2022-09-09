require_relative 'display_menu'

def main
  main = Menu.new
  loop do
    main.display_menu
  end
end

main
