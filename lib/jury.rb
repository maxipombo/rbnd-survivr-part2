class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)

    # cast votes returns hash
    votes = {}

    finalists.each do |finalist|
      votes[finalist] = 0
    end

    # every vote puts to terminal
    @members.each do |member|
      vote = finalists.sample
      votes[vote] += 1
      puts "#{member} votes for #{vote}."
    end

    votes
  end
end
