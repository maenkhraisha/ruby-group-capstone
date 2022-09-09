require_relative '../label'
require_relative '../book'

describe Label do
  before(:all) do
    @book = Book.new('2010-01-01', 'Macmillian', 'good')
    @label = Label.new('Good dad', 'red')
    @add_items = @label.add_item(@book)
  end

  describe '#add_item' do
    it 'should be instance of item class' do
      expect(Book.superclass).to eq(Item)
    end

    it 'should return the input genre' do
      expect(@add_items.title).to eq('Good dad')
    end

    it 'should add items to the items array' do
      expect(@add_items.items.length).to eq(1)
    end
  end
end
