@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just return twice"

  name = STDIN.gets.chomp

  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"

    name = STDIN.gets.chomp
  end
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
  puts "3. Save the list to students.csv"
  puts "4. Load students from students.csv"
  puts "9. Exit" #9 because more items will be added.
end

def show_students
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
    when "4"
      load_students
    when "9"
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each { |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  }
  file.close
end

def try_load_students
  filename = ARGV.first #first argument in the command line
  return if filename.nil?
  if File.exists?(filename) #if it exists?
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def save_students
 # open the file for writing
 file = File.open("students.csv", "w")
 # iterate over the array of students
 @students.each { |student|
   student_data = [student[:name], student[:cohort]]
   csv_line = student_data.join(",")
   file.puts csv_line
 }
 file.close
end


try_load_students
interactive_menu
