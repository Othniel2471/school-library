require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double('nameable', correct_name: 'othniel') }
  subject { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the nameable' do
      expect(subject.correct_name).to eq('Othniel')
    end
  end
end
