require './person'

class Teacher < Person
    attr_accessor :specialization
    
    def initialize(age, specialization = 'None', name = 'Unknown', parent_permission: true)
        super(age,name,parent_permission)
        @specialization = specialization
    end

    def can_use_services?
        true
    end
end

philo = Teacher.new(50,'philosophy','Aristotle')
