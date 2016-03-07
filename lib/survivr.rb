require 'bundler/setup'
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require 'colorizr'

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases

def phase_one
  puts "*** Phase one ***".blue
  council_elimination = []
  8.times do |round|
    loosers = @borneo.immunity_challenge
    council_elimination << loosers.tribal_council
  end
  return council_elimination.length
end

def phase_two
  phase_two_elimination = []
  puts "*** Phase two ***".blue
  3.times do |round|
    immunity_winner = @merge_tribe.individual_immunity_challenge
    phase_two_elimination << @merge_tribe.tribal_council(immune: immunity_winner)
  end
  return phase_two_elimination.length
end

def phase_three
  puts "*** Phase three ***".blue
  7.times do |round|
    immunity_winner = @merge_tribe.individual_immunity_challenge
    @jury.add_member(@merge_tribe.tribal_council(immune: immunity_winner))
  end
  return @jury.members.length
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists

puts "*** Jury members report votes ***".blue
vote_results = @jury.cast_votes(finalists) #Jury members report votes

puts "*** Jury announces their votes ***".blue
@jury.report_votes(vote_results) #Jury announces their votes

puts "*** Jury announces final winner ***".blue
@jury.announce_winner(vote_results) #Jury announces final winner
