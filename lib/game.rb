class Game
  attr_reader :tribes # Game has tribes

  def initialize(tribe_1, tribe_2)
    @tribes = [tribe_1, tribe_2] # Is an array
  end

  # Method Add tribe
  def add_tribe(tribe)
    @tribes << tribe
  end
end
