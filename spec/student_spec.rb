require_relative '../student'

describe Student do
  context 'Creates a student' do
    it 'should be an instance of Student' do
      expect(Student.new(18, 'John Doe', true)).to be_an_instance_of(Student)
    end
  end
end
