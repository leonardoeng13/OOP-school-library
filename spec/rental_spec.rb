require_relative 'required_files'

describe Rental do
  describe '#instance' do
    classroom = Classroom.new('Database 101')
    student = Student.new(age: 21, name: 'João', classroom: classroom)
    teacher = Teacher.new(age: 41, name: 'Leonardo', specialization: 'Oracle')
    book = Book.new('Harry Potter', 'J.K. Rowling')

    first_rental = Rental.new('20211125', book, student)
    second_rental = Rental.new('20211123', book, teacher)

    it 'should be an instance of Rental' do
      expect(first_rental).to be_an_instance_of Rental
      expect(second_rental).to be_an_instance_of Rental
    end

    it 'should return the correct date for first_rental' do
      expect(first_rental.date).to eq '20211125'
    end

    it 'should return the correct date for second_rental' do
      expect(second_rental.date).to eq '20211123'
    end

    it 'should return person to be student' do
      expect(first_rental.person).to eq student
    end

    it 'should return person to be teacher' do
      expect(second_rental.person).to eq teacher
    end

    it 'should return book to be the correct book' do
      expect(first_rental.book).to eq book
    end

    context '#book' do
      it 'should have the rentals include first_rental and second_rental' do
        expect(book.rentals).to include(first_rental)
        expect(book.rentals).to include(second_rental)
      end
    end

    context '#person' do
      it 'should have the rentals include first_rental' do
        expect(student.rentals).to include(first_rental)
      end
      it 'should have the rentals include second_rental' do
        expect(teacher.rentals).to include(second_rental)
      end
    end
  end
end
