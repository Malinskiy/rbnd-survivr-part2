class Game
  attr_reader :tribes

  def initialize(*tribes)
    @tribes = tribes
    @random = Random.new
  end

  #
  def merge(new_tribe_name)
    challanges      = 8
    all_contestants = tribes.map { |tribe| tribe.members }.flatten

    challanges.times do |idx|
      all_contestants.delete_at @random.rand(all_contestants.length - idx)
    end

    Tribe.new({:name => new_tribe_name, :members => all_contestants})
  end

  def add_tribe(tribe)
    @tribes.push tribe
  end

  def immunity_challenge
    @tribes.sample
  end

  def clear_tribes
    @tribes.clear
  end

  def individual_immunity_challenge
    immunity_challenge.members.first
  end
end