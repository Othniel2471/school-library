require_relative '../teacher'

describe Teacher do
  context 'when creating a teacher' do
    teacher = Teacher.new(34, 'Math', 'Jane Doe')

    it 'creates a teacher with the parameters' do
      expect(teacher).to be_an_instance_of(Teacher)
    end

    it 'always has permission to use services' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
