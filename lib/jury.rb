require 'set'
require 'colorizr'

String.colorize

class Jury
  attr_accessor :members

  def initialize
    @members = Set.new
    @random  = Random.new
  end

  def add_member(contestant)
    @members.add contestant
  end

  def cast_votes(finalists)
    votes = Hash.new
    members.each do |member|
      votes[member] = finalists.sample
      puts "#{member}".blue + "votes " + "#{votes[member]}".red
    end

    counted = Hash.new(0)
    votes.each { |k, v| counted[v] += 1 }

    Hash[finalists.map { |finalist| [finalist, counted[finalist]] }]
  end

  def report_votes(votes)
    votes.each { |k, v| puts "#{k} - #{v}" }
  end

  def announce_winner(votes)
    highscore = votes.values.sort.last
    winner = votes.key highscore
    puts 'Winner is ' + winner.to_s.green
    return winner
  end
end