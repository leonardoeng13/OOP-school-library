require_relative 'classroom'
require_relative 'listings'
require_relative 'create'
require_relative 'input_output'
require_relative 'converter'
class App
  attr_accessor :people, :books

  def initialize
    @people_io = InputOutput.new('people.json')
    @books_io = InputOutput.new('books.json')
    @rentals_io = InputOutput.new('rentals.json')

    @people = Converter.hash_to_people_arr @people_io.read
    @books = Converter.hash_to_books_arr @books_io.read
    @rental = Converter.hash_to_rentals_arr @rentals_io.read, @books, @people
    @listings = Listings.new(@books, @people, @rental)
  end

  def choices
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]'
    answer = gets.chomp
    case answer
    when '1'
      new_person = Create.student
      @people << new_person
      @people_io.write(new_person.to_hash)
    when '2'
      new_person = Create.teacher
      @people << new_person
      @people_io.write(new_person.to_hash)
    else
      puts 'Please choose a valid number'
    end
  end

  def list_books
    @listings.books
  end

  def list_people
    @listings.people
  end

  def create_book
    new_book = Create.book
    @books << new_book
    @books_io.write(new_book.to_hash)
  end

  def create_rental
    new_rental = Create.rental(@books, @people)
    @rental << new_rental
    @rentals_io.write(new_rental.to_hash)
  end

  def list_rentals
    @listings.rental
  end
end
