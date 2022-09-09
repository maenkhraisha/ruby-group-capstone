require_relative '../item'
require_relative '../book'

describe Book do
  context 'when book is created' do
    it 'should have a author' do
      book = Book.new('2022-09-09', 'publisher', 'good')
      expect(book.publisher).to eq('publisher')
    end
  end
end
