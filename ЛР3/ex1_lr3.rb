class Employer
    attr_accessor :name,
                  :birthDate,
                  :phoneNumber,
                  :adress,
                  :email,
                  :pasport,
                  :specialty,
                  :workExperience,
                  :nameLastWork,
                  :position,
                  :lastSalary

    def initialize name, birtDate, phoneNumber, adress, email, pasport, specialty, workExperience, nameLastWork, position, lastSalary
        @name = name
        @birthDate = birtDate
        @phoneNumber = phoneNumber
        @adress = adress
        @email = email
        @pasport = pasport
        @specialty = specialty
        @workExperience = workExperience
        if @workExperience == 0
            @nameLastWork = nil
            @position = nil
            @lastSalary = nil
        else
            @nameLastWork = nameLastWork
            @position = position
            @lastSalary = lastSalary
        end
    end

end


