class Game
  attr_reader :tribes

  def initialize(*tribes)
    @tribes = tribes
    @random = Random.new
  end

  #
  def merge(new_tribe_name)
    all_contestants = tribes.map { |tribe| tribe.members }.flatten
    Tribe.new({:name => new_tribe_name, :members => all_contestants})
  end

  def size
    size = 0
    @tribes.each { |tribe| size += tribe.size }
    return size
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