require_relative '../person'

describe Person do
  context 'Creates a person' do
    it 'Creates a person with name and age' do
      expect(Person.new(18, 'John Doe')).to be_an_instance_of(Person)
    end

    it 'passes arguments correctly' do
      person = Person.new(18, 'John Doe')
      expect(person.age).to eq(18)
      expect(person.name).to eq('John Doe')
    end

    it 'creates rentals' do
      person = Person.new(18, 'John Doe')
      expect(person.add_rental('2015-02-10', Book.new('The Martian', 'Andy Weir'))).to be_an_instance_of(Rental)
    end
  end
end
