require 'json'
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

  def read_books
    File.new('Data/books.json', 'w') unless File.exist?('Data/books.json')
    books = File.read('Data/books.json')
    return if books.empty?

    JSON.parse(books).each do |book|
      @books.push(Book.new(book['title'], book['author']))
    end
  end

  def read_people
    File.new('Data/people.json', 'w') unless File.exist?('Data/people.json')
    people = File.read('Data/people.json')
    return if people.empty?

    JSON.parse(people).each do |person|
      if person['type'] == 'Student'
        @people.push(Student.new(person['age'], person['name'], person['parent_permission']))
      elsif person['type'] == 'Teacher'
        @people.push(Teacher.new(person['age'], person['specialization'], person['name']))
      end
    end
  end

  def read_rentals
    File.new('Data/rentals.json', 'w') unless File.exist?('Data/rentals.json')
    rentals = File.read('Data/rentals.json')
    return if rentals.empty?

    JSON.parse(rentals).each do |rental|
      book = @books.find { |singlebook| singlebook.title == rental['book'] }
      person = @people.find { |singleperson| singleperson.name == rental['person'] }
      @rentals.push(Rental.new(rental['date'], book, person))
    end
  end

  def write_data
    books_file = []
    people_file = []
    rentals_file = []

    @books.each do |book|
      books_file.push({ title: book.title, author: book.author })
    end

    @people.each do |person|
      if person.instance_of?(Student)
        people_file.push({ type: 'Student', age: person.age, name: person.name,
                           parent_permission: person.parents_permission })
      elsif person.instance_of?(Teacher)
        people_file.push({ type: 'Teacher', age: person.age, name: person.name, specialization: person.specialization })
      end
    end

    @rentals.each do |rental|
      rentals_file.push({ date: rental.date, book: rental.book.title, person: rental.person.name })
    end

    File.write('Data/books.json', JSON.pretty_generate(books_file))
    File.write('Data/people.json', JSON.pretty_generate(people_file))
    File.write('Data/rentals.json', JSON.pretty_generate(rentals_file))
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
        puts person
        if person.instance_of?(Teacher)
          puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        elsif person.instance_of?(Student)
          puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    else
      puts 'Sorry ,No one in the list'
    end
  end

  def create_person(person_type)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    if person_type == 1
      print 'Has parent permission? (Y/N): '
      permission = gets.chomp
      person = Student.new(age, name, permission)
      @people.push(person)
      puts "Student #{person.name} was created successfully with ID #{person.id}"
    elsif person_type == 2
      print 'Specialization: '
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name)
      @people.push(person)
      puts "Teacher #{name} was added successfully with ID #{person.id}"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book #{book.title} was added successfully"
  end

  def create_rental
    if @books.length.positive? && @people.length.positive?
      puts 'Choose a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      book_index = gets.chomp.to_i
      book = @books[book_index]
      puts 'Choose a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) Name: #{person.name}, Age: #{person.age}"
      end
      person_index = gets.chomp.to_i
      person = @people[person_index]
      print 'Date (YYYY-MM-DD): '
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
