require_relative '../lib/classes/student'
require_relative '../lib/classes/classroom'

require 'json'


describe Student do

    context 'testing a Student class' do
        it 'should instantiate the class Student' do
            student =Student.new(age:15,name:"Bob", parent_permission:true)
            expect(student.age).to eq 15
            expect(student.name).to eq 'Bob'
            expect(student.parent_permission).to eq true
        end

        it 'play hook method test' do
            student =Student.new(age:15,name:"Bob", parent_permission:true)
            expect(student.play_hooky).to eq "¯\(ツ)/¯"
        end

        it 'relation exists between classroom and student' do
            
            student1 =Student.new(age:14,name:"Bobby", parent_permission:false)
            student2 =Student.new(age:10,name:"John", parent_permission:true)

            physics_classroom = Classroom.new('Physics')

            student1.classroom = physics_classroom
            student2.classroom = physics_classroom


            expect(student1.classroom).to eq physics_classroom
            expect(student2.classroom).to eq physics_classroom

            expect(physics_classroom.students[0]).to eq student1
            expect(physics_classroom.students[1]).to eq student2
        end

        
        it 'json state values should equal to class instance values' do
            student =Student.new(age:15,name:"Bob", parent_permission:true)
            
            expect(JSON.parse(student.to_json)['classname']).to eq student.class.to_s
            expect(JSON.parse(student.to_json)['name']).to eq student.name
            expect(JSON.parse(student.to_json)['age']).to eq student.age
            expect(JSON.parse(student.to_json)['parent_permission']).to eq student.parent_permission
            expect(JSON.parse(student.to_json)['classroom']).to eq student.classroom
        end
    end
end