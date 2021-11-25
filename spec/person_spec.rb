require_relative 'required_files'

describe Person do
  describe '#instance' do
    context 'when initialized with only age' do
      person = Person.new(age: 32)

      it 'should return an instance of person' do
        expect(person).to be_an_instance_of Person
      end

      it 'should return name as unknown' do
        expect(person.name).to eq 'Unknown'
      end

      it 'should have parent_permission set to true' do
        expect(person.parent_permission).to be_truthy
      end
    end

    context 'with having all parameters' do
      person = Person.new(name: 'Pedro', age: 21, parent_permission: false)

      it 'should return an instance of person' do
        expect(person).to be_an_instance_of Person
      end

      it 'should have parent_permission set to false' do
        expect(person.parent_permission).to be_falsey
      end

      it 'should have the correct name' do
        expect(person.name).to eq 'Pedro'
      end

      it 'should respond to rentals' do
        expect(person).to respond_to(:rentals)
      end
    end
  end

  describe '#can_use_services' do
    context 'when person is below 18 years' do
      it 'should not be allowed' do
        person = Person.new(name: 'Fernando', age: 17, parent_permission: false)
        expect(person.can_use_services?).to be_falsey
      end

      it 'should be allowed only with parent permission' do
        person = Person.new(name: 'Fernando', age: 17, parent_permission: true)
        expect(person.can_use_services?).to be_truthy
      end
    end

    context 'when person is above 18 years' do
      person = Person.new(name: 'Fernando', age: 24, parent_permission: false)

      it 'should be allowed without parent permission' do
        expect(person.can_use_services?).to be_truthy
      end
    end
  end
end
