require_relative '../decorator'

describe Decorator do
  let(:nameable) { double('nameable') }
  subject { Decorator.new(nameable) }

  describe '#correct_name' do
    it 'delegates to the nameable' do
      expect(nameable).to receive(:correct_name)
      subject.correct_name
    end
  end
end
