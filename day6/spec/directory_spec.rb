require 'directory'

describe "student directory" do 
	it 'prints header' do
		expect(self).to receive(:puts).with('Welcome to Student Directory')
		print_header
	end

	it 'has no students when we start' do
		expect(students).to be_empty
	end

	it 'can add a student' do
		student = {name: 'Zoe'}
		add(student)
		expect(students).to eq [student]
	end

	context 'with three students' do

		before do
			%w{Zoe Anna Catharina}.each do |name|
				add({name: name})
			end
		end

		it 'returns the names of the students' do
			expect(student_names).to eq %w{Zoe Anna Catharina}
		end

		it 'prints students' do
			expect(self).to receive(:puts).with(student_names.join(', '))
			print_students
		end
	end

end
