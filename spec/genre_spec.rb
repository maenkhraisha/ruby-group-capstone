require_relative '../musicalbum'
require_relative '../genre'

describe Genre do
  before(:all) do
    @music = MusicAlbum.new(true, '2010-01-01')
    @genre = Genre.new('comedy')
    @add_items = @genre.add_item(@music)
  end

  describe '#add_item' do
    it 'should be instance of item class' do
      expect(MusicAlbum.superclass).to eq(Item)
    end

    it 'should return the input genre' do
      expect(@add_items.name).to eq('comedy')
    end

    it 'should add items to the items array' do
      expect(@add_items.items.length).to eq(1)
    end
  end
end
