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

  # Merge returns new tribe
  def merge(new_tribe)
    new_tribe = Tribe.new(name: new_tribe, members: merge_members)
    clear_tribes
    @tribes << new_tribe
    new_tribe
  end

  def merge_members
    @tribes.map(&:members).flatten
  end

  # Individual immunity challenge
  def individual_immunity_challenge
    individuals = []
    @tribes.each do |tribe|
      individuals = individuals + tribe.members
    end
    individuals.sample
  end

end
