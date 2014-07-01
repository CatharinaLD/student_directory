require 'directory'

describe "student directory" do 
	it 'prints header' do
		expect(self).to receive(:puts).with('Welcome to Student Directory')
		print_header
	end

	it 'has no students when we start' do
		expect(students).to be_empty
	end

	context 'asking for input' do

		it 'ask for a new student' do
			expect(self).to receive(:puts).with('Please enter your name')
			ask_name
		end

		it 'gets new student input' do
			input = 'Zoe'
			expect(self).to receive(:gets).and_return(input)
			expect(user_input).to eq 'Zoe'
		end

		it 'gets new student input removing the new line' do
			input = "Zoe\n"
			expect(self).to receive(:gets).and_return(input)
			expect(user_input).to eq "Zoe"
		end
	end

	context 'creating first student' do

		it 'creates a student with a name' do
			student = {name: 'Chloe'}
			expect(create_student_named('Chloe')).to eq student
		end
		
		it 'can add a student' do
			student = {name: 'Zoe'}
			add(student)
			expect(students).to eq [student]
		end
	end

	context 'with three students' do

		before do
			%w{Zoe Anna Catharina}.each do |name|
				add( { name: name } )
			end
		end

		it 'has three students' do
			expect(students).to eq [{name: 'Zoe'},{name: 'Anna'},{name: 'Catharina'}]
		end

		it 'returns the names of the students' do
			expect(student_names).to eq %w{Zoe Anna Catharina}
		end

		it 'prints students' do
			expect(self).to receive(:puts).with(student_names.join(', '))
			print_students
		end

		it 'prints the students when there are more' do
			add(create_student_named('Enrique'))
			expect(self).to receive(:puts).with(student_names.join(', '))
			print_students
		end

	end
	
	it 'prints footer' do
		expect(self).to receive(:puts).with("Overall, we have #{students.length} students.")
		print_footer
	end

end
