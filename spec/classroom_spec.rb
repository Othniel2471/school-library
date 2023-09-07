require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'when creating a classroom' do
    classroom = Classroom.new('Math')

    it 'creates a classroom with the parameters' do
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'has a label' do
      expect(classroom.label).to eq('Math')
    end

    it 'has no students' do
      expect(classroom.students).to eq([])
    end
  end
end
