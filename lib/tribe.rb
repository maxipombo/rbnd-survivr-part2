class Tribe
  attr_reader :name, :members # Tribe has name and members

  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]

    # Puts tribe creation
    puts "Tribe #{@name} has been created"
  end
  
end
