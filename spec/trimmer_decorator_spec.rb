require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { double('nameable', correct_name: 'othniel') }
  subject { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    it 'trims the nameable' do
      expect(subject.correct_name).to eq('othniel')
    end
  end
end
