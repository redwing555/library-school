require_relative '../lib/classes/person'
describe Person do

    context 'Instance for Person class' do
        it 'should instantiate the Person class correctly' do
            person = Person.new(age: 14, name: "Ruby", parent_permission: true)
    
            expect(person.age).to eq 14
            expect(person.name).to eq 'Ruby'
            expect(person.parent_permission).to eq true
        end
    
        it 'should capitalize the name and trim it to ten characters' do
            person = Person.new(age: 57, name: "wolfeschlegelsteinhausenbergerdorff", parent_permission: true)
    
            expect(person.validate_name).to eq 'Wolfeschle'
        end
    
        it 'should check if person can use service' do
            person1 = Person.new(age: 14, name: "Ruby", parent_permission: true)
            person2 = Person.new(age: 57, name: "Wolfeschle", parent_permission: true)
    
            expect(person1.can_use_services?).to be false
            expect(person2.can_use_services?).to be true
        end
    end
    

end
