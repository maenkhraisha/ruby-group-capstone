require_relative '../game'
require_relative '../author'

describe Game do
  before(:each) do
    @game = Game.new('2010-01-01', 'ping pong', '2009-01-01')
    @author = Author.new('John', 'Wick')
    @game_list = @author.add_item(@game)
  end

  describe '#add_item' do
    it 'should be instance of item class' do
      expect(Game.superclass).to eq(Item)
    end

    it 'should return the input last_name' do
      expect(@game_list.last_name).to eq('Wick')
    end
  end

  describe '#archived' do
    it 'should return true for archived' do
      expect(@game.archived).to be(true)
    end
  end

  describe '#archived' do
    it 'should return false for archived' do
      @game = Game.new('2020-01-01', 'ping pong', '2009-01-01')
      @author = Author.new('John', 'Wick')
      @game_list = @author.add_item(@game)
      expect(@game.archived).to be(false)
    end
  end

  describe '#archived' do
    it 'should return false for archived' do
      @game = Game.new('2010-01-01', 'ping pong', '2021-01-01')
      @author = Author.new('John', 'Wick')
      @game_list = @author.add_item(@game)
      expect(@game.archived).to be(false)
    end
  end
end
