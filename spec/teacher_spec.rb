require_relative '../lib/classes/teacher'
require 'json'


describe Teacher do

    context 'testing a Teacher class' do
        it 'should instantiate the class teacher' do
            teacher =Teacher.new(age:45,name:"Marc", specialization:"Math")
            expect(teacher.age).to eq 45
            expect(teacher.name).to eq 'Marc'
            expect(teacher.specialization).to eq 'Math'

        end

        it 'should return always true for can_use_services' do
            teacher =Teacher.new(age:45,name:"Marc", specialization:"Math")
            expect(teacher.can_use_services?).to eq true
        end

        
        it 'json state values should equal to class instance values' do
            teacher =Teacher.new(age:45,name:"Marc", specialization:"Math")
            
            expect(JSON.parse(teacher.to_json)['classname']).to eq teacher.class.to_s
            expect(JSON.parse(teacher.to_json)['name']).to eq teacher.name
            expect(JSON.parse(teacher.to_json)['age']).to eq teacher.age
            expect(JSON.parse(teacher.to_json)['parent_permission']).to eq teacher.parent_permission
            expect(JSON.parse(teacher.to_json)['specialization']).to eq teacher.specialization
        end
    end
end