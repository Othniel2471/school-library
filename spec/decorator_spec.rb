require_relative '../person'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

describe 'Testing Decorator' do 
    before :all do 
        @person = Person.new(5,'testing')
        @capitalizer = CapitalizeDecorator.new @person
        @trimmer = TrimmerDecorator.new @person
    end

    context 'Creating class decorator' do 
        it 'Should be an instance of the CapitalizeDecorator' do
            expect (@capitalizer).to be_instance_of(CapitalizeDecorator)
        end
    end
end