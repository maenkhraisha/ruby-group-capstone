require 'json'

def save_books(books)
    books.each do |item|
        json_book = JSON.generate(item)
        File.write('./json_files/books.json', json_book, mode: 'a')
    end
end