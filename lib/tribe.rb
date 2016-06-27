require 'colorizr'

String.colorize

class Tribe
  attr_reader :name, :members

  def initialize(params)
    @name    = params[:name]
    @members = params[:members]

    puts self
  end

  def name
    @name.green
  end

  def size
    @members.size
  end

  def to_s
    name
  end

  def tribal_council(options)
    immune = [*options[:immune]]

    sample = @members.select { |member| !immune.include? member }.sample
    @members.delete (sample)
  end
end