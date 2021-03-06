require_relative 'game'
require_relative 'tribe'
require_relative 'contestant'
require_relative 'jury'

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map! { |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: 'Pagong', members: @contestants.shift(10))
@hunapu = Tribe.new(name: 'Tagi', members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  initial_size = @borneo.size

  8.times do
    @borneo.immunity_challenge.tribal_council Hash.new
  end

  @bolsheviki = @borneo.merge('bolsheviki')
  @borneo.clear_tribes
  @borneo.add_tribe @bolsheviki

  return initial_size - @bolsheviki.size
end

def phase_two
  initial_size = @borneo.size
  immune       = Array.new

  3.times do
    @borneo.immunity_challenge.tribal_council :immune => immune
    immune.push @borneo.tribes.first.members.sample
  end

  @mensheviki = @borneo.merge('mensheviki')
  @borneo.clear_tribes
  @borneo.add_tribe @mensheviki
  return initial_size - @mensheviki.size
end

def phase_three
  initial_size = @borneo.size
  immune       = @jury

  7.times do
    immune.add_member @borneo.immunity_challenge.tribal_council :immune => immune
  end

  @merge_tribe = @borneo.merge('finalists')
  return initial_size - @merge_tribe.size
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge('Cello') # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 eliminations become jury members
finalists    = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
