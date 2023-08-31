require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    puts 'welcome to school library app!'
    menu
  end

  def menu
    loop do
      puts ''
      puts 'Please choose an option by entering a number:'
      puts '1 - list all books'
      puts '2 - list all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      puts ''

      option = gets.chomp.to_i
      options(option)

      if option == 7
        exit
      end

      break if option == 7
    end
  end

  def options(option)
    case option
    when 1
      book_list
    when 2
      people_list
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    end
  end

  def exit
    puts 'Thank you for using this app!'
  end

  def book_list
    if @books.length.positive?
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    else
      puts 'Sorry ,No books in the list'
    end
  end

  def people_list
    if @people.length.positive?
      @people.each do |person|
        puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts 'Sorry ,No one in the list'
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts "Sorry, I didn't understand you"
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? (Y/N): '
    permission = gets.chomp
    person = Student.new(age, name, permission)
    @people.push(person)
    puts "Student #{person.name} was created successfully with ID #{person.id}"
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name)
    @people.push(person)
    puts "Teacher #{name} was created successfully with ID #{person.id}"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book #{book.title} was created successfully"
  end

  def create_rental
    if @books.length.positive? && @people.length.positive?
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      book_index = gets.chomp.to_i
      book = @books[book_index]
      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) Name: #{person.name}, Age: #{person.age}"
      end
      person_index = gets.chomp.to_i
      person = @people[person_index]
      print 'Date: '
      date = gets.chomp
      rental = Rental.new(date, book, person)
      @rentals.push(rental)
      puts "Rental was created on '#{rental.date}' for book '#{rental.book.title}' and person '#{rental.person.name}'"
    else
      puts 'You need to have at least one person and one book in order to create a rental'
    end
  end

  def list_rentals
    if @rentals.length.positive?
      puts 'ID of person: '
      person_id = gets.chomp.to_i
      person = @people.find { |someone| someone.id == person_id }
      if person
        puts 'Rentals:'
        person.rentals.each do |rental|
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      else
        puts 'Person not found'
      end
    else
      puts 'No rentals were found'
    end
  end
end
