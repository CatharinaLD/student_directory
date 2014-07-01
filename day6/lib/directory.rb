def print_header
	puts 'Welcome to Student Directory'	
end

def students
	#[{name:'Zoe'}, {name:'Anna'}, {name:'Catharina'}]
	@students ||= []
end

def ask_name 
	puts 'Please enter your name'	
end

def add(student)
	students << student
end

def user_input
	gets.chomp
end

def student_names
	students.map{|student| student[:name]}
end

def print_students
	puts student_names.join(', ')
end

def print_footer
	puts "Overall, we have #{students.length} students."
end

def create_student_named(name)
	{name: name}
end

# print_header
# ask_name
# add(create_student_named(user_input))
# print_footer