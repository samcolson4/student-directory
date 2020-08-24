def input_students
  puts "Please enter the names of the students"
  puts "To finish, just return twice"

  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    name = gets.chomp
  end
  students
end

def input_students_more
  students = []

  puts "Please enter the names of the student:"
  puts "To finish, just return twice"
  name = gets.chomp

  while !name.empty? do
    puts "Please enter the hobby of the student:"
    hobby = gets.chomp
    puts "Please enter the height of the student in cm:"
    height = gets.chomp

    students << {name: name, cohort: :november, hobby: hobby, height: height}
    puts "Now we have #{students.count} students"

    puts "Please enter the names of the student:"
    puts "To finish, just return twice"
    name = gets.chomp

  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "---------"
end

def print(students) # old print + index number
  students.each_with_index { |student, i|
    puts "#{i.to_i + 1} #{student[:name]} (#{student[:cohort]} cohort)"
  }
end

def print_more(students) # printing extra information like hobbies + index number. Also centered.
  students.each_with_index { |student, i|
    puts "#{i.to_i + 1} #{student[:name]} (#{student[:cohort]} cohort), interested in #{student[:hobby]} and #{student[:height]}cm tall.".center(85)
  }
end

def print_f(students) # only prints names with the first letter 'F'
  students.each_with_index { |student, i|
    if student[:name].chars[0].upcase == 'F'
      puts "#{i.to_i + 1} #{student[:name]} (#{student[:cohort]} cohort)"
    end
  }
end

def print_under_twelve(students) # prints only student names with fewer than 12 characters
  students.each_with_index { |student, i|
    if student[:name].length < 12
      puts "#{i.to_i + 1} #{student[:name]} (#{student[:cohort]} cohort)"
    end
  }
end

def print_while(students) # old print + index number
  new_list = students.each_with_index { |student, i|
    puts "#{i.to_i + 1} #{student[:name]} (#{student[:cohort]} cohort)"
  }

  counter = 0
  while counter <= new_list.length do
    puts "#{new_list[counter].to_s}"
    counter += 1
  end

end

def print_footer(students)
    if students.count == 1
      puts "Overall, we have #{students.count} great student."
    else
      puts "Overall, we have #{students.count} great students."
    end
end


# students = input_students
students = input_students_more
print_header
# print(students)
print_more(students)
# print_f(students)
# print_under_twelve(students)
# print_while(students)
print_footer(students)
