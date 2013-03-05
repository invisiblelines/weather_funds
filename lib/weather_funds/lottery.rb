module WeatherFunds
  
  class Lottery

    Winner = Struct.new(:name, :prize)
    
    attr_reader :name, :scheme
    
    def initialize(name, scheme)
      @name, @scheme = name, scheme
      @winners       = []
    end
    
    def winners
      @winners
    end
    
    def <<(winner)
      @winners << winner
    end
    
  end
  
end