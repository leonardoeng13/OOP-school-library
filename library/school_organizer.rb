# rubocop:disable Metrics ModuleLength
require 'json'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

module SchoolOrganizer
  def list_books
    @books.each { |book| puts book }
  end

  def list_people
    @people.each { |person| puts person }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) ❓ [Input the number]: '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input ❌'
      return
    end

    puts 'Person created successfully ✅'
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission ❓ [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    student = Student.new(name: name, age: age, parent_permission: parent_permission, classroom: @classroom)
    @people.push(student)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(name: name, age: age, specialization: specialization)
    @people.push(teacher)
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts 'Book created successfully ✅'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, idx| puts "#{idx}) #{book}" }

    book_idx = gets.chomp.to_i

    puts
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, idx| puts "#{idx}) #{person}" }

    person_idx = gets.chomp.to_i

    puts
    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_idx], @people[person_idx])
    @rentals.push(rental)

    puts 'Rental created successfully ✅'
  end

  def list_rentals_by_person_id
    print 'ID of person: '

    puts 'Rentals:'

    @rentals.each { |rental| puts rental }
  end

  def save_data
    File.open('books.json', 'w') { |f| f.write (JSON.pretty_generate(@books)) }
    File.open('people.json', 'w') { |f| f.write (JSON.pretty_generate(@people)) }
    File.open('rentals.json', 'w') { |f| f.write (JSON.pretty_generate(@rentals)) }
  end

  def parse_books
    file = 'books.json'

    if File.exist? file
      data = JSON.parse(File.read(file), create_additions: true)
      data.each do |book|
        @books.push(Book.new(book['title'], book['author']))
      end
    else
      []
    end
  end

  def parse_people
    file = 'people.json'
    return [] unless File.exist? file

    JSON.parse(File.read(file)).map do |people|
      if people['json_class'] == 'Student'
        student = Student.new(name: people['name'],
                              age: people['age'],
                              parent_permission: people['permission'],
                              classroom: @classroom.label)
        @people.push(student)
      else
        teacher = Teacher.new(age: people['age'],
                              name: people['name'],
                              specialization: people['specialization'])
        @people.push(teacher)

      end
      @people.last.id = people['id']
    end
  end

  def parse_rentals
    file = 'rentals.json'
    return [] unless File.exist? file

    if File.exist? file
        JSON.parse(File.read(file)).map do |rental|
        person = @people.find { |rental_person| rental_person.id == rental['person_id'] }
        book = @books.find { |rental_book| rental_book.title == rental['book_title'] }

        rental = Rental.new(rental['date'], person, book)
        @rentals.push(rental)
      end
    else
      []
    end
  end
end
# rubocop:enable Metrics\CyclomaticComplexity, Metrics/MethodLength
