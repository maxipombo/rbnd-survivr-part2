class Game
  attr_reader :tribes # Game has tribes

  def initialize(tribe_1, tribe_2)
    @tribes = [tribe_1, tribe_2] # Is an array
  end

  # Method Add tribe
  def add_tribe(tribe)
    @tribes << tribe
  end

  # Method immunity challenge
  def immunity_challenge
    @tribes.sample
  end

  # Method clear tribes
  def clear_tribes
    @tribes.clear
  end

end
