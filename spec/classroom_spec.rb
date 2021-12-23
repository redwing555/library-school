require_relative '../lib/classes/classroom'

describe Classroom do
  context 'testing a classroom class' do
    it 'should create new classroom instance correctly' do
      classroom = Classroom.new('Philosophy')
      expect(classroom.label).to eq 'Philosophy'
    end
  end

  context 'testing a classroom class' do
    it 'should add student to classroom' do
      classroom = Classroom.new('Philosophy')

      expect(classroom.students).to eq []
      classroom.add_student(Student.new(age: 18, name: 'bob', parent_permission: true))
      expect(classroom.students[0].name).to eq 'bob'
    end
  end
end
