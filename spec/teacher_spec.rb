require_relative 'required_files'
describe Teacher do
  before :each do
    @teacher = Teacher.new(age: 41, name: 'Leonardo', specialization: 'Oracle')
  end
  describe '#instance' do
    context '#new teacher' do
      it 'should return an instance of teacher' do
        expect(@teacher).to be_an_instance_of Teacher
      end
    end
    context '#can_use_services?' do
      it 'should use services' do
        expect(@teacher.can_use_services?).to be_truthy
      end
    end
  end
end
