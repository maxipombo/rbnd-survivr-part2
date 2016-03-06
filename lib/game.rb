class Game
  attr_reader :tribes # Game has tribes

  def initialize(tribe_1, tribe_2)
    @tribes = [tribe_1, tribe_2]
  end
end
