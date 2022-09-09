require_relative '../item'
require_relative '../musicalbum'

describe '#can_be_archived?' do
  it 'Should return true for archive method' do
    music = MusicAlbum.new(true, '2011-01-01')
    expect(music.can_be_archived?).to be true
  end

  it 'Should return false for archive method' do
    music = MusicAlbum.new(false, '2011-01-01')
    expect(music.can_be_archived?).to be false
  end

  it 'Should return false for archive method' do
    music = MusicAlbum.new(true, '2013-01-01')
    expect(music.can_be_archived?).to be false
  end
end
