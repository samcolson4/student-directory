@students = []

def open_file(filename = "students.csv")
  puts "What file would you like to load the students from?"
  filename = gets.chomp
  File.open(filename, "a+") #opens the file in append mode
end

def close_file
  @file.close
end

def load_students
  @file.readlines.each { |line|
  name, cohort = line.chomp.split(",")
  add_to_students(name, cohort)
  }
end

@file = open_file("students.csv")

def input_students
  puts "INPUT STUDENTS".center(35)
  puts "Please enter the names of the students"
  puts "To finish, just return twice"

  name = STDIN.gets.chomp

  while !name.empty? do
    add_to_students(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def add_to_students(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "9. Exit and close the file"
end

def show_students
  puts "SHOW STUDENTS".center(35)
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      puts "QUITTING...".center(35)
      close_file
      exit
    else
      puts "I don't know what you mean, please try again."
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "---------"
end

def print_student_list
  @students.each { |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  }
end

def print_footer
    puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "SAVING STUDENTS".center(35)

  @students.each { |student|
   student_data = [student[:name], student[:cohort]]
   csv_line = student_data.join(",")
   @file.puts csv_line
 }
end


# try_load_students
load_students
interactive_menu
