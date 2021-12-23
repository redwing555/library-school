require_relative '../lib/classes/corrector'

describe Corrector do
  context 'testing a corrector class' do
    it 'should trim to 10 chars and capitalize name' do
      corrector = Corrector.new
      expect(corrector.correct_name('the coding master')).to eq 'The coding'
    end
  end
end
