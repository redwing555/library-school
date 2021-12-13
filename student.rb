require_relative('./person')

class Student < Person
    attr_accessor :classroom

    def initialize(age, classroom='None', name='Unknown', parent_permission: true)
        super(age, name, parent_permission)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end

# std = Student.new(19, 'Elite', 'akram')
# puts std.can_use_services?