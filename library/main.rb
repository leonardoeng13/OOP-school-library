# rubocop:disable Metrics\CyclomaticComplexity, Metrics/MethodLength

require_relative 'Classroom'
require_relative 'school_organizer'

class App
  include SchoolOrganizer
  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = Classroom.new('Fresher Class')
  end

  def run
    puts 'Welcome to School Library App!'

    loop do
      print_options

      option = gets.chomp

      if option == '7'
        save_data
        break
      end

      handle_option option
    end

    puts 'Thank you for using this app!'
  end

  def handle_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_by_person_id
    when '7'
      save_data
    else
      puts 'That is not a valid option ❌'
    end
  end

  def print_options
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book '
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
end

def main
  app = App.new
  app.parse_books
  app.parse_people
  app.parse_rentals
  app.run
end

main
# rubocop:enable Metrics\CyclomaticComplexity, Metrics/MethodLength
