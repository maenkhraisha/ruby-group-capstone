require_relative '../label'
require_relative '../item'

describe Label do
  context 'when label is created' do
    it 'should have a title' do
      label = Label.new('History', 'red')
      expect(label.title).to eq('History')
    end
  end
end
