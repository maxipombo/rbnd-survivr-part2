class Tribe
  attr_reader :name, :members # Tribe has name and members

  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]

    # Puts tribe creation
    puts "Tribe #{@name} has been created"
  end

  # Tribe to string
  def to_s
    @name
  end

  # Tribal council immune is not voted off and returns who was voted off
  def tribal_council(options={})
    immune = options[:immune]
    voted_off = @members.sample
    while voted_off == immune do
      voted_off = @members.sample
    end
    @members.delete(voted_off)
    voted_off
  end

end
