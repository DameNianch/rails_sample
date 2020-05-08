class User
    attr_accessor :fname, :lname, :email
  
    def initialize(attributes = {})
      @name  = attributes[:name]
      @email = attributes[:email]
    end

    def fullname
        "#{@fname}, #{@lname}"
    end

    def formatted_email
      "#{@fullname} <#{@email}>"
    end
  end