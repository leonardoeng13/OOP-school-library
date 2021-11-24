class Create
  def self.student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase == 'y'

    student = Student.new(name: name, age: age, parent_permission: permission, classroom: @classroom)

    puts 'Person created successfully'

    student
  end

  def self.teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(name: name, age: age, specialization: specialization)

    puts 'Person created successfully'

    teacher
  end

  def self.book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)

    puts 'Book created successfully'

    book
  end

  def self.rental(books, people)
    puts 'Select a book from the following list by number'
    books.each_with_index { |book, idx| puts "#{idx}) Title: #{book.title}, Author: #{book.author}" }

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number(not id)'
    people.each_with_index do |person, idx|
      puts "#{idx}) ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i

    puts
    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, books[book_index], people[person_index])

    puts 'Rental created successfully'

    rental
  end
end
