class Tribe
  attr_reader :name, :members

  def initialize(params)
    @name    = params[:name]
    @members = params[:members]

    puts self
  end

  def to_s
    @name
  end

  def tribal_council(options)
    @members.delete (@members.select { |member| !options[:immune].eql? member }.sample)
  end
end