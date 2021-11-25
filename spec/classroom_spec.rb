require_relative 'required_files'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Database 101')
    @student = Student.new(age: 17, classroom: @classroom)
    @classroom.add_student @student
  end

  describe '#instance' do
    it 'should return an instance of Classroom' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe '#label' do
    it 'should return the correct label' do
      expect(@classroom.label).to eq 'Database 101'
    end
  end

  describe '#add_student' do
    it 'should add student to Classroom' do
      expect(@classroom.students).to include(@student)
    end
  end

  describe 'student' do
    it 'should be in the correct classroom' do
      expect(@student.classroom).to eq @classroom
    end
  end
end
