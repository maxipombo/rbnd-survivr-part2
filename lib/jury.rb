class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)

    # Cast votes returns hash
    votes = {}

    finalists.each do |finalist|
      votes[finalist] = 0
    end

    # Every vote puts to terminal
    @members.each do |member|
      vote = finalists.sample
      votes[vote] += 1
      puts "#{member} votes for #{vote}."
    end

    votes
  end

  # Report votes puts score for each finalist
  def report_votes(votes)
    votes.each do |finalist, total_votes|
      puts "#{finalist} received #{total_votes}"
    end
  end

  # Announce winner
  def announce_winner(votes)
    winner = votes.max_by { |finalist, total_votes| total_votes }[0]
    puts "#{winner} has won Survivr!"
    winner
  end
end
